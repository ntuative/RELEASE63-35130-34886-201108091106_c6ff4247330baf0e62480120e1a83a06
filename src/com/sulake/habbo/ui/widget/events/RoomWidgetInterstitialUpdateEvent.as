package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetInterstitialUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_110:String = "RWIUE_SHOW";
      
      public static const COMPLETE:String = "RWIUE_COMPLETE";
       
      
      private var var_48:BitmapData;
      
      private var var_1359:String;
      
      public function RoomWidgetInterstitialUpdateEvent(param1:String, param2:BitmapData, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this.var_48 = param2;
         this.var_1359 = param3;
      }
      
      public function get image() : BitmapData
      {
         return this.var_48;
      }
      
      public function get clickUrl() : String
      {
         return this.var_1359;
      }
   }
}
