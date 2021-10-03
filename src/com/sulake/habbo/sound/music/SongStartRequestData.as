package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1483:int;
      
      private var var_1829:Number;
      
      private var var_2468:Number;
      
      private var var_2466:int;
      
      private var var_2469:Number;
      
      private var var_2467:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1483 = param1;
         this.var_1829 = param2;
         this.var_2468 = param3;
         this.var_2469 = param4;
         this.var_2467 = param5;
         this.var_2466 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1483;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1829 < 0)
         {
            return 0;
         }
         return this.var_1829 + (getTimer() - this.var_2466) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2468;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2469;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2467;
      }
   }
}
