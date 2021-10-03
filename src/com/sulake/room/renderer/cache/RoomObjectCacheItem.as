package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_456:RoomObjectLocationCacheItem = null;
      
      private var var_233:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         this.var_456 = new RoomObjectLocationCacheItem(param1);
         this.var_233 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return this.var_456;
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return this.var_233;
      }
      
      public function dispose() : void
      {
         if(this.var_456 != null)
         {
            this.var_456.dispose();
            this.var_456 = null;
         }
         if(this.var_233 != null)
         {
            this.var_233.dispose();
            this.var_233 = null;
         }
      }
   }
}
