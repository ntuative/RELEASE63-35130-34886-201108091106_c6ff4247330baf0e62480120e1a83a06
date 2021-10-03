package com.sulake.habbo.room.object
{
   public class RoomStairData
   {
       
      
      private var var_2943:int;
      
      private var var_2169:Boolean;
      
      private var var_2168:Boolean;
      
      private var var_49:Boolean;
      
      public function RoomStairData(param1:int, param2:Boolean, param3:Boolean, param4:Boolean)
      {
         super();
         this.var_49 = param4;
         this.var_2943 = param1;
         this.var_2169 = param2;
         this.var_2168 = param3;
      }
      
      public function get stairHeight() : int
      {
         return this.var_2943;
      }
      
      public function get neighbourStairMin() : Boolean
      {
         return this.var_2169;
      }
      
      public function get neighbourStairMax() : Boolean
      {
         return this.var_2168;
      }
      
      public function get neighbourStair() : Boolean
      {
         return this.var_2169 || this.var_2168;
      }
      
      public function get border() : Boolean
      {
         return this.var_49;
      }
   }
}
