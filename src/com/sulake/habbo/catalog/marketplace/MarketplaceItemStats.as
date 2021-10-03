package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2645:int;
      
      private var var_2758:int;
      
      private var var_2760:int;
      
      private var _dayOffsets:Array;
      
      private var var_2174:Array;
      
      private var var_2173:Array;
      
      private var var_2759:int;
      
      private var var_2761:int;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2645 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2758 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2760 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_2174 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_2173 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2759 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2761 = param1;
      }
   }
}
