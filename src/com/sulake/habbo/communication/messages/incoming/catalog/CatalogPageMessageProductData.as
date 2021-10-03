package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_63:String = "i";
      
      public static const const_74:String = "s";
      
      public static const const_183:String = "e";
       
      
      private var var_1661:String;
      
      private var var_2592:int;
      
      private var var_1113:String;
      
      private var var_1662:int;
      
      private var var_2147:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1661 = param1.readString();
         this.var_2592 = param1.readInteger();
         this.var_1113 = param1.readString();
         this.var_1662 = param1.readInteger();
         this.var_2147 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1661;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2592;
      }
      
      public function get extraParam() : String
      {
         return this.var_1113;
      }
      
      public function get productCount() : int
      {
         return this.var_1662;
      }
      
      public function get expiration() : int
      {
         return this.var_2147;
      }
   }
}
