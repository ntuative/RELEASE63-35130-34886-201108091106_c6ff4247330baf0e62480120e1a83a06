package com.sulake.habbo.session
{
   import flash.display.BitmapData;
   
   public class BadgeInfo
   {
       
      
      private var var_48:BitmapData;
      
      private var var_2860:Boolean;
      
      public function BadgeInfo(param1:BitmapData, param2:Boolean)
      {
         super();
         this.var_48 = param1;
         this.var_2860 = param2;
      }
      
      public function get image() : BitmapData
      {
         return this.var_48;
      }
      
      public function get placeHolder() : Boolean
      {
         return this.var_2860;
      }
   }
}
