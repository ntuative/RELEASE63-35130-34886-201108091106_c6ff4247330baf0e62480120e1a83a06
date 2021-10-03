package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_842:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_658:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_842);
         this.var_658 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_658;
      }
   }
}
