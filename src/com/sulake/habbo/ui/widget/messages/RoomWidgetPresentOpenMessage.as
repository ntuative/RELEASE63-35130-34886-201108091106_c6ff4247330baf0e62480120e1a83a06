package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetPresentOpenMessage extends RoomWidgetMessage
   {
      
      public static const const_197:String = "RWPOM_OPEN_PRESENT";
       
      
      private var var_234:int;
      
      public function RoomWidgetPresentOpenMessage(param1:String, param2:int)
      {
         super(param1);
         this.var_234 = param2;
      }
      
      public function get objectId() : int
      {
         return this.var_234;
      }
   }
}
