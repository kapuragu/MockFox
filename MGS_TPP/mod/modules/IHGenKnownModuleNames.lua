--IHGenKownModuleNames
--GENERATED (partially, tables hand combined)


local this={}

--SYNC: IH interal module names
this.ihInternal={
  --InfInit=true, STATE global
  ivars=true,
  evars=true,
  igvars=true,
  ih_save=true,
  ih_mission_states=true,
  ih_quest_states=true,
  ih_priority_staff=true,
  --init=true, IHINTERNAL
  InfInitMain=true,
  InfInspect=true,
  InfUtil=true,
  InfCore=true,
  IvarProc=true,
  InfInit=true,  
  InfButton=true,
  InfModules=true,
  InfMain=true,
  InfHooks=true,
  --Tpp.requires
  InfRequiresStart=true,

  --other, external really
  plparts_dd_male_modelInfo=true,
}--ihInternal

this.ihHook={
  --IHHook r17 
  --SYNC: any modules added via luaI_openlib
  --could also change ihhook raw api setting of stuff to go through another function that also registers the names of what is being added
  --then could just look that up instead
  imgui=true,
  IHH=true,
  IhkBuddy=true,
  IhkCharacter=true,
  IhkFoxString=true,
  IhkVehicle=true,
  _IHHook_TestTable=true,
  _IHHook=true,
}

--tex generated by BuildIHExternalList on PostAllModulesLoad
this.ihExternal={}

this.luaInternal={
  --bit=true,--tex foxInternal I guess. the bit module is statically built into MGS_TPP
  ___lclass=true,
  ___lfunc=true,
  ___lnvar=true,
  ___lvar=true,
  coroutine=true,
  debug=true,
  io=true,
  math=true,
  os=true,
  string=true,
  table=true,
}

--tex theres some strange edge cases where theres a provided lua, but also an exe internal module of that name
--doesn't match the Scripts/Classes/%s.lua loading of Entity,Scene and Pad
--TODO: add a header to generated mocks noting this (that they also have .lua files)
this.exeInternal={
  TppCollection=true,
  Entity=true,
  Scene=true,
  Pad=true,
}

--tex from a dir > txt of all extracted lua names
--tex Entity,Scene,Pad have exe defined modules and matching lua file is also loaded and merged then
this.tppInternal={
  afgh=true,
  afgh_animal=true,
  afgh_base=true,
  afgh_baseTelop=true,
  afgh_checkPoint=true,
  afgh_combat=true,
  afgh_common_fx_mtr_def=true,
  afgh_common_fx_mtr_rain=true,
  afgh_common_fx_mtr_underwater=true,
  afgh_cpGroups=true,
  afgh_gimmick=true,
  afgh_landingZone=true,
  afgh_luxury_block_list=true,
  afgh_quest=true,
  afgh_routeSets=true,
  afgh_siren=true,
  afgh_travelPlans=true,
  AiRtEvSoldier=true,
  animal_block=true,
  avatar_presets=true,
  banana_q10500=true,
  banana_q11600=true,
  banana_q11700=true,
  banana_q60023=true,
  banana_q71400=true,
  CameraAroundParams=true,
  CameraSubjectiveParams=true,
  CameraTpsParams=true,
  ChimeraPartsPackageTable=true,
  citadel_q1090=true,
  citadel_q60112=true,
  cliffTown_q1050=true,
  cliffTown_q11040=true,
  cliffTown_q11050=true,
  cliffTown_q60012=true,
  cliffTown_q71050=true,
  cliffTown_q71060=true,
  cliffTown_q99080=true,
  commFacility_q1060=true,
  commFacility_q11080=true,
  commFacility_q19013=true,
  commFacility_q80060=true,
  cypr=true,
  CyprRailActionDataSet=true,
  cypr_mission_block=true,
  cypr_player_bed_and_corridor=true,
  cypr_player_rail=true,
  cypr_player_volgin_ride=true,
  DamageParameterTables=true,
  Debug2DPrint=true,
  DebugChangeCameraSitPreset=true,
  DebugChangeTppGlobalVolFog=true,
  DebugFxEffectDispChange=true,
  DebugRouteChange=true,
  DebugSoundPostEvent=true,
  demo_block=true,
  diamond_q10600=true,
  diamond_q71500=true,
  diamond_q80600=true,
  emblem_list=true,
  --DEBUGNOW Entity=true,
  EquipDevelopConstSetting=true,
  EquipDevelopFlowSetting=true,
  EquipIdTable=true,
  EquipMotionData=true,
  EquipMotionDataForChimera=true,
  EquipParameters=true,
  EquipParameterTables=true,
  f30010_demo=true,
  f30010_enemy=true,
  f30010_orderBoxList=true,
  f30010_radio=true,
  f30010_sequence=true,
  f30010_sound=true,
  f30020_demo=true,
  f30020_enemy=true,
  f30020_orderBoxList=true,
  f30020_radio=true,
  f30020_sequence=true,
  f30050_demo=true,
  f30050_enemy=true,
  f30050_radio=true,
  f30050_sequence=true,
  f30050_sound=true,
  f30150_sequence=true,
  f30250_demo=true,
  f30250_enemy=true,
  f30250_radio=true,
  f30250_sequence=true,
  field_q10020=true,
  field_q30010=true,
  field_q71020=true,
  field_q71090=true,
  field_q80020=true,
  FobUI=true,
  fort_q10080=true,
  fort_q11060=true,
  fort_q11070=true,
  fort_q20911=true,
  fort_q60013=true,
  fort_q71080=true,
  fort_q80080=true,
  FxShadersNoLnm_dx11=true,
  FxShaders_dx11=true,
  gmpEarnMissions=true,
  GrModelShadersNoLnm_dx11=true,
  GrModelShaders_dx11=true,
  GrSystemShadersNoLnm_dx11=true,
  GrSystemShaders_dx11=true,
  gr_init=true,
  gr_init_dx11=true,
  h40020_sequence=true,
  h40050_sequence=true,
  heli_common_photo=true,
  heli_common_radio=true,
  heli_common_sequence=true,
  hill_q10400=true,
  hill_q11500=true,
  hill_q19012=true,
  hill_q60021=true,
  hill_q80400=true,
  init=true,
  init_sequence=true,
  lab_q10700=true,
  lab_q20914=true,
  lab_q39011=true,
  lab_q60022=true,
  lab_q71600=true,
  lab_q71700=true,
  lab_q80700=true,
  LanguageInit=true,
  ly003=true,
  ly003_s10115=true,
  ly013=true,
  ly023=true,
  ly033=true,
  ly043=true,
  ly073=true,
  ly083=true,
  ly093=true,
  mafr=true,
  mafr_animal=true,
  mafr_base=true,
  mafr_baseTelop=true,
  mafr_checkPoint=true,
  mafr_combat=true,
  mafr_common_fx_mtr_def=true,
  mafr_common_fx_mtr_rain=true,
  mafr_common_fx_mtr_underwater=true,
  mafr_cpGroups=true,
  mafr_gimmick=true,
  mafr_luxury_block_list=true,
  mafr_routeSets=true,
  mafr_siren=true,
  mafr_travelPlans=true,
  mbdvc_map_location_parameter=true,
  mbdvc_map_mbstage_parameter=true,
  mbdvc_map_mission_parameter=true,
  mbdvc_pause_help_table=true,
  MbmCommonSetting=true,
  MbmCommonSetting20BaseResSec=true,
  MbmCommonSetting30Deploy=true,
  MbmCommonSetting40RewardDeploy=true,
  MbmCommonSetting50RewardFob=true,
  MbmCommonSetting60DbPfLang=true,
  mission_main=true,
  MotherBaseWeaponSpecSetting=true,
  mtbs=true,
  mtbs_baseTelop=true,
  mtbs_cluster=true,
  mtbs_common_fx_mtr_def=true,
  mtbs_common_fx_mtr_rain=true,
  mtbs_common_fx_mtr_underwater=true,
  mtbs_enemy=true,
  mtbs_helicopter=true,
  mtbs_item=true,
  npc_block=true,
  o50050_enemy=true,
  o50050_item=true,
  o50050_radio=true,
  o50050_sequence=true,
  o50050_sound=true,
  OnlineChallengeTask=true,
  order_box_block=true,
  outland_q10100=true,
  outland_q11090=true,
  outland_q11100=true,
  outland_q19011=true,
  outland_q20913=true,
  outland_q40010=true,
  outland_q60024=true,
  outland_q60113=true,
  outland_q71200=true,
  outland_q80100=true,
  outland_q99071=true,
  pfCamp_q10200=true,
  pfCamp_q11200=true,
  pfCamp_q39012=true,
  pfCamp_q60020=true,
  pfCamp_q60114=true,
  pfCamp_q80200=true,
  player2_camouf_param=true,
  PreinstallTape=true,
  priorityTable=true,
  qest_bossQuiet_00=true,
  qest_q101210=true,
  qest_q101220=true,
  qest_smoking=true,
  quest_child_dog=true,
  quest_ddog_walking=true,
  quest_liquid_challenge=true,
  quest_q20015=true,
  quest_q20025=true,
  quest_q20035=true,
  quest_q20045=true,
  quest_q20055=true,
  quest_q20065=true,
  quest_q20075=true,
  quest_q20085=true,
  quest_q20095=true,
  quest_q20105=true,
  quest_q20205=true,
  quest_q20305=true,
  quest_q20405=true,
  quest_q20505=true,
  quest_q20605=true,
  quest_q20705=true,
  quest_q20805=true,
  quest_q20905=true,
  quest_q21005=true,
  quest_q22005=true,
  quest_q23005=true,
  quest_q24005=true,
  quest_q25005=true,
  quest_q26005=true,
  quest_q27005=true,
  quest_q42010=true,
  quest_q42020=true,
  quest_q42030=true,
  quest_q42040=true,
  quest_q42050=true,
  quest_q42060=true,
  quest_q42070=true,
  quest_q52010=true,
  quest_q52015=true,
  quest_q52020=true,
  quest_q52025=true,
  quest_q52030=true,
  quest_q52035=true,
  quest_q52040=true,
  quest_q52045=true,
  quest_q52050=true,
  quest_q52055=true,
  quest_q52060=true,
  quest_q52065=true,
  quest_q52070=true,
  quest_q52075=true,
  quest_q52080=true,
  quest_q52085=true,
  quest_q52090=true,
  quest_q52095=true,
  quest_q52100=true,
  quest_q52105=true,
  quest_q52110=true,
  quest_q52115=true,
  quest_q52120=true,
  quest_q52125=true,
  quest_q52130=true,
  quest_q52135=true,
  quest_q52140=true,
  quest_q52145=true,
  quest_visit_quiet=true,
  quest_wait_quiet=true,
  RadioParameterTable=true,
  RecoilMaterialTable=true,
  reinforce_block=true,
  ruins_q10030=true,
  ruins_q19010=true,
  ruins_q60010=true,
  ruins_q60115=true,
  s00005_sequence=true,
  s10010_demo=true,
  s10010_enemy=true,
  s10010_enemy2=true,
  s10010_radio=true,
  s10010_score=true,
  s10010_sequence=true,
  s10010_sound=true,
  s10020_demo=true,
  s10020_enemy=true,
  s10020_enemy2=true,
  s10020_radio=true,
  s10020_score=true,
  s10020_sequence=true,
  s10020_sound=true,
  s10030_demo=true,
  s10030_enemy=true,
  s10030_radio=true,
  s10030_sequence=true,
  s10030_sound=true,
  s10033_demo=true,
  s10033_enemy=true,
  s10033_order_box=true,
  s10033_radio=true,
  s10033_score=true,
  s10033_sequence=true,
  s10033_sound=true,
  s10033_telop=true,
  s10036_demo=true,
  s10036_enemy=true,
  s10036_order_box=true,
  s10036_radio=true,
  s10036_score=true,
  s10036_sequence=true,
  s10036_sound=true,
  s10036_telop=true,
  s10040_demo=true,
  s10040_enemy=true,
  s10040_order_box=true,
  s10040_radio=true,
  s10040_score=true,
  s10040_sequence=true,
  s10040_sound=true,
  s10040_telop=true,
  s10041_demo=true,
  s10041_enemy=true,
  s10041_order_box=true,
  s10041_radio=true,
  s10041_score=true,
  s10041_sequence=true,
  s10041_sound=true,
  s10041_telop=true,
  s10043_demo=true,
  s10043_enemy=true,
  s10043_order_box=true,
  s10043_radio=true,
  s10043_score=true,
  s10043_sequence=true,
  s10043_sound=true,
  s10043_telop=true,
  s10044_demo=true,
  s10044_enemy=true,
  s10044_order_box=true,
  s10044_radio=true,
  s10044_score=true,
  s10044_sequence=true,
  s10044_sound=true,
  s10044_telop=true,
  s10045_demo=true,
  s10045_enemy=true,
  s10045_order_box=true,
  s10045_radio=true,
  s10045_score=true,
  s10045_sequence=true,
  s10045_sound=true,
  s10045_telop=true,
  s10050_demo=true,
  s10050_enemy=true,
  s10050_radio=true,
  s10050_score=true,
  s10050_sequence=true,
  s10050_sound=true,
  s10050_telop=true,
  s10052_demo=true,
  s10052_enemy=true,
  s10052_order_box=true,
  s10052_radio=true,
  s10052_score=true,
  s10052_sequence=true,
  s10052_sound=true,
  s10052_telop=true,
  s10054_demo=true,
  s10054_enemy=true,
  s10054_order_box=true,
  s10054_radio=true,
  s10054_score=true,
  s10054_sequence=true,
  s10054_sound=true,
  s10054_telop=true,
  s10070_demo=true,
  s10070_enemy01=true,
  s10070_enemy02=true,
  s10070_enemy03=true,
  s10070_radio=true,
  s10070_score=true,
  s10070_sequence=true,
  s10070_sound=true,
  s10070_telop=true,
  s10080_demo=true,
  s10080_enemy=true,
  s10080_radio=true,
  s10080_score=true,
  s10080_sequence=true,
  s10080_sound=true,
  s10080_telop=true,
  s10081_demo=true,
  s10081_enemy=true,
  s10081_order_box=true,
  s10081_radio=true,
  s10081_score=true,
  s10081_sequence=true,
  s10081_sound=true,
  s10081_telop=true,
  s10082_demo=true,
  s10082_enemy=true,
  s10082_order_box=true,
  s10082_radio=true,
  s10082_score=true,
  s10082_sequence=true,
  s10082_sound=true,
  s10082_telop=true,
  s10085_demo=true,
  s10085_enemy=true,
  s10085_order_box=true,
  s10085_radio=true,
  s10085_score=true,
  s10085_sequence=true,
  s10085_sound=true,
  s10085_telop=true,
  s10086_demo=true,
  s10086_enemy=true,
  s10086_order_box=true,
  s10086_radio=true,
  s10086_score=true,
  s10086_sequence=true,
  s10086_sound=true,
  s10086_telop=true,
  s10090_demo=true,
  s10090_enemy=true,
  s10090_order_box=true,
  s10090_radio=true,
  s10090_score=true,
  s10090_sequence=true,
  s10090_sound=true,
  s10090_telop=true,
  s10091_demo=true,
  s10091_enemy=true,
  s10091_order_box=true,
  s10091_radio=true,
  s10091_score=true,
  s10091_sequence=true,
  s10091_sound=true,
  s10091_telop=true,
  s10093_demo=true,
  s10093_enemy=true,
  s10093_order_box=true,
  s10093_radio=true,
  s10093_score=true,
  s10093_sequence=true,
  s10093_sound=true,
  s10093_telop=true,
  s10100_demo=true,
  s10100_enemy=true,
  s10100_enemy2=true,
  s10100_order_box=true,
  s10100_radio=true,
  s10100_score=true,
  s10100_sequence=true,
  s10100_sound=true,
  s10100_telop=true,
  s10110_demo=true,
  s10110_enemy=true,
  s10110_enemy02=true,
  s10110_npc_block=true,
  s10110_npc_block2=true,
  s10110_order_box=true,
  s10110_radio=true,
  s10110_score=true,
  s10110_sequence=true,
  s10110_sound=true,
  s10110_telop=true,
  s10115_enemy=true,
  s10115_radio=true,
  s10115_score=true,
  s10115_sequence=true,
  s10115_sound=true,
  s10115_telop=true,
  s10120_demo=true,
  s10120_enemy=true,
  s10120_order_box=true,
  s10120_radio=true,
  s10120_score=true,
  s10120_sequence=true,
  s10120_sound=true,
  s10120_telop=true,
  s10121_demo=true,
  s10121_enemy=true,
  s10121_order_box=true,
  s10121_radio=true,
  s10121_score=true,
  s10121_sequence=true,
  s10121_sound=true,
  s10121_telop=true,
  s10130_demo=true,
  s10130_enemy=true,
  s10130_enemy02=true,
  s10130_enemy03=true,
  s10130_order_box=true,
  s10130_radio=true,
  s10130_score=true,
  s10130_sequence=true,
  s10130_sound=true,
  s10130_telop=true,
  s10140_demo=true,
  s10140_enemy=true,
  s10140_enemy01=true,
  s10140_radio=true,
  s10140_score=true,
  s10140_sequence=true,
  s10140_sound=true,
  s10140_telop=true,
  s10150_demo=true,
  s10150_enemy=true,
  s10150_enemy02=true,
  s10150_order_box=true,
  s10150_radio=true,
  s10150_score=true,
  s10150_sequence=true,
  s10150_sound=true,
  s10151_demo=true,
  s10151_enemy=true,
  s10151_radio=true,
  s10151_score=true,
  s10151_sequence=true,
  s10151_sound=true,
  s10156_demo=true,
  s10156_enemy=true,
  s10156_order_box=true,
  s10156_radio=true,
  s10156_score=true,
  s10156_sequence=true,
  s10156_sound=true,
  s10156_telop=true,
  s10171_demo=true,
  s10171_enemy=true,
  s10171_order_box=true,
  s10171_radio=true,
  s10171_score=true,
  s10171_sequence=true,
  s10171_sound=true,
  s10171_telop=true,
  s10195_demo=true,
  s10195_enemy=true,
  s10195_order_box=true,
  s10195_radio=true,
  s10195_score=true,
  s10195_sequence=true,
  s10195_sound=true,
  s10195_telop=true,
  s10200_demo=true,
  s10200_enemy=true,
  s10200_order_box=true,
  s10200_radio=true,
  s10200_score=true,
  s10200_sequence=true,
  s10200_sound=true,
  s10200_telop=true,
  s10211_demo=true,
  s10211_enemy=true,
  s10211_order_box=true,
  s10211_radio=true,
  s10211_score=true,
  s10211_sequence=true,
  s10211_sound=true,
  s10211_telop=true,
  s10240_demo=true,
  s10240_enemy=true,
  s10240_enemy02=true,
  s10240_radio=true,
  s10240_score=true,
  s10240_sequence=true,
  s10240_sound=true,
  s10240_telop=true,
  s10260_demo=true,
  s10260_enemy=true,
  s10260_radio=true,
  s10260_score=true,
  s10260_sequence=true,
  s10260_sound=true,
  s10260_telop=true,
  savannah_q10300=true,
  savannah_q11300=true,
  savannah_q11400=true,
  savannah_q71300=true,
  --Scene=true,
  setup=true,
  Soldier2FaceAndBodyData=true,
  Soldier2ParameterTables=true,
  SoundTppAnimal=true,
  SoundTppPlayer=true,
  SoundTppSoldier=true,
  sovietBase_q10070=true,
  sovietBase_q20912=true,
  sovietBase_q60014=true,
  sovietBase_q60110=true,
  sovietBase_q60111=true,
  sovietBase_q71070=true,
  sovietBase_q99020=true,
  sovietBase_q99030=true,
  sovietBase_q99070=true,
  start=true,
  start2nd=true,
  tent_q10010=true,
  tent_q11010=true,
  tent_q11020=true,
  tent_q20910=true,
  tent_q60011=true,
  tent_q71010=true,
  tent_q71030=true,
  tent_q80010=true,
  tent_q99040=true,
  tent_q99072=true,
  title_sequence=true,
  Tpp=true,
  TppAnimal=true,
  TppAnimalBlock=true,
  TppCassette=true,
  TppCheckPoint=true,
  TppClock=true,
  TppCollection=true,
  TppDbgStr32=true,
  TppDebug=true,
  TppDebugMbDevelop=true,
  TppDefine=true,
  TppDemo=true,
  TppDemoBlock=true,
  TppDevelopFile=true,
  TppEmblem=true,
  TppEneFova=true,
  TppEnemy=true,
  TppEnemyBodyId=true,
  TppEnemyFaceGroup=true,
  TppEnemyFaceGroupId=true,
  TppEnemyFaceId=true,
  TppException=true,
  TppFreeHeliRadio=true,
  TppGeneInter=true,
  TppGimmick=true,
  TppGVars=true,
  TppHelicopter=true,
  TppHero=true,
  TppInterrogation=true,
  TppLandingZone=true,
  TppLocation=true,
  TppMain=true,
  TppMarker=true,
  TppMath=true,
  TppMbFreeDemo=true,
  TppMission=true,
  TppMissionList=true,
  TppMovie=true,
  TppPackList=true,
  TppPadOperatorUtility=true,
  TppPaz=true,
  TppPlayer=true,
  TppPlayer2CallbackScript=true,
  TppPlayer2InitializeScript=true,
  TppQuest=true,
  TppQuestList=true,
  TppRadio=true,
  TppRanking=true,
  TppRatBird=true,
  TppReinforceBlock=true,
  TppResult=true,
  TppRevenge=true,
  TppReward=true,
  TppSave=true,
  TppScriptBlock=true,
  TppSequence=true,
  TppShadersNoLnm_dx11=true,
  TppShaders_dx11=true,
  TppSound=true,
  TppStory=true,
  TppTelop=true,
  TppTerminal=true,
  TppTrap=true,
  TppTrapExecChangeCamera=true,
  TppTrapExecChangeCamSitPreset=true,
  TppTrapExecReachBase=true,
  TppTrapExecVolginCharge=true,
  TppTrapExecVolginSetParams=true,
  TppTrophy=true,
  TppTutorial=true,
  TppUI=true,
  TppUiBootInit=true,
  TppUiPrefetchTexture=true,
  TppVarInit=true,
  TppWeather=true,
  UiRegisterInfo=true,
  waterway_q10040=true,
  waterway_q11030=true,
  waterway_q20040=true,
  waterway_q39010=true,
  waterway_q71040=true,
  waterway_q80040=true,
  waterway_q99012=true,
  WeaponPartsCombinationSettings=true,
  WeaponPartsUiSetting=true,
}

this.ssdInternal={
--126ed3c69bef2=true,
--1bf8f1382950b=true,
--1d9eb39d875ae=true,
--24e187dc382eb=true,
--2609a695e9065=true,
--29680124969ab=true,
--37957b2ec9559=true,
--382fa2cf4b4a6=true,
--50f3824831c6=true,
--9ce89bed4b95=true,
afgh=true,
afgh_animal=true,
afgh_base=true,
afgh_boss=true,
afgh_common_fx_mtr_def=true,
afgh_common_fx_mtr_rain=true,
afgh_common_fx_mtr_underwater=true,
afgh_field_script_c01=true,
afgh_gimmick=true,
afgh_luxury_block_list=true,
afgh_treasureBox=true,
afgh_treasureMission=true,
afgh_treasurePoint=true,
afgh_treasureQuest=true,
afgh_village_script_c01=true,
afgh_visibilitySettings=true,
afgh_waveSettings=true,
afgh_wormhole=true,
afgh_wormholeQuest=true,
AiRtEvSoldier=true,
AnimalQuest=true,
AnnihilationQuest=true,
avatar_presets=true,
avatar_presets_women=true,
BaseBaseDigging=true,
BaseCoopMissionEnemy=true,
BaseCoopMissionRadio=true,
BaseCoopMissionSequence=true,
BaseFlagMission=true,
BaseFreeMissionDemo=true,
BaseFreeMissionEnemy=true,
BaseFreeMissionRadio=true,
BaseFreeMissionSequence=true,
BaseMissionRadio=true,
BaseMissionSequence=true,
BaseQuest=true,
base_q54110=true,
base_q54120=true,
base_q54130=true,
BossQuest=true,
c20005_demo=true,
c20005_enemy=true,
c20005_radio=true,
c20005_sequence=true,
c20005_sound=true,
c20010_enemy=true,
c20010_radio=true,
c20010_sequence=true,
c20020_enemy=true,
c20020_radio=true,
c20020_sequence=true,
c20030_enemy=true,
c20030_sequence=true,
c20110_demo=true,
c20110_enemy=true,
c20110_radio=true,
c20110_sequence=true,
c20110_sound=true,
c20120_enemy=true,
c20120_radio=true,
c20120_sequence=true,
c20130_enemy=true,
c20130_sequence=true,
c20210_demo=true,
c20210_enemy=true,
c20210_radio=true,
c20210_sequence=true,
c20210_sound=true,
c20220_enemy=true,
c20220_radio=true,
c20220_sequence=true,
c20230_enemy=true,
c20230_sequence=true,
c20310_enemy=true,
c20310_radio=true,
c20310_sequence=true,
c20320_enemy=true,
c20320_radio=true,
c20320_sequence=true,
c20410_enemy=true,
c20410_radio=true,
c20410_sequence=true,
c20420_enemy=true,
c20420_radio=true,
c20420_sequence=true,
c20510_enemy=true,
c20510_radio=true,
c20510_sequence=true,
c20610_enemy=true,
c20610_radio=true,
c20610_sequence=true,
c20620_enemy=true,
c20620_radio=true,
c20620_sequence=true,
c20630_enemy=true,
c20630_sequence=true,
c20710_enemy=true,
c20710_radio=true,
c20710_sequence=true,
c20720_enemy=true,
c20720_radio=true,
c20720_sequence=true,
c20730_enemy=true,
c20730_sequence=true,
c21005_demo=true,
c21005_enemy=true,
c21005_radio=true,
c21005_sequence=true,
c21005_sound=true,
c21010_demo=true,
c21010_enemy=true,
c21010_radio=true,
c21010_sequence=true,
c21010_sound=true,
c29010_enemy=true,
c29010_sequence=true,
c29210_enemy=true,
c29210_sequence=true,
carnivore_block=true,
ChimeraPartsPackageTable=true,
CollectionQuest=true,
d50010=true,
DamageParameterTables=true,
DebugChangeCameraSitPreset=true,
DebugChangeTppGlobalVolFog=true,
DefenseQuest=true,
demo_block=true,
diamond_q11928=true,
diamond_q11929=true,
diamond_q11930=true,
diamond_q22090=true,
diamond_q22100=true,
diamond_q22110=true,
diamond_q22120=true,
diamond_q22130=true,
diamond_q22160=true,
diamond_q33260=true,
diamond_q33270=true,
diamond_q44250=true,
diamond_q44260=true,
diamond_q54090=true,
diamond_q54300=true,
diamond_q54310=true,
diamond_q61020=true,
diamond_q61030=true,
e01010_demo=true,
e01010_enemy=true,
e01010_radio=true,
e01010_sequence=true,
e01010_sound=true,
emblem_list=true,
--Entity=true,
EquipDevelopConstSetting=true,
EquipDevelopFlowSetting=true,
EquipIdTable=true,
EquipMotionData=true,
EquipMotionDataForChimera=true,
EquipParameters=true,
EquipParameterTables=true,
ExtraDiggingQuest=true,
f30010_demo=true,
f30010_enemy=true,
f30010_orderBoxList=true,
f30010_radio=true,
f30010_sequence=true,
f30020_demo=true,
f30020_enemy=true,
f30020_orderBoxList=true,
f30020_radio=true,
f30020_sequence=true,
factory_q11300=true,
factory_q11310=true,
factory_q11320=true,
factory_q11330=true,
factory_q11340=true,
factory_q11350=true,
factory_q11921=true,
factory_q11922=true,
factory_q11923=true,
factory_q33080=true,
factory_q33090=true,
factory_q33100=true,
factory_q33110=true,
factory_q33220=true,
factory_q33230=true,
factory_q33240=true,
factory_q33250=true,
factory_q44210=true,
factory_q44220=true,
factory_q44230=true,
factory_q44240=true,
factory_q54070=true,
factory_q54080=true,
factory_q54240=true,
factory_q54250=true,
factory_q54260=true,
factory_q54270=true,
factory_q74030=true,
field_q11010=true,
field_q11020=true,
field_q11030=true,
field_q11040=true,
field_q11050=true,
field_q11060=true,
field_q11070=true,
field_q11080=true,
field_q11120=true,
field_q11140=true,
field_q11190=true,
field_q11200=true,
field_q11220=true,
field_q11240=true,
field_q11250=true,
field_q11260=true,
field_q11270=true,
field_q11280=true,
field_q11720=true,
field_q11760=true,
field_q11901=true,
field_q11902=true,
field_q11903=true,
field_q11904=true,
field_q11905=true,
field_q11906=true,
field_q11907=true,
field_q11908=true,
field_q11909=true,
field_q11910=true,
field_q22010=true,
field_q22020=true,
field_q22030=true,
field_q22040=true,
field_q33010=true,
field_q33020=true,
field_q33030=true,
field_q44010=true,
field_q44030=true,
field_q44040=true,
field_q44050=true,
field_q44090=true,
field_q44100=true,
field_q44110=true,
field_q44140=true,
field_q44150=true,
field_q44160=true,
field_q54010=true,
field_q54020=true,
field_q54030=true,
field_q54140=true,
field_q54150=true,
field_q54160=true,
field_q54170=true,
field_q61010=true,
field_q74010=true,
FxShadersNoLnm_dx11=true,
FxShaders_dx11=true,
GearConfig=true,
gmpEarnMissions=true,
GrModelShadersNoLnm_dx11=true,
GrModelShaders_dx11=true,
GrSystemShadersNoLnm_dx11=true,
GrSystemShaders_dx11=true,
gr_init=true,
gr_init_dx11=true,
herbivore_block=true,
init=true,
init_sequence=true,
k40015=true,
k40020=true,
k40030=true,
k40035=true,
k40040=true,
k40060=true,
k40070=true,
k40075=true,
k40077=true,
k40080=true,
k40090=true,
k40130=true,
k40140=true,
k40150=true,
k40155=true,
k40160=true,
k40170=true,
k40180=true,
k40220=true,
k40230=true,
k40240=true,
k40250=true,
k40260=true,
k40270=true,
k40310=true,
k40320=true,
KaijuUtility=true,
lab_q11924=true,
lab_q11925=true,
lab_q11926=true,
lab_q11927=true,
lab_q11931=true,
lab_q33280=true,
lab_q33290=true,
lab_q33300=true,
lab_q44270=true,
lab_q44280=true,
lab_q44290=true,
lab_q44300=true,
lab_q54100=true,
lab_q54280=true,
lab_q54290=true,
lab_q74040=true,
LanguageInit=true,
mafr=true,
mafr_animal=true,
mafr_base=true,
mafr_boss=true,
mafr_common_fx_mtr_def=true,
mafr_common_fx_mtr_rain=true,
mafr_common_fx_mtr_underwater=true,
mafr_diamond_script_c01=true,
mafr_gimmick=true,
mafr_luxury_block_list=true,
mafr_treasureBox=true,
mafr_treasureMission=true,
mafr_treasurePoint=true,
mafr_treasureQuest=true,
mafr_visibilitySettings=true,
mafr_waveSettings=true,
mafr_wormhole=true,
mafr_wormholeQuest=true,
mbdvc_map_location_parameter=true,
mbdvc_map_mbstage_parameter=true,
mbdvc_map_mission_parameter=true,
mbdvc_pause_help_table=true,
MbmCommonSetting=true,
MbmCommonSetting20BaseResSec=true,
MbmCommonSetting30Deploy=true,
MbmCommonSetting40RewardDeploy=true,
MbmCommonSetting50RewardFob=true,
MbmCommonSetting60DbPfLang=true,
mission_main=true,
MotherBaseWeaponSpecSetting=true,
order_box_block=true,
--Pad=true,
player2_camouf_param=true,
PlayerBaseFacilityCamera=true,
PreinstallTape=true,
priorityTable=true,
RadioParameterTable=true,
RecoilMaterialTable=true,
RescueQuest=true,
s10010_demo=true,
s10010_enemy=true,
s10010_radio=true,
s10010_sequence=true,
s10010_sound=true,
s10035_demo=true,
s10035_enemy=true,
s10035_radio=true,
s10035_sequence=true,
s10035_sound=true,
s10050_demo=true,
s10050_enemy=true,
s10050_radio=true,
s10050_sequence=true,
s10050_sound=true,
s10060_demo=true,
s10060_enemy=true,
s10060_radio=true,
s10060_sequence=true,
s10060_sound=true,
--Scene=true,
setup=true,
Soldier2FaceAndBodyData=true,
Soldier2ParameterTables=true,
SoundTppAnimal=true,
SoundTppPlayer=true,
SoundTppSoldier=true,
spfc=true,
spfc_pfCamp_script_c01=true,
ssav=true,
ssav_savannah_script_c01=true,
SsdBaseDefense=true,
SsdBaseDefenseList=true,
SsdCreatureBlock=true,
SsdCreatureList=true,
SsdCrewList=true,
SsdFastTravel=true,
SsdFastTravelPointList=true,
SsdFlagMission=true,
SsdFlagMissionList=true,
SsdMissionList=true,
SsdNpcFaceAndBodyData=true,
SsdPlayerInitializeScript=true,
SsdRecipe=true,
SsdRecipeList=true,
SsdStorySequenceList=true,
SsdStorySequenceRewardList=true,
SsdWaterPumpList=true,
SsdZombieAnimationTrackPool=true,
SsdZombieBomAnimationTrackPool=true,
start=true,
start2nd=true,
title_sequence=true,
Tpp=true,
TppAnimal=true,
TppAnimalBlock=true,
TppCassette=true,
TppCheckPoint=true,
TppClock=true,
TppCollection=true,
TppCrew=true,
TppDbgStr32=true,
TppDebug=true,
TppDebugMbDevelop=true,
TppDebugMissionList=true,
TppDefine=true,
TppDemo=true,
TppDemoBlock=true,
TppDevelopFile=true,
TppEmblem=true,
TppEneFova=true,
TppEnemy=true,
TppEnemyBodyId=true,
TppEnemyFaceGroup=true,
TppEnemyFaceGroupId=true,
TppEnemyFaceId=true,
TppException=true,
TppFreeHeliRadio=true,
TppGeneInter=true,
TppGimmick=true,
TppGVars=true,
TppHelicopter=true,
TppHero=true,
TppInterrogation=true,
TppLandingZone=true,
TppLocation=true,
TppMain=true,
TppMarker=true,
TppMath=true,
TppMbFreeDemo=true,
TppMission=true,
TppMissionList=true,
TppMovie=true,
TppPackList=true,
TppPadOperatorUtility=true,
TppPaz=true,
TppPlayer=true,
TppPlayer2CallbackScript=true,
TppPlayer2InitializeScript=true,
TppQuest=true,
TppQuestList=true,
TppRadio=true,
TppRanking=true,
TppRatBird=true,
TppReinforceBlock=true,
TppResult=true,
TppRevenge=true,
TppReward=true,
TppSave=true,
TppScriptBlock=true,
TppSequence=true,
TppShadersNoLnm_dx11=true,
TppShaders_dx11=true,
TppSound=true,
TppStory=true,
TppTelop=true,
TppTerminal=true,
TppTrap=true,
TppTrapExecChangeCamera=true,
TppTrapExecChangeCamSitPreset=true,
TppTrophy=true,
TppTutorial=true,
TppUI=true,
TppUiBootInit=true,
TppUiPrefetchTexture=true,
TppVarInit=true,
TppWeather=true,
UiRegisterInfo=true,
VehicleQuest=true,
village_q11040=true,
village_q11060=true,
village_q11090=true,
village_q11100=true,
village_q11110=true,
village_q11130=true,
village_q11150=true,
village_q11160=true,
village_q11170=true,
village_q11180=true,
village_q11210=true,
village_q11230=true,
village_q11290=true,
village_q11700=true,
village_q11710=true,
village_q11730=true,
village_q11740=true,
village_q11750=true,
village_q11911=true,
village_q11912=true,
village_q11913=true,
village_q11914=true,
village_q11915=true,
village_q11916=true,
village_q11917=true,
village_q11918=true,
village_q11919=true,
village_q11920=true,
village_q22050=true,
village_q22060=true,
village_q22070=true,
village_q22080=true,
village_q22140=true,
village_q22150=true,
village_q33040=true,
village_q33050=true,
village_q33060=true,
village_q33070=true,
village_q33071=true,
village_q44020=true,
village_q44060=true,
village_q44070=true,
village_q44080=true,
village_q44120=true,
village_q44130=true,
village_q44170=true,
village_q44180=true,
village_q44190=true,
village_q44200=true,
village_q54040=true,
village_q54050=true,
village_q54060=true,
village_q54180=true,
village_q54190=true,
village_q54200=true,
village_q54210=true,
village_q54220=true,
village_q54230=true,
village_q61040=true,
village_q74020=true,
WeaponPartsCombinationSettings=true,
WeaponPartsUiSetting=true,
weapon_fx_mtr_def=true,
weapon_fx_mtr_underwater=true,
RegisterGear=true,
}

--SYNC: InfMain.LoadModelInfoModules
function this.BuildIHModelInfoList()
  this.ihModelInfo={}
  local plpartsPacks={
    "plparts_avatar_man",
    "plparts_battledress",
    "plparts_ddf_battledress",
    "plparts_ddf_parasite",
    "plparts_ddf_venom",
    "plparts_ddm_battledress",
    "plparts_ddm_parasite",
    "plparts_ddm_venom",
    "plparts_dd_female",
    "plparts_dd_male",
    "plparts_gold",
    "plparts_gz_suit",
    "plparts_hospital",
    "plparts_leather",
    "plparts_mgs1",
    "plparts_naked",
    "plparts_ninja",
    "plparts_normal",
    "plparts_normal_scarf",
    "plparts_parasite",
    "plparts_raiden",
    "plparts_silver",
    "plparts_sneaking_suit",
    "plparts_venom",
    "plparts_ddm_swimwear",
    "plparts_ddf_swimwear",
  }

  local suffix="_modelInfo"
  for n,packName in ipairs(plpartsPacks) do
    this.ihModelInfo[packName..suffix]=true
  end
end

--tex builds list of external IH (MGS_TPP\mod\) modules.
function this.BuildIHExternalList()
  this.ihExternal={}
  local externalModuleNames={}
  for path,files in pairs(InfCore.files)do
    local files=InfCore.GetFileList(files,".lua",true)
    for i,moduleName in pairs(files)do
      table.insert(externalModuleNames,moduleName)
    end
  end
  
  for i,moduleName in ipairs(externalModuleNames)do
    this.ihExternal[moduleName]=true
  end
  
  InfCore.PrintInspect(externalModuleNames,"ihExternal names")--DEBUG
end

function this.PostAllModulesLoad()
  this.BuildIHExternalList()
  --DEBUGNOW this.BuildIHModelInfoList()
end

return this
