package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CanCreateRoomEventMessageParser implements IMessageParser
   {
       
      
      private var var_2446:Boolean;
      
      private var var_1767:int;
      
      public function CanCreateRoomEventMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2446 = param1.readBoolean();
         this.var_1767 = param1.readInteger();
         return true;
      }
      
      public function get canCreateEvent() : Boolean
      {
         return this.var_2446;
      }
      
      public function get errorCode() : int
      {
         return this.var_1767;
      }
   }
}
