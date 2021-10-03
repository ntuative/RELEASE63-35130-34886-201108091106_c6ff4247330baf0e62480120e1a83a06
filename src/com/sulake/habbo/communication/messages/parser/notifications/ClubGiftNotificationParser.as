package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ClubGiftNotificationParser implements IMessageParser
   {
       
      
      private var var_2821:int;
      
      public function ClubGiftNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2821 = param1.readInteger();
         return true;
      }
      
      public function get numGifts() : int
      {
         return this.var_2821;
      }
   }
}
