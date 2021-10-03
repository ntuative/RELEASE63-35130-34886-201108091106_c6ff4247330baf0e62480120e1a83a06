package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2645:int;
      
      private var var_2758:int;
      
      private var var_2760:int;
      
      private var _dayOffsets:Array;
      
      private var var_2174:Array;
      
      private var var_2173:Array;
      
      private var var_2759:int;
      
      private var var_2761:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2645;
      }
      
      public function get offerCount() : int
      {
         return this.var_2758;
      }
      
      public function get historyLength() : int
      {
         return this.var_2760;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_2174;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_2173;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2759;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2761;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2645 = param1.readInteger();
         this.var_2758 = param1.readInteger();
         this.var_2760 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_2174 = [];
         this.var_2173 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_2174.push(param1.readInteger());
            this.var_2173.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2761 = param1.readInteger();
         this.var_2759 = param1.readInteger();
         return true;
      }
   }
}
