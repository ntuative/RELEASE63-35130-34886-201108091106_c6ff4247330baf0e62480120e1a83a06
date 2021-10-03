package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1891:int = 0;
      
      private var var_1890:int = 0;
      
      private var var_2620:int = 0;
      
      private var var_2621:Boolean = false;
      
      private var var_2559:Boolean = false;
      
      private var var_2565:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1891 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1890 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2620 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2621 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2559 = param1;
      }
      
      public function set clubIsExpiring(param1:Boolean) : void
      {
         this.var_2565 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1891;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1890;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2620;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2621;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2559;
      }
      
      public function get clubIsExpiring() : Boolean
      {
         return this.var_2565;
      }
   }
}
