package com.sulake.habbo.communication.messages.parser.inventory.trading
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TradingAcceptParser implements IMessageParser
   {
       
      
      private var _userID:int;
      
      private var var_2069:Boolean;
      
      public function TradingAcceptParser()
      {
         super();
      }
      
      public function get userID() : int
      {
         return this._userID;
      }
      
      public function get userAccepts() : Boolean
      {
         return this.var_2069;
      }
      
      public function flush() : Boolean
      {
         this._userID = -1;
         this.var_2069 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._userID = param1.readInteger();
         this.var_2069 = param1.readInteger() > 0;
         return true;
      }
   }
}
