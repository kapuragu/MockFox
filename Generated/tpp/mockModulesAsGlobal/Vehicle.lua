--Vehicle.lua
--GENERATED: by IHTearDown.GenerateMockModules
--as setThisAsGlobal style
Vehicle={
  type={
    NONE=0,
    WESTERN_LIGHT_VEHICLE=1,
    EASTERN_LIGHT_VEHICLE=2,
    WESTERN_TRUCK=3,
    EASTERN_TRUCK=4,
    WESTERN_WHEELED_ARMORED_VEHICLE=5,
    EASTERN_WHEELED_ARMORED_VEHICLE=6,
    WESTERN_TRACKED_TANK=7,
    EASTERN_TRACKED_TANK=8,
    INVALID=0,
  },
  subType={
    NONE=0,
    WESTERN_TRUCK_CARGO_ITEM_BOX=1,
    WESTERN_TRUCK_CARGO_CONTAINER=2,
    WESTERN_TRUCK_CARGO_CISTERN=3,
    WESTERN_TRUCK_HOOD=4,
    EASTERN_TRUCK_CARGO_AMMUNITION=1,
    EASTERN_TRUCK_CARGO_MATERIAL=2,
    EASTERN_TRUCK_CARGO_DRUM=3,
    EASTERN_TRUCK_CARGO_GENERATOR=4,
    WESTERN_WHEELED_ARMORED_VEHICLE_TURRET_MACHINE_GUN=1,
    WESTERN_WHEELED_ARMORED_VEHICLE_TURRET_CANNON=2,
    EASTERN_WHEELED_ARMORED_VEHICLE_ROCKET_ARTILLERY=1,
  },
  paintType={
    NONE=0,
    RANK_0=1,
    RANK_1=2,
    RANK_2=3,
    FOVA_0=4,
    FOVA_1=5,
    FOVA_2=6,
    CUSTOM=7,
  },
  emblemType={
    NONE=0,
    LOCAL_PLAYER=1,
    OPPONENT_PLAYER=2,
  },
  class={
    DEFAULT=0,
    DARK_GRAY=1,
    OXIDE_RED=2,
  },
  speed={
    STOP=0,
    FORWARD_SLOW=0,
    FORWARD_NORMAL=0,
    FORWARD_FAST=0,
    FORWARD_MAX=0,
    BACKWARD_SLOW=0,
    BACKWARD_NORMAL=0,
    BACKWARD_FAST=0,
    BACKWARD_MAX=0,
  },
  priority={
    DEFAULT=8,
    EVER_UNREAL=127,
    SPIRITED_AWAY=126,
    INVALID=8,
  },
  life={
    BROKEN=0,
    EXTINCTION=0,
  },
  state={
    CAN_FULTON=1,
    SPEED_DOWN=2,
    ALL=3,
  },
  observation={
    CRASH=1,
    PLAYER_WILL_HARM_VEHICLE=2,
    PLAYER_WILL_BREAK_VEHICLE=4,
    PLAYER_STOPS_VEHICLE_BY_BREAKING_WHEELS=8,
    ALL=15,
  },
  instanceCountMax=60,
  svars=function(...)end,
  SaveCarry=function(...)end,
  LoadCarry=function(...)end,
  ClearCarry=function(...)end,
  FinishCarry=function(...)end,
  SetIgnoreDisableNpc=function(...)end,
}--this
return Vehicle
