package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1470:Boolean;
      
      private var var_2369:int;
      
      private var var_1804:int;
      
      private var var_1805:int;
      
      private var var_2370:int;
      
      private var var_2371:int;
      
      private var var_2373:int;
      
      private var var_2372:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1470;
      }
      
      public function get commission() : int
      {
         return this.var_2369;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1804;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1805;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2371;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2370;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2373;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2372;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1470 = param1.readBoolean();
         this.var_2369 = param1.readInteger();
         this.var_1804 = param1.readInteger();
         this.var_1805 = param1.readInteger();
         this.var_2371 = param1.readInteger();
         this.var_2370 = param1.readInteger();
         this.var_2373 = param1.readInteger();
         this.var_2372 = param1.readInteger();
         return true;
      }
   }
}
