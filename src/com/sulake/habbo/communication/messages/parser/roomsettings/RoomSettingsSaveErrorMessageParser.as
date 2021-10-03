package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_2266:int = 1;
      
      public static const const_2205:int = 2;
      
      public static const const_2157:int = 3;
      
      public static const const_2337:int = 4;
      
      public static const const_2003:int = 5;
      
      public static const const_2159:int = 6;
      
      public static const const_1998:int = 7;
      
      public static const const_2051:int = 8;
      
      public static const const_2292:int = 9;
      
      public static const const_1774:int = 10;
      
      public static const const_1838:int = 11;
      
      public static const const_1877:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1767:int;
      
      private var var_644:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1767 = param1.readInteger();
         this.var_644 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1767;
      }
      
      public function get info() : String
      {
         return this.var_644;
      }
   }
}
