package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_306:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2508:int = 0;
      
      private var var_2507:int = 0;
      
      private var var_2506:int = 0;
      
      private var var_2509:Boolean = false;
      
      private var _clubLevel:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_306,param6,param7);
         this.var_2508 = param1;
         this.var_2507 = param2;
         this.var_2506 = param3;
         this.var_2509 = param4;
         this._clubLevel = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2508;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2507;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2506;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2509;
      }
      
      public function get clubLevel() : int
      {
         return this._clubLevel;
      }
   }
}
