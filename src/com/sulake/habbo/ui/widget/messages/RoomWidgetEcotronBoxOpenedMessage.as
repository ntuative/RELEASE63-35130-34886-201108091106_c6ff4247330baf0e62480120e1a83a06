package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetEcotronBoxOpenedMessage extends RoomWidgetMessage
   {
      
      public static const const_1963:String = "RWEBOM_ECOTRONBOX_OPENED";
       
      
      private var var_1552:String;
      
      private var var_1844:int;
      
      public function RoomWidgetEcotronBoxOpenedMessage(param1:String, param2:String, param3:int)
      {
         super(param1);
         this.var_1552 = param2;
         this.var_1844 = param3;
      }
      
      public function get itemType() : String
      {
         return this.var_1552;
      }
      
      public function get classId() : int
      {
         return this.var_1844;
      }
   }
}
