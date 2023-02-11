--DEBUGWIP
--IHTearDown.lua
--Dumps data from mgsv globals
--Builds mock modules.
--Requires:
--IHGenKnownModuleNames
--IHGenModuleReferences
local this={}

this.debugModule=true

--TODO: knownmodulenames,infteardown,autodoc are kinda seperate from standard modules?

this.doDumpModules=true
this.buildFromScratch=false
this.dumpDir=[[C:\Projects\MGS\MockFox-TearDownDump\tpp\]]--tex output folder
--input
this.luaPath=[[E:\GameData\mgs\filetype-crush\lua\]]--tex unmodded lua, all in same folder
this.classesPath=[[d:\github\MockFox\MockFoxLua\LuaClasses[sais ida dump]_sorted.txt]]
this.exeModulesPath=[[d:\github\MockFox\MockFoxLua\log_exemodules.txt]]
--this.exeModulesPath=[[C:\Games\Steam\steamapps\common\MGS_TPP\loadfile_log.txt]]--tex DEBUGNOW VERIFY: cant open/GetLines when running from mgsv because log file still open by ihhook?

function this.PostAllModulesLoad()
  InfCore.Log("IHTearDown.PostAllModulesLoad")
  
  if this.doDumpModules then
    this.DumpModules({buildFromScratch=this.buildFromScratch})
  end
end

--NOTE: this should be run at least in ACC
--Some of the modules and some of the keys aren't up and running during start/start2nd.lua but are by ACC.
--So just relying on the initial PostAllModulesLoad wont cut it
function this.DumpModules(options)
  local globalsByType=this.GetGlobalsByType(IHGenKnownModuleNames)
  if this.debugModule then
    InfCore.PrintInspect(globalsByType,"globalsByType")
  end
  InfCore.PrintInspect(globalsByType.other,"globalsByType.other")--tex TODO: check this out

  --tex NOTE internal C tables/modules exposed from MGS_TPP.exe are kinda funky,
  --(see ghidra, calls to AddCFuncToModule, AddEnumToModule)
  --a few are normal, plain text keys as you'd expect.
  --most are doing something with indexing metatables via some custom class binding i guess
  --the most common is fox table (for want of an actual term)
  --module having [some-number] entries
  --module having entry which has [some-number] entries
  --some-number doesnt seem to be strcode32, might possibly be luastring hash itself --TODO: figure it out
  --TODO: figure out any difference between entries in root vs in [-285212671]
  --possibly enums vs c funcs
  
  --some times its [-285212671][key name] which is a normal name (most often for enum [name]=value, where value is actually a function to return the enum? weird)
  --TODO: are there any enum entries in module root same as above?
  
  --many have a _classname string, these have plain text keys/dont have the some-number indirection

  --theres also a [-285212672]=some-number, but dont know what it represents
  
  --REF
  --WeatherManager = <345>{
  --  [-285212672] = 4,--tex unknown
  --  [-285212671] = {--tex identifies a table of some-number entries
  --    [7955555] = <function 5831>,
  --    [16841280] = <function 5832>,
  --    [27347291] = <function 5833>,
  --    [32365128] = <function 5834>,
  --    [44558204] = <function 5835>,
  --    [77837453] = <function 5836>,
  --    [96882270] = <function 5837>,
  --    [179540398] = <function 5838>,
  --    [184160756] = <function 5839>,
  --    [226237853] = <function 5840>
  --  },
  --  --tex some-number entries directly in module root
  --  [11568137] = <function 5841>,
  --  [26595625] = <function 5842>,
  --  [26595645] = <function 5843>,
  --  [49591366] = <function 5844>,
  --  [62144975] = <function 5845>,
  --  ...
  
  --for (script)var entries 
  --[-285212666] is array size/count
  --[-285212665] is (indexed from 0) array
  
  --REF
  --customizedWeaponSlotIndex = <396>{
  --  [-285212666] = 3,
  --  [-285212665] = <userdata 43>,
  
  local mockModules=this.BuildMockModules(globalsByType.table)
  if this.debugModule then
    InfCore.PrintInspect(mockModules,"mockModules")--DEBUG
  end
  
  --tex process log file created by ihhook/exe hooking of module creation functions into a more useful table
  local exeModules=this.BuildModulesFromExeLog(this.exeModulesPath)--tex TODO dump this
  --if this.debugModule then
  InfCore.PrintInspect(exeModules,"exeModules")
  --end

  --tex NOTE: takes a fair while to run. Run it once, then use the resulting combined table .lua (after copying it to MGS_TPP\mod\modules and loading it) --DEBUGNOW
  --open ih_log.txt in an editor that live refreshes to see progress
  local moduleReferences
  if options.buildFromScratch==true then
    --tex scrapes module references from lua files
    moduleReferences=this.GetModuleReferences(globalsByType.table)
    if this.debugModule then
      InfCore.PrintInspect(moduleReferences,"moduleReferences")--DEBUG
    end
  else
    --tex use module previously built/saved from above process
    moduleReferences=IHGenModuleReferences--ASSUMPTION output of above has been loaded as a module
    if this.debugModule then
      InfCore.PrintInspect(moduleReferences,"moduleReferences")--DEBUG
    end
  end

  local mockModulesFromRefs,noLiveFound,noReferenceFound=this.BuildMockModulesFromReferences(globalsByType.table,moduleReferences)
  InfCore.PrintInspect(noLiveFound,"noLiveFound")
  InfCore.PrintInspect(noReferenceFound,"noReferenceFound")

  local nonLiveClasses=this.FindNonLiveClasses(this.classesPath)
  InfCore.PrintInspect(nonLiveClasses,"nonLiveClasses")

  InfCore.Log("combine mockModulesFromRefs to mockModules")
  for moduleName,module in pairs(mockModulesFromRefs) do
    for k,v in pairs(module)do
      if not mockModules[moduleName] then
        InfCore.Log(moduleName.." could not find module in mockmodules")
      elseif not mockModules[moduleName][k] then
        mockModules[moduleName][k]=v
      end
    end
  end

  local missedModules={}
  for name,module in pairs(globalsByType.table)do
    if not mockModules[name] then
      missedModules[name]=true
    end
  end

  if vars.missionCode<=5 then
    InfCore.Log("vars.missionCode<=5, will not output dump files")
    return
  end
  if isMockFox then
    InfCore.Log("isMockFox, will not output dump files")
    return
  end

  local varsTable=this.DumpVars()

  local svarsTable=this.DumpSaveVars(svars)

  local gvarsTable=this.DumpSaveVars(gvars)

  local mvarsTable=mvars

  --DEBUGNOW compare svars and gvars vs what entries are defined lua side to see if we're missing something/or anything is added exe side
  --GOTCHA: these will include IH s/gvars?
  --DEBUGNOW this stuff really needs to be run in-mission, via a reloadscripts or on command
  local gvarsDeclaredTable=nil
  if TppMain.allSvars==nil then
    InfCore.Log("WARNING: DumpModules TppMain.allSvars==nil")
  else
    this.DumpVarsDeclareTable(TppMain.allSvars)
  end
  local gvarsDeclaredTable=nil
  if TppGVars==nil then--tex modules are up and running / postallmodules is before tppgvars is loaded
    InfCore.Log("WARNING: DumpModules TppGVars==nil")
  else
    if TppGVars.DeclareGVarsTable==nil then
      InfCore.Log("WARNING: DumpModules TppGVars.DeclareGVarsTable==nil")
    else
      this.DumpVarsDeclareTable(TppGVars.DeclareGVarsTable)
    end
  end

  --tex write dumps
  local header={
    [[--ModulesDump.lua]],
    [[--GENERATED by IHTearDown]],
    [[--Straight Inspect dump of mgstpp global tables]],
  }
  local outDir=this.dumpDir..[[modulesDump\]]
  this.DumpToFiles(outDir,globalsByType.table)
  this.WriteTable(this.dumpDir.."ModulesDump.lua",table.concat(header,"\r\n"),globalsByType.table)

  if moduleReferences~=IHGenModuleReferences then--tex no point dumping a dump
    local header={
      [[--IHGenModuleReferences.lua]],
      [[--GENERATED by IHTearDown.DumpModules > GetModuleReferences]],
      [[--is scrape of references to modules in .lua files]],
    }
  local outDir=this.dumpDir..[[moduleReference\]]
  this.DumpToFiles(outDir,moduleReferences)
  this.WriteTable(this.dumpDir.."IHGenModuleReferences.lua",table.concat(header,"\r\n"),moduleReferences)
  end

  local header={
    [[--IHGenMockModules.lua]],
    [[--GENERATED by IHTearDown from running mgs combined with scrapes of .lua files for further module references (due to internal mgs_tpp modules indexing crud, see NOTE in DumpModules)]],
  }
  local outDir=this.dumpDir..[[mockModules\]]
  this.DumpToFiles(outDir,mockModules)
  this.WriteTable(this.dumpDir.."IHGenMockModules.lua",table.concat(header,"\r\n"),mockModules)

  local header={
    [[--IHGenUnfoundReferences.lua]],
    [[--GENERATED by IHTearDown BuildMockModulesFromReferences]],
    [[--references from IHGenModuleReferences that werent found in live session]],
  }
  this.WriteTable(this.dumpDir.."IHGenUnfoundReferences.lua",table.concat(header,"\r\n"),noLiveFound)

  --tex mostly the same as below but whatev
  local header={
    [[--IHGenUnfoundLive.lua]],
    [[--GENERATED by IHTearDown BuildMockModulesFromReferences]],
    [[--references from live session that werent found in IHGenModuleReferences]],
  }
  this.WriteTable(this.dumpDir.."IHGenUnfoundLive.lua",table.concat(header,"\r\n"),noReferenceFound)

  local header={
    [[--IHGenUnfoundLiveClassesIda.lua]],
    [[--GENERATED by IHTearDown BuildMockModulesFromReferences]],
    [[--references from LuaClasses[ida dump] that werent in live session ]],
  }
  this.WriteTable(this.dumpDir.."IHGenUnfoundLiveClassesIda.lua",table.concat(header,"\r\n"),nonLiveClasses)

  local header={
    [[--IHMissedModules.lua]],
    [[--GENERATED by IHTearDown]],
    [[--global module names that werent in generated mockmodules]],
  }
  this.WriteTable(this.dumpDir.."IHMissedModules.lua",table.concat(header,"\r\n"),missedModules)

  local header={
    [[--vars.lua]],
    [[--GENERATED by IHTearDown.DumpVars]],
    [[--Note: indexed from 0 like actual vars]],
    [[--dump of vars during missionCode:]]..vars.missionCode,
  }
  this.WriteTable(this.dumpDir.."\\varsDump\\".."vars.lua",table.concat(header,"\r\n"),varsTable)

  local header={
    [[--svars.lua]],
    [[--GENERATED by IHTearDown.DumpSaveVars]],
    [[--Note: indexed from 0 like actual vars]],
    [[--dump of vars during missionCode:]]..vars.missionCode,
  }
  this.WriteTable(this.dumpDir.."\\varsDump\\".."svars.lua",table.concat(header,"\r\n"),svarsTable)

  local header={
    [[--gvars.lua]],
    [[--GENERATED by IHTearDown.DumpSaveVars]],
    [[--Note: indexed from 0 like actual vars]],
    [[--dump of vars during missionCode:]]..vars.missionCode,
  }
  this.WriteTable(this.dumpDir.."\\varsDump\\".."gvars.lua",table.concat(header,"\r\n"),gvarsTable)

  local header={
    [[--mvars.lua]],
    [[--using Inspect]],
    [[--dump of vars during missionCode:]]..vars.missionCode,
  }
  this.WriteTable(this.dumpDir.."\\varsDump\\".."mvars.lua",table.concat(header,"\r\n"),mvarsTable)

  local entityClassDictionary=this.DumpEntityClassDictionary()
  local header={
    [[--IHGenEntityClassDictionary.lua]],
    [[--GENERATED by IHTearDown DumpEntityClassDictionary]],
    [[--dump of EntityClassDictionary.GetCategoryList, GetClassNameList]],
  }
  this.WriteTable(this.dumpDir.."IHGenEntityClassDictionary.lua",table.concat(header,"\r\n"),entityClassDictionary)
end

--tex breaks down global variables by type
--IN/SIDE: 
--IHGenKnownModuleNames - IHGenKnownModuleNames.lua --tex lists of known module names (mostly just from filenames)
--_G
--OUT: globalsByType={
--  function={--mostly lua api functions to ignore},
--  other = {
--    NULL = <userdata 1>,
--    _U = true
--  },
--  string = {
--    _VERSION = "Lua 5.1"
--  },
--  table = {
--    ActionIcon = <1>{
--      [-285212672] = 4,
--      [-285212671] = {
--        [5310743] = <function 30>,
--        [14142738] = <function 31>,
--        [38688152] = <function 32>,
--        [51915283] = <function 33>,
--        [92404869] = <function 34>,
--        [190450020] = <function 35>,
--        [209618403] = <function 36>,
--        [218629119] = <function 37>,
--        [238989459] = <function 38>,
--        [245193663] = <function 39>,
--        [248254538] = <function 40>
--      },
--      __index = <function 41>,
--      __newindex = <function 42>,
--      <metatable> = <table 1>
--    },
--    ... other modules, what we're actually insterested in
--}
function this.GetGlobalsByType(ModuleNames)
  --tex names of tables in KnownModuleNames to skip
  local skipModuleTableNames={
    "ihInternal",
    "ihExternal",
    "ihModelInfo",
    "tppInternal",
    "ssdinternal",
    "luaInternal",
  }

  local skipModuleNames={
    _G=true,
    package=true,
    this=true,
  }

  local globalsByType={
    ["table"]={},
    ["function"]={},
    ["string"]={},
    other={},
  }
  local globalFunctions={}
  local globalTables={}
  local globalOther={}
  for k,v in pairs(_G)do
    local addEntry=true
    for i,moduleNameTable in ipairs(skipModuleTableNames)do
      if ModuleNames[moduleNameTable] and ModuleNames[moduleNameTable][k] then
        addEntry=false
        break
      end
    end

    if skipModuleNames[k] then
      addEntry=false
    end

    --tex theres some strange edge cases where theres a provided lua, but also an exe internal module of that name
    if ModuleNames.exeInternal[k] then
      addEntry=true
    end

    if addEntry then
      local globalsOfType=globalsByType[type(v)]
      globalsOfType=globalsOfType or globalsByType.other
      globalsOfType[k]=v
    end
  end
  return globalsByType
end--GetGlobalsByType

--tex breaks down modules keys by type
function this.GetModuleKeysByType(modules)
  InfCore.Log("GetModuleKeysByType")
  local breakDown={}
  for moduleName,module in pairs(modules)do
    local tableInfo={
      stringKeys={},
      numberKeys={},
    }
    local function GetTableKeys(checkTable,tableInfo)
      for key,value in pairs(checkTable)do
        if type(key)=="string" then
          table.insert(tableInfo.stringKeys,key)
        elseif type(key)=="number" then
          table.insert(tableInfo.numberKeys,key)
          if type(value)=="table" then
            GetTableKeys(value)
          end
        end
      end
    end

    GetTableKeys(module,tableInfo)

    if #tableInfo.numberKeys>0 then
      breakDown[moduleName]=tableInfo
    end
  end
end

--tex scrapes module references from lua files
--DEBUGNOW REWORK
--just do a straight search for . : and build up it's own module names, that way it can also catch stuff like CyprRailActionDataSet that only calls via a variable
--break lines on ")", "}", "]", "=", ","??
--," " -- would be nice, but would miss cases such as 'blah.Functionname ('
--for brokenLines
--refpos = findfirst '.'
--type=normalref
--refpos = findfirst ':'
--type=selfref

--DEBUGNOW DOES delims/split remove the delim chars from the lines??

--from refpos left/decement/toward start of line
--objstartPos=find/breakup string by anything not alphanumeric or start of line
--what if is ..? -- that would be objstartPos==refpos?
--objectName = refPos to objstartPos

--from refPos right/increment/toward end of line
--memberEndPos =find/break on alphanumeric or end of line
--" ",???
--what if 'blah.Functionname (' or 'blah.Functionname<tab>(' ??

function this.GetModuleReferences(modules)
  InfCore.Log("GetModuleReferences")

  --tex get paths of lua files ASSUMPTION: all lua files in one folder/no subfolders
  local outName="luaFileList.txt"

  local startTime=os.clock()

  local cmd=[[dir /s /b "]]..this.luaPath..[[*.lua" > "]]..this.luaPath..outName..[["]]
  InfCore.Log(cmd)
  os.execute(cmd)

  local luaFilePaths=InfCore.GetLines(this.luaPath..outName)
  --InfCore.PrintInspect(luaFilePaths,"luaFilePaths")--DEBUG

  local numFiles=#luaFilePaths

  local refs={}
  for i,filePath in ipairs(luaFilePaths)do
    InfCore.Log("["..i.."//"..numFiles.."] "..filePath)--DEBUG
    local lines=InfCore.GetLines(filePath)
    for i,fileLine in ipairs(lines)do
      for moduleName,moduleInfo in pairs(modules)do
        local fileLine=fileLine

        --tex break up lines
        local brokenLines={}
        local delim = {
          ",", " ", "\n", "%]", "%)", "}", "\t",
          "%+","-",">","<","=","/","%*","~","%%",
          "'","\"","{","%(","%[",
        }
        local pattern = "[^"..table.concat(delim).."]+"
        for w in fileLine:gmatch(pattern) do
          --InfCore.Log(w)
          table.insert(brokenLines,w)
        end

        --InfCore.Log("looking for "..moduleName)--DEBUGNOW
        for i,line in ipairs(brokenLines)do
          local findIndex,findEndIndex=string.find(line,moduleName)
          while(findIndex~=nil)do
            local findEndIndex=findIndex+string.len(moduleName)
            line=string.sub(line,findEndIndex)
            local nextChar=string.sub(line,1,1)
            --InfCore.Log("find: "..moduleName.. " line:"..line)--DEBUGNOW
            --InfCore.Log("find: "..moduleName.. " nextChar:"..nextChar)--DEBUGNOW
            if nextChar=="." or nextChar==":" then
              --DEBUGNOW TODO: handle + - < > == number (can + be concat string too?)

              --              local keyType
              --              if line:find("%(") then
              --                keyType="function"
              --                key=key:sub(1,key:len()-1)
              --              elseif line:find("%[") then
              --                keyType="table"
              --                key=key:sub(1,key:len()-1)
              --             elseif line:find("%:") then--DEBUGNOW
              --                --keyType=""--tex most likely a comment
              --                key=key:sub(1,key:len()-1)
              --              elseif line:find("=") then
              --                if line:find("={") then
              --                  keyType="table"
              --                elseif line:find("='") then
              --                  keyType="string"
              --                elseif line:find("=\"") then
              --                  keyType="string"
              --                end
              --                --tex =something is unknown, could be any type being assigned to it
              --                local endIndex=line:find("=")
              --                key=key:sub(1,endIndex-2)
              --              end

              local key=string.sub(line,2)--tex strip leading .

              local keyEndIndex=string.find(key,"[%.:]")
              if keyEndIndex then
                key=string.sub(key,1,keyEndIndex-1)
              end

              local nextChar=string.sub(key,1,1)
              if findIndex==1 then--DEBUGNOW
                if key~="" and type(nextChar)~="number"then
                  refs[moduleName]=refs[moduleName]or{}
                  refs[moduleName][key]=true
              end
              end
            end

            findIndex=string.find(line,moduleName)
            --InfCore.Log(findIndex)--DEBUGNOW
          end
        end
      end
    end
  end

  InfCore.Log(string.format("GetModuleReferences completed in: %.2f", os.clock() - startTime))

  return refs
end

--modules: globalsByType.table (_G entries of type table)
--OUT: mockModules
function this.BuildMockModules(modules)
  local mockModules={}
  
  local foxTableIdent=-285212671
  local ignoreNumKeys={
    [-285212672]=true,
  }

  local ignoreModules={
    vars=true,
    cvars=true,
    gvars=true,
    svars=true,
    mvars=true,
  }

  local ignoreKeys={
    --    __call=true,
    --    __newindex=true,
    --    __index=true,
    }

  for moduleName,module in pairs(modules)do
    if not ignoreModules[moduleName] then
      mockModules[moduleName]={}
      for k,v in pairs(module)do
        --NOTE only string keys to skip userdata/indexified modules keys, see NOTE in DumpModules
        if type(k)=="string" then
          if not ignoreKeys[k] then
            if type(v)=="function" then
              mockModules[moduleName][k]="<function>"
            elseif type(v)=="table" then
              mockModules[moduleName][k]="<table>"
            elseif type(v)=="userdata" then
              mockModules[moduleName][k]="<userdata: "..tostring(v)..">"
            else
              mockModules[moduleName][k]=v
            end
          end
        elseif type(k)=="number"then
          if not ignoreNumKeys[k]then
          
          end
        end--if type(k)
      end--for module
    end--ignoremodules
  end--for modules
  return mockModules
end--BuildMockModules

--exeLogPath: ihhook log_exemodules.txt
--which hooks UnkNameModule, AddCFuncToModule2, AddEnumToModule2 which are called by RegisterLuaModule<module name> functions
--REF log_modulecreation.txt
--...
--module: ScriptBlock
--enum: SCRIPT_BLOCK_STATE_EMPTY=0
--enum: SCRIPT_BLOCK_STATE_PROCESSING=1
--enum: SCRIPT_BLOCK_STATE_INACTIVE=2
--enum: SCRIPT_BLOCK_STATE_ACTIVE=3
--enum: TRANSITION_LOADED=0
--enum: TRANSITION_ACTIVATED=1
--enum: TRANSITION_DEACTIVATED=2
--enum: TRANSITION_EMPTIED=3
--func: GetScriptBlockId
--func: GetCurrentScriptBlockId
--func: Load
--func: Reload
--func: Activate
--func: Deactivate
--func: IsProcessing
--func: GetScriptBlockState
--func: UpdateScriptsInScriptBlocks
--func: ExecuteInScriptBlocks
--...
function this.BuildModulesFromExeLog(exeLogPath)
  InfCore.Log("BuildModulesFromExeLog")
  local modules={}
  local lines=InfCore.GetLines(exeLogPath)
  local lastLineType=""
  local currentModuleName=""
  local currentModule=nil
  for i,line in ipairs(lines)do
    local findIndex,findEndIndex=string.find(line,":")
    if findIndex~=nil then
      local lineType=string.sub(line,1,findEndIndex-1)
      local lineInfo=string.sub(line,findEndIndex+1,-1)
      --InfCore.Log(i.." lineType:'"..tostring(lineType).."' lineInfo:'"..lineInfo.."'")
      if lineType=="module"then
        currentModuleName=lineInfo
        if modules[currentModuleName] then
          InfCore.Log("WARNING: BuildModulesFromExeLog: "..currentModuleName.." module already defined")
        end
        currentModule=modules[currentModuleName] or {enums={},funcs={}}
        modules[currentModuleName]=currentModule
      elseif lineType=="enum"then
        local findIndex,findEndIndex=string.find(lineInfo,"=")
        local enumName=string.sub(lineInfo,1,findEndIndex-1)
        local enumValue=string.sub(lineInfo,findEndIndex+1,-1)
        --InfCore.Log(i.." enumName:'"..tostring(enumName).."' enumValue:'"..enumValue.."'")
        if currentModule.enums[enumName] then
          InfCore.Log("WARNING: BuildModulesFromExeLog: module "..currentModuleName.." enum "..enumName.." already defined")
        end
        currentModule.enums[enumName]=enumValue--tex TODO to num?
      elseif lineType=="func"then
        if currentModule.funcs[lineInfo] then
          InfCore.Log("WARNING: BuildModulesFromExeLog: module "..currentModuleName.." func "..lineInfo.." already defined")
        end
        currentModule.funcs[lineInfo]=true      
      end
      
      lastLineType=lineType
    end 
  end
  return modules
end--BuildModulesFromExeLog

function this.BuildMockModulesFromReferences(liveModules,moduleReferences)
  InfCore.Log("BuildMockModulesFromReferences")
  local mockModules={}

  local ignoreModules={
    vars=true,
    cvars=true,
    gvars=true,
    svars=true,
    mvars=true,
  }

  local ignoreKeys={
    __call=true,
    __index=true,
    __newindex=true,
    _className=true,
    [-285212671]=true,
    [-285212672]=true,
    }

  local noLiveFound={}
  local noReferenceFound={}

  for referenceModuleName,referenceModule in pairs(moduleReferences)do
    if not ignoreModules[referenceModuleName] then
      mockModules[referenceModuleName]={}
      if not liveModules[referenceModuleName] then
        InfCore.Log("Could not find module '"..referenceModuleName.."' from moduleReferences in livemodules")
        noLiveFound[referenceModuleName]=true
      else
        local liveModule=liveModules[referenceModuleName]
        for k,v in pairs(referenceModule)do
          local liveValue=liveModule[k]
          if liveValue==nil then
            InfCore.Log(referenceModuleName.." could not find live key "..tostring(k))
            noLiveFound[referenceModuleName]=noLiveFound[referenceModuleName] or {}
            noLiveFound[referenceModuleName][k]=true
          elseif type(k)=="string" then
            if not ignoreKeys[k] then
              if type(liveValue)=="function" then
                mockModules[referenceModuleName][k]="<function>"
              elseif type(liveValue)=="table" then
                mockModules[referenceModuleName][k]="<table>"
              elseif type(liveValue)=="userdata" then
                mockModules[referenceModuleName][k]="<userdata: "..tostring(liveValue)..">"
              else
                mockModules[referenceModuleName][k]=liveValue
            end
            end--if not ignorekey
          end--if livevalue
        end--for referencemodule k,v
      end--if module
    end--if not ignoremodule
  end--for modulereferences

  for liveModuleName,liveModule in pairs(liveModules)do
    if not moduleReferences[liveModuleName] then
      InfCore.Log("Could not find module '"..liveModuleName.."' from moduleReferences in livemodules")
      noReferenceFound[liveModuleName]=true
    else
      local referenceModule=moduleReferences[liveModuleName]
      for k,v in pairs(liveModule)do
        local referenceValue=referenceModule[k]
        if not ignoreKeys[k] then
          if referenceValue==nil then
            InfCore.Log(liveModuleName.." could not find reference key "..tostring(k))
            noReferenceFound[liveModuleName]=noReferenceFound[liveModuleName] or {}
            noReferenceFound[liveModuleName][k]=true
          end
        end
      end
    end
  end--for livemodules

  return mockModules,noLiveFound,noReferenceFound
end

function this.GetPlainTextModules(modules)
  local plainTextModules={}

  local ignoreKeys={
    __call=true,
    __newindex=true,
    __index=true,
  }

  for moduleName,module in pairs(modules)do
    for k,v in pairs(module)do
      if type(k)=="string" then
        if not ignoreKeys[k] then
          plainTextModules[moduleName]=true
        end
      end
    end
  end

  return plainTextModules
end

function this.DumpVars()
  local vars=vars
  --tex see note in DumpModules
  local rootArrayIdent=-285212671--tex of vars

  local arrayIdent=-285212665--tex table key is an array
  local arrayCountIdent=-285212666--tex array size/count

  local varsTable={}

  for k,v in pairs(vars[rootArrayIdent])do
    varsTable[k]=vars[k]
  end

  local skipKeys={
    __index=true,
    __newindex=true,
  }

  for k,foxTable in pairs(vars)do
    --tex is actually a foxTable
    if type(foxTable)=="table" then
      if foxTable[arrayCountIdent] then
        --InfCore.Log("found foxTable "..k)--DEBUGNOW
        if type(k)=="string" then
          if not skipKeys[k] then
            local foxTableArray=foxTable[arrayIdent]
            if foxTableArray then
              varsTable[k]={}
              local arrayCount=foxTable[arrayCountIdent]
              --InfCore.Log("arrayCount="..arrayCount)--DEBUGNOW
              for i=0,arrayCount-1 do
                varsTable[k][i]=vars[k][i]
              end
            end--if foxTableArray
          end--not skipKeys
        end--k==type string
      end--if foxTable[arrayCountIndex]
    end--foxTable==type table
  end--for vars

  return varsTable
end--DumpVars

function this.FindNonLiveClasses(classesPath)
  local nonLiveClasses={}
  local classes=InfCore.GetLines(classesPath)
  for i,className in ipairs(classes)do
    if className~="" then
      if not _G[className] then
        table.insert(nonLiveClasses,className)
            end
          end
        end
  table.sort(nonLiveClasses)
  return nonLiveClasses

end

--tex svars,gvars use same layout
function this.DumpSaveVars(inputVars)
  if inputVars==nil then
    InfCore.Log("DumpSaveVars inputVars==nil")
    return
  end

  local varsTable={}

  --tex svars.__as is non array vars
  for k,v in pairs(inputVars.__as)do
    varsTable[k]=v
  end

  --tex svars.__rt is array vars
  --REF
  --  __rt = {
  --      InterrogationNormal = {
  --      __vi = 224,
  --      <metatable> = <table 1>
  --    },
  for k,v in pairs(inputVars.__rt)do
    varsTable[k]={}
    local arraySize=v.__vi--DEBUGNOW not sure if this is right
    for i=0,arraySize-1 do
      varsTable[k][i]=inputVars[k][i]
    end
  end

  return varsTable
end--DumpSaveVars

--REF: TppGVars.DeclareGVarsTable ,TppMain.allSvars)
--  {name="str_isAllMissionSRankCleared",type=TppScriptVars.TYPE_BOOL,value=false,save=true,category=TppScriptVars.CATEGORY_GAME_GLOBAL},
--  {name="str_elapsedMissionCount",arraySize=TppDefine.ELAPSED_MISSION_COUNT_MAX,type=TppScriptVars.TYPE_INT8,value=-127,save=true,category=TppScriptVars.CATEGORY_GAME_GLOBAL},
function this.DumpVarsDeclareTable(varsDeclareTable)
  local dumpedTable={}
  for i,varDecl in ipairs(varsDeclareTable)do
    local value=varDecl.value or "NODEFAULTVALUE"
    if varDecl.arraySize~=nil then
      value="array:"..tostring(value)
    end
    dumpedTable[varDecl.name]=varDecl.value or "NODEFAULTVALUE"
  end--for varsDeclareTable
  return dumpedTable
end--DumpVarsDeclareTable

function this.DumpEntityClassDictionary()
  local entityClassNames={}

  local categoryList=EntityClassDictionary.GetCategoryList()

  for i,categoryName in ipairs(categoryList)do
    entityClassNames[categoryName]=EntityClassDictionary.GetClassNameList(categoryName)
  end

  return entityClassNames
end

local open=io.open
local Inspect=InfInspect.Inspect

local nl=[[\r\n]]
function this.WriteString(filePath,someString)
  local file,error=open(filePath,"w")
  if not file or error then
    return
  end

  file:write(someString)
  file:close()
end

--tex writes a table out to file with text header
function this.WriteTable(fileName,header,t)
  if t==nil then
    return
  end
  InfCore.Log("WriteTable "..fileName)

  local all=InfInspect.Inspect(t)
  all="local this="..all.."\r\n".."return this"
  if header then
    all=header.."\r\n"..all
  end

  this.WriteString(fileName,all)
end

function this.DumpToFiles(outDir,moduleTable)
  if moduleTable==nil then
    return
  end
  InfCore.Log("DumpToFiles "..outDir)

  for k,v in pairs(moduleTable) do
    local filename=outDir..k..'.txt'
    local ins=Inspect(v)
    this.WriteString(filename,k.."="..ins)
  end
end

return this
