package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NewConsoleMessageMessageParser implements IMessageParser
   {
       
      
      private var var_1394:int;
      
      private var var_2303:String;
      
      public function NewConsoleMessageMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1394 = param1.readInteger();
         this.var_2303 = param1.readString();
         return true;
      }
      
      public function get senderId() : int
      {
         return this.var_1394;
      }
      
      public function get messageText() : String
      {
         return this.var_2303;
      }
   }
}
