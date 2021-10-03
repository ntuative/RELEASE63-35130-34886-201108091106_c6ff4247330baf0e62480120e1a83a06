package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1470:Boolean = false;
      
      private var var_1794:int;
      
      private var var_1831:Array;
      
      private var var_936:Array;
      
      private var var_937:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1470 = _loc2_.isWrappingEnabled;
         this.var_1794 = _loc2_.wrappingPrice;
         this.var_1831 = _loc2_.stuffTypes;
         this.var_936 = _loc2_.boxTypes;
         this.var_937 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1470;
      }
      
      public function get price() : int
      {
         return this.var_1794;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1831;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_936;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_937;
      }
   }
}
