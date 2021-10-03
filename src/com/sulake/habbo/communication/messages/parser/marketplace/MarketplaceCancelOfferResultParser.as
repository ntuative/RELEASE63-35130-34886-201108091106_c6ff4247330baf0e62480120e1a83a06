package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceCancelOfferResultParser implements IMessageParser
   {
       
      
      private var _result:int;
      
      private var var_1413:int;
      
      public function MarketplaceCancelOfferResultParser()
      {
         super();
      }
      
      public function get result() : int
      {
         return this._result;
      }
      
      public function get offerId() : int
      {
         return this.var_1413;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1413 = param1.readInteger();
         this._result = param1.readInteger();
         return true;
      }
   }
}
