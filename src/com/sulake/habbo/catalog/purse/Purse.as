package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
       
      
      private var var_2024:int = 0;
      
      private var var_1531:Dictionary;
      
      private var var_1891:int = 0;
      
      private var var_1890:int = 0;
      
      private var var_2559:Boolean = false;
      
      private var var_2554:int = 0;
      
      private var var_2557:int = 0;
      
      private var var_2565:Boolean = false;
      
      public function Purse()
      {
         this.var_1531 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2024;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2024 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1891;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1891 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1890;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1890 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1891 > 0 || this.var_1890 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2559;
      }
      
      public function get isExpiring() : Boolean
      {
         return this.var_2565;
      }
      
      public function set isExpiring(param1:Boolean) : void
      {
         this.var_2565 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2559 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2554;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2554 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2557;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2557 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1531;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1531 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1531[param1];
      }
   }
}
