package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_633:int = 0;
      
      public static const const_238:int = 1;
      
      public static const const_128:int = 2;
      
      public static const const_953:Array = ["open","closed","password"];
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_2092:String;
      
      private var var_2319:int;
      
      private var var_1592:int;
      
      private var var_2452:int;
      
      private var var_2923:int;
      
      private var var_951:Array;
      
      private var var_2456:Array;
      
      private var var_2924:int;
      
      private var var_2357:Boolean;
      
      private var var_2453:Boolean;
      
      private var var_2454:Boolean;
      
      private var _hideWalls:Boolean;
      
      private var var_2457:int;
      
      private var var_2455:int;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2357;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2357 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2453;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2453 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2454;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2454 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this._hideWalls;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this._hideWalls = param1;
      }
      
      public function get wallThickness() : int
      {
         return this.var_2457;
      }
      
      public function set wallThickness(param1:int) : void
      {
         this.var_2457 = param1;
      }
      
      public function get floorThickness() : int
      {
         return this.var_2455;
      }
      
      public function set floorThickness(param1:int) : void
      {
         this.var_2455 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_2092;
      }
      
      public function set description(param1:String) : void
      {
         this.var_2092 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2319;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2319 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1592;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1592 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2452;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2452 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2923;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2923 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_951;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_951 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2456;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2456 = param1;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2924;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2924 = param1;
      }
   }
}
