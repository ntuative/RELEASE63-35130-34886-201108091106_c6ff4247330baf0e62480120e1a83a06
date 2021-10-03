package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_977:IAssetLoader;
      
      private var var_2337:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_2337 = param1;
         this.var_977 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_2337;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_977;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_977 != null)
            {
               if(!this.var_977.disposed)
               {
                  this.var_977.dispose();
                  this.var_977 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
