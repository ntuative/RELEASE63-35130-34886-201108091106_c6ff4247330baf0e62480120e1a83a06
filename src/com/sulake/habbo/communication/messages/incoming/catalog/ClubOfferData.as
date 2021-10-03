package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1413:int;
      
      private var var_1793:String;
      
      private var var_1794:int;
      
      private var _upgrade:Boolean;
      
      private var var_2390:Boolean;
      
      private var var_2394:int;
      
      private var var_2396:int;
      
      private var var_2393:int;
      
      private var var_2392:int;
      
      private var var_2395:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1413 = param1.readInteger();
         this.var_1793 = param1.readString();
         this.var_1794 = param1.readInteger();
         this._upgrade = param1.readBoolean();
         this.var_2390 = param1.readBoolean();
         this.var_2394 = param1.readInteger();
         this.var_2396 = param1.readInteger();
         this.var_2393 = param1.readInteger();
         this.var_2392 = param1.readInteger();
         this.var_2395 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1413;
      }
      
      public function get productCode() : String
      {
         return this.var_1793;
      }
      
      public function get price() : int
      {
         return this.var_1794;
      }
      
      public function get upgrade() : Boolean
      {
         return this._upgrade;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2390;
      }
      
      public function get periods() : int
      {
         return this.var_2394;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2396;
      }
      
      public function get year() : int
      {
         return this.var_2393;
      }
      
      public function get month() : int
      {
         return this.var_2392;
      }
      
      public function get day() : int
      {
         return this.var_2395;
      }
   }
}
