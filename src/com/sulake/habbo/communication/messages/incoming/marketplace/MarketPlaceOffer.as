package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1413:int;
      
      private var _furniId:int;
      
      private var var_2646:int;
      
      private var var_2277:String;
      
      private var var_1794:int;
      
      private var var_436:int;
      
      private var var_2644:int = -1;
      
      private var var_2645:int;
      
      private var var_1947:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this.var_1413 = param1;
         this._furniId = param2;
         this.var_2646 = param3;
         this.var_2277 = param4;
         this.var_1794 = param5;
         this.var_436 = param6;
         this.var_2644 = param7;
         this.var_2645 = param8;
         this.var_1947 = param9;
      }
      
      public function get offerId() : int
      {
         return this.var_1413;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2646;
      }
      
      public function get stuffData() : String
      {
         return this.var_2277;
      }
      
      public function get price() : int
      {
         return this.var_1794;
      }
      
      public function get status() : int
      {
         return this.var_436;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2644;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2645;
      }
      
      public function get offerCount() : int
      {
         return this.var_1947;
      }
   }
}
