package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_791:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1439:String = "RWOCM_CLUB_MAIN";
      
      public static const const_2381:String = "RWOCM_PIXELS";
      
      public static const const_2372:String = "RWOCM_CREDITS";
      
      public static const const_2212:String = "RWOCM_SHELLS";
       
      
      private var var_2486:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_791);
         this.var_2486 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2486;
      }
   }
}
