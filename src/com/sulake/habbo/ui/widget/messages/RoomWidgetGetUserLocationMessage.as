package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetGetUserLocationMessage extends RoomWidgetMessage
   {
      
      public static const const_933:String = "RWGOI_MESSAGE_GET_USER_LOCATION";
       
      
      private var _userId:int;
      
      private var var_1735:int;
      
      public function RoomWidgetGetUserLocationMessage(param1:int, param2:int)
      {
         super(const_933);
         this._userId = param1;
         this.var_1735 = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get method_1() : int
      {
         return this.var_1735;
      }
   }
}
