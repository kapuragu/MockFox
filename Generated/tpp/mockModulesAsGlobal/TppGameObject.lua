--TppGameObject.lua
--GENERATED: by IHTearDown.GenerateMockModules
--as setThisAsGlobal style
TppGameObject={
  GAME_OBJECT_TYPE_PLAYER2=0,
  GAME_OBJECT_TYPE_COMMAND_POST2=1,
  GAME_OBJECT_TYPE_SOLDIER2=2,
  GAME_OBJECT_TYPE_HOSTAGE2=3,
  GAME_OBJECT_TYPE_HOSTAGE_UNIQUE=4,
  GAME_OBJECT_TYPE_HOSTAGE_UNIQUE2=5,
  GAME_OBJECT_TYPE_HOSTAGE_KAZ=6,
  GAME_OBJECT_TYPE_OCELOT2=7,
  GAME_OBJECT_TYPE_HUEY2=8,
  GAME_OBJECT_TYPE_CODE_TALKER2=9,
  GAME_OBJECT_TYPE_SKULL_FACE2=10,
  GAME_OBJECT_TYPE_MANTIS2=11,
  GAME_OBJECT_TYPE_BIRD2=12,
  GAME_OBJECT_TYPE_HORSE2=13,
  GAME_OBJECT_TYPE_HELI2=14,
  GAME_OBJECT_TYPE_ENEMY_HELI=15,
  GAME_OBJECT_TYPE_OTHER_HELI=16,
  GAME_OBJECT_TYPE_OTHER_HELI2=17,
  GAME_OBJECT_TYPE_BUDDYQUIET2=18,
  GAME_OBJECT_TYPE_BUDDYDOG2=19,
  GAME_OBJECT_TYPE_BUDDYPUPPY=20,
  GAME_OBJECT_TYPE_SAHELAN2=21,
  GAME_OBJECT_TYPE_PARASITE2=22,
  GAME_OBJECT_TYPE_LIQUID2=23,
  GAME_OBJECT_TYPE_VOLGIN2=24,
  GAME_OBJECT_TYPE_BOSSQUIET2=25,
  GAME_OBJECT_TYPE_UAV=26,
  GAME_OBJECT_TYPE_SECURITYCAMERA2=27,
  GAME_OBJECT_TYPE_GOAT=28,
  GAME_OBJECT_TYPE_NUBIAN=29,
  GAME_OBJECT_TYPE_CRITTER_BIRD=30,
  GAME_OBJECT_TYPE_STORK=31,
  GAME_OBJECT_TYPE_EAGLE=32,
  GAME_OBJECT_TYPE_RAT=33,
  GAME_OBJECT_TYPE_ZEBRA=34,
  GAME_OBJECT_TYPE_WOLF=35,
  GAME_OBJECT_TYPE_JACKAL=36,
  GAME_OBJECT_TYPE_BEAR=37,
  GAME_OBJECT_TYPE_CORPSE=38,
  GAME_OBJECT_TYPE_MBQUIET=39,
  GAME_OBJECT_TYPE_COMMON_HORSE2=40,
  GAME_OBJECT_TYPE_HORSE2_FOR_VR=41,
  GAME_OBJECT_TYPE_PLAYER_HORSE2_FOR_VR=42,
  GAME_OBJECT_TYPE_VOLGIN2_FOR_VR=43,
  GAME_OBJECT_TYPE_WALKERGEAR2=44,
  GAME_OBJECT_TYPE_COMMON_WALKERGEAR2=45,
  GAME_OBJECT_TYPE_BATTLEGEAR=46,
  GAME_OBJECT_TYPE_EXAMPLE=47,
  GAME_OBJECT_TYPE_SAMPLE_GAME_OBJECT=48,
  GAME_OBJECT_TYPE_NOTICE_OBJECT=49,
  GAME_OBJECT_TYPE_VEHICLE=50,
  GAME_OBJECT_TYPE_MOTHER_BASE_CONTAINER=51,
  GAME_OBJECT_TYPE_EQUIP_SYSTEM=52,
  GAME_OBJECT_TYPE_PICKABLE_SYSTEM=53,
  GAME_OBJECT_TYPE_COLLECTION_SYSTEM=54,
  GAME_OBJECT_TYPE_THROWING_SYSTEM=55,
  GAME_OBJECT_TYPE_PLACED_SYSTEM=56,
  GAME_OBJECT_TYPE_SHELL_SYSTEM=57,
  GAME_OBJECT_TYPE_BULLET_SYSTEM3=58,
  GAME_OBJECT_TYPE_CASING_SYSTEM=59,
  GAME_OBJECT_TYPE_FULTON=60,
  GAME_OBJECT_TYPE_BALLOON_SYSTEM=61,
  GAME_OBJECT_TYPE_PARACHUTE_SYSTEM=62,
  GAME_OBJECT_TYPE_SUPPLY_CBOX=63,
  GAME_OBJECT_TYPE_SUPPORT_ATTACK=64,
  GAME_OBJECT_TYPE_RANGE_ATTACK=65,
  GAME_OBJECT_TYPE_CBOX=66,
  GAME_OBJECT_TYPE_OBSTRUCTION_SYSTEM=67,
  GAME_OBJECT_TYPE_DECOY_SYSTEM=68,
  GAME_OBJECT_TYPE_CAPTURECAGE_SYSTEM=69,
  GAME_OBJECT_TYPE_DUNG_SYSTEM=70,
  GAME_OBJECT_TYPE_MARKER2_LOCATOR=71,
  GAME_OBJECT_TYPE_ESPIONAGE_RADIO=72,
  GAME_OBJECT_TYPE_MGO_ACTOR=73,
  GAME_OBJECT_TYPE_FOB_GAME_DAEMON=74,
  GAME_OBJECT_TYPE_SYSTEM_RECEIVER=75,
  GAME_OBJECT_TYPE_SEARCHLIGHT=76,
  GAME_OBJECT_TYPE_FULTONABLE_CONTAINER=77,
  GAME_OBJECT_TYPE_GARBAGEBOX=78,
  GAME_OBJECT_TYPE_IMPORTANT_BREAKABLE=79,
  GAME_OBJECT_TYPE_GATLINGGUN=80,
  GAME_OBJECT_TYPE_MORTAR=81,
  GAME_OBJECT_TYPE_MACHINEGUN=82,
  GAME_OBJECT_TYPE_DOOR=83,
  GAME_OBJECT_TYPE_WATCH_TOWER=84,
  GAME_OBJECT_TYPE_TOILET=85,
  GAME_OBJECT_TYPE_ESPIONAGEBOX=86,
  GAME_OBJECT_TYPE_IR_SENSOR=87,
  GAME_OBJECT_TYPE_EVENT_ANIMATION=88,
  GAME_OBJECT_TYPE_BRIDGE=89,
  GAME_OBJECT_TYPE_WATER_TOWER=90,
  GAME_OBJECT_TYPE_RADIO_CASSETTE=91,
  GAME_OBJECT_TYPE_POI_SYSTEM=92,
  GAME_OBJECT_TYPE_SAMPLE_MANAGER=93,
  PHASE_SNEAK=0,
  PHASE_CAUTION=1,
  PHASE_EVASION=2,
  PHASE_ALERT=3,
  HOLD_RELEASE_UNKNOWN=0,
  HOLD_RELEASE_CANCEL=1,
  HOLD_RELEASE_THROW=2,
  HOLD_RELEASE_KNIFE_KILL=3,
  HOLD_RELEASE_COMBO_FINISH=4,
  HOLD_RELEASE_SLEEPER_HOLD=5,
  FULTON_FAILED_TYPE_NONE=0,
  FULTON_FAILED_TYPE_ON_FINISHED_RISE=1,
  FULTON_FAILED_TYPE_BREAK_BALLOON=2,
  FULTON_FAILED_TYPE_WRONG_POSITION=3,
  FULTON_FAILED_TYPE_WRONG_LEVEL=4,
  ROUTE_EVENT_FAILED_TYPE_NONE=0,
  ROUTE_EVENT_FAILED_TYPE_VEHICLE_GET_IN=1,
  ROUTE_EVENT_FAILED_TYPE_WALKER_GEAR_GET_IN=2,
  ROUTE_EVENT_FAILED_TYPE_PICK_UP_HONEY_BEE=3,
  ROUTE_EVENT_FAILED_TYPE_LOST_HOSTAGE_PUT_IN_VEHICLE=4,
  ROUTE_EVENT_FAILED_TYPE_LOST_HOSTAGE_TAKE_OUT_OF_VEHICLE=5,
  ROUTE_EVENT_FAILED_TYPE_LOST_VEHICLE_HOSTAGE_PUT_IN=6,
  ROUTE_EVENT_FAILED_TYPE_LOST_VEHICLE_HOSTAGE_TAKE_OUT_OF=7,
  BRING_PLAYER_WARNING=1494136844,
  BRING_PLAYER_RECOVERED=1644292568,
  BRING_PLAYER_FAILED=1621776412,
  HOSTAGE_NOTICE_STATE_NORMAL=0,
  HOSTAGE_NOTICE_STATE_UNLOCKED=1,
  HOSTAGE_NOTICE_STATE_FLEE=2,
  HOSTAGE_NOTICE_STATE_DISCOVERED=3,
  HOSTAGE_NOTICE_STATE_EXECUTE_READY=4,
  HOSTAGE_NOTICE_STATE_EXECUTED=5,
  NPC_LIFE_STATE_NORMAL=0,
  NPC_LIFE_STATE_DEAD=1,
  NPC_LIFE_STATE_DYING=2,
  NPC_LIFE_STATE_SLEEP=3,
  NPC_LIFE_STATE_FAINT=4,
  NPC_STATE_DISABLE=0,
  NPC_STATE_NORMAL=1,
  NPC_STATE_STAND_HOLDUP=2,
  NPC_STATE_CRAWL_HOLDUP=3,
  NPC_STATE_CARRIED=4,
  NPC_CARRIED_STATE_START=0,
  NPC_CARRIED_STATE_END=1,
  NPC_CARRIED_STATE_IDLE_START=2,
  SIREN_TYPE_NONE=0,
  SIREN_TYPE_CITA=1,
  SIREN_TYPE_ENEB=2,
  SIREN_TYPE_FLOS=3,
  SIREN_TYPE_LAB=4,
  SIREN_TYPE_PFCA=5,
  SIREN_TYPE_POWP=6,
  SIREN_TYPE_SOVB=7,
  SIREN_TYPE_TENT=8,
  VEHICLE_ACTION_TYPE_GOT_IN_VEHICLE=0,
  VEHICLE_ACTION_TYPE_GOT_OUT_VEHICLE=1,
  VEHICLE_ACTION_TYPE_FELL_OFF_VEHICLE=2,
}--this
return TppGameObject
