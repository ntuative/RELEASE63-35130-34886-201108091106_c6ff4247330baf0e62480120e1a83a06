package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const const_833:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_2420:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:int)
      {
         super(const_833);
         this.var_2420 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_2420;
      }
   }
}
