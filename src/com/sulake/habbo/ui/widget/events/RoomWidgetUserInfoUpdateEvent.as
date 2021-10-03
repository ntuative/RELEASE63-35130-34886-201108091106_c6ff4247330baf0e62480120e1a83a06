package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_108:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_145:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_851:int = 2;
      
      public static const const_855:int = 3;
      
      public static const const_1786:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1944:String = "";
      
      private var var_2364:int;
      
      private var var_2365:int = 0;
      
      private var var_2366:int = 0;
      
      private var var_630:String = "";
      
      private var var_48:BitmapData = null;
      
      private var var_245:Array;
      
      private var var_2420:int = 0;
      
      private var var_2419:String = "";
      
      private var var_2424:int = 0;
      
      private var var_2423:int = 0;
      
      private var var_2165:Boolean = false;
      
      private var _realName:String = "";
      
      private var var_2290:Boolean = false;
      
      private var var_2425:Boolean = false;
      
      private var var_2422:Boolean = true;
      
      private var var_1183:int = 0;
      
      private var var_2417:Boolean = false;
      
      private var var_2418:Boolean = false;
      
      private var var_2414:Boolean = false;
      
      private var var_2421:Boolean = false;
      
      private var var_2416:Boolean = false;
      
      private var var_2413:Boolean = false;
      
      private var var_2415:int = 0;
      
      private var var_2163:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_245 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1944 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1944;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2364 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2364;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2365 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2365;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2366 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2366;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_630 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_630;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_48 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_48;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_245 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_245;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_2420 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_2420;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2419 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2419;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2425 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2425;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1183 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1183;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2417 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2417;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2418 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2418;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2414 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2414;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2421 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2421;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2416 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2416;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2413 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2413;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2415 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2415;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2422 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2422;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_2163 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_2163;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2424 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2424;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2423 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2423;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_2165 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_2165;
      }
      
      public function set realName(param1:String) : void
      {
         this._realName = param1;
      }
      
      public function get realName() : String
      {
         return this._realName;
      }
      
      public function set allowNameChange(param1:Boolean) : void
      {
         this.var_2290 = param1;
      }
      
      public function get allowNameChange() : Boolean
      {
         return this.var_2290;
      }
   }
}
