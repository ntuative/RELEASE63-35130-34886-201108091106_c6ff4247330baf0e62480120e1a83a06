package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_1413:int;
      
      private var var_2187:String;
      
      private var var_1389:int;
      
      private var var_1388:int;
      
      private var var_2186:int;
      
      private var _clubLevel:int;
      
      private var var_1425:Array;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1413 = param1.readInteger();
         this.var_2187 = param1.readString();
         this.var_1389 = param1.readInteger();
         this.var_1388 = param1.readInteger();
         this.var_2186 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1425 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1425.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
         this._clubLevel = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1413;
      }
      
      public function get localizationId() : String
      {
         return this.var_2187;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1389;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1388;
      }
      
      public function get products() : Array
      {
         return this.var_1425;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2186;
      }
      
      public function get clubLevel() : int
      {
         return this._clubLevel;
      }
   }
}
