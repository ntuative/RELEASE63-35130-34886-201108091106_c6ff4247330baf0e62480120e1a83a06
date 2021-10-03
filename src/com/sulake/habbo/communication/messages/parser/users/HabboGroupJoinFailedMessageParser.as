package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboGroupJoinFailedMessageParser implements IMessageParser
   {
       
      
      private var var_1676:int;
      
      public function HabboGroupJoinFailedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1676 = param1.readInteger();
         return true;
      }
      
      public function get reason() : int
      {
         return this.var_1676;
      }
   }
}
