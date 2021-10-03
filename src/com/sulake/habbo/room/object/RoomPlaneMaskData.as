package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2450:Number = 0.0;
      
      private var var_2448:Number = 0.0;
      
      private var var_2449:Number = 0.0;
      
      private var var_2447:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2450 = param1;
         this.var_2448 = param2;
         this.var_2449 = param3;
         this.var_2447 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2450;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2448;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2449;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2447;
      }
   }
}
