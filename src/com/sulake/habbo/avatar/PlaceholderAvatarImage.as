package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_820:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_1164)
         {
            _structure = null;
            _assets = null;
            var_299 = null;
            var_311 = null;
            var_630 = null;
            var_616 = null;
            var_361 = null;
            if(!var_1437 && var_48)
            {
               var_48.dispose();
            }
            var_48 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_910 = null;
            var_1164 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_820[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_820[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_419:
               switch(_loc3_)
               {
                  case AvatarAction.const_849:
                  case AvatarAction.const_606:
                  case AvatarAction.const_408:
                  case AvatarAction.const_997:
                  case AvatarAction.const_448:
                  case AvatarAction.const_859:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_372:
            case AvatarAction.const_163:
            case AvatarAction.const_296:
            case AvatarAction.const_877:
            case AvatarAction.const_1040:
            case AvatarAction.const_1029:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
