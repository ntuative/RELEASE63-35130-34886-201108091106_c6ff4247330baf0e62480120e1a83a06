package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_630:String;
      
      private var var_2405:String;
      
      private var var_975:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_630 = param1;
         this.var_975 = param2;
         this.var_2405 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_630;
      }
      
      public function get race() : String
      {
         return this.var_2405;
      }
      
      public function get gender() : String
      {
         return this.var_975;
      }
   }
}
