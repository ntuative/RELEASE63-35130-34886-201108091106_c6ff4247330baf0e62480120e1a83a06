package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2717:String;
      
      private var var_2716:Class;
      
      private var var_2718:Class;
      
      private var var_2017:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2717 = param1;
         this.var_2716 = param2;
         this.var_2718 = param3;
         if(rest == null)
         {
            this.var_2017 = new Array();
         }
         else
         {
            this.var_2017 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2717;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2716;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2718;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_2017;
      }
   }
}
