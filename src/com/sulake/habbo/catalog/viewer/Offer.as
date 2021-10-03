package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_2038:String = "pricing_model_unknown";
      
      public static const const_455:String = "pricing_model_single";
      
      public static const const_441:String = "pricing_model_multi";
      
      public static const const_683:String = "pricing_model_bundle";
      
      public static const const_1906:String = "price_type_none";
      
      public static const const_870:String = "price_type_credits";
      
      public static const const_1417:String = "price_type_activitypoints";
      
      public static const const_1297:String = "price_type_credits_and_activitypoints";
       
      
      private var var_915:String;
      
      private var var_1390:String;
      
      private var var_1413:int;
      
      private var var_2187:String;
      
      private var var_1389:int;
      
      private var var_1388:int;
      
      private var var_2186:int;
      
      private var var_259:ICatalogPage;
      
      private var var_744:IProductContainer;
      
      private var _disposed:Boolean = false;
      
      private var _clubLevel:int = 0;
      
      private var var_2963:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:Array, param8:ICatalogPage)
      {
         super();
         this.var_1413 = param1;
         this.var_2187 = param2;
         this.var_1389 = param3;
         this.var_1388 = param4;
         this.var_2186 = param5;
         this.var_259 = param8;
         this._clubLevel = param6;
         this.analyzePricingModel(param7);
         this.analyzePriceType();
         this.createProductContainer(param7);
      }
      
      public function get clubLevel() : int
      {
         return this._clubLevel;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_259;
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
      
      public function get activityPointType() : int
      {
         return this.var_2186;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_744;
      }
      
      public function get pricingModel() : String
      {
         return this.var_915;
      }
      
      public function get priceType() : String
      {
         return this.var_1390;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2963;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2963 = param1;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1413 = 0;
         this.var_2187 = "";
         this.var_1389 = 0;
         this.var_1388 = 0;
         this.var_2186 = 0;
         this.var_259 = null;
         if(this.var_744 != null)
         {
            this.var_744.dispose();
            this.var_744 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_915)
         {
            case const_455:
               this.var_744 = new SingleProductContainer(this,param1);
               break;
            case const_441:
               this.var_744 = new MultiProductContainer(this,param1);
               break;
            case const_683:
               this.var_744 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_915);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_915 = const_455;
            }
            else
            {
               this.var_915 = const_441;
            }
         }
         else if(param1.length > 1)
         {
            this.var_915 = const_683;
         }
         else
         {
            this.var_915 = const_2038;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1389 > 0 && this.var_1388 > 0)
         {
            this.var_1390 = const_1297;
         }
         else if(this.var_1389 > 0)
         {
            this.var_1390 = const_870;
         }
         else if(this.var_1388 > 0)
         {
            this.var_1390 = const_1417;
         }
         else
         {
            this.var_1390 = const_1906;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_259.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_744.products)
         {
            _loc4_ = this.var_259.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,this.clubLevel,_loc1_,this.page);
      }
   }
}
