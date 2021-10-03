package com.sulake.habbo.avatar.hotlooks
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.CategoryBaseModel;
   import com.sulake.habbo.avatar.common.CategoryData;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.avatar.wardrobe.Outfit;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   
   public class HotLooksModel extends CategoryBaseModel implements IAvatarEditorCategoryModel
   {
      
      public static const const_2377:String = "hot_looks";
      
      public static const const_2270:String = "my_looks";
       
      
      private var var_601:Dictionary;
      
      public function HotLooksModel(param1:HabboAvatarEditor)
      {
         super(param1);
         this.var_601 = new Dictionary();
         this.var_601["null"] = new Array();
         this.var_601["null"] = new Array();
         this.var_601["undefined.index"] = 0;
         this.var_601["undefined.index"] = 0;
         this.requestHotLooks();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_601 = null;
      }
      
      override protected function init() : void
      {
         if(!_view)
         {
            _view = new HotLooksView(this,controller.manager.windowManager,controller.manager.assets);
         }
         _view.init();
         _isInitialized = true;
      }
      
      public function selectHotLook(param1:int) : void
      {
         var _loc2_:Array = this.var_601["null"];
         var _loc3_:Outfit = _loc2_[param1];
         if(_loc3_ != null)
         {
            if(_loc3_.figure == "")
            {
               return;
            }
            var_27.loadAvatarInEditor(_loc3_.figure,_loc3_.gender,var_27.clubMemberLevel);
         }
      }
      
      public function get hotLooks() : Array
      {
         return this.var_601["null"];
      }
      
      private function requestHotLooks() : void
      {
         var _loc1_:String = var_27.manager.configuration.getKey("avatareditor.promohabbos");
         var _loc2_:URLRequest = new URLRequest(_loc1_);
         var _loc3_:AssetLoaderStruct = var_27.manager.assets.loadAssetFromFile("hotLooksConfiguration",_loc2_,"text/xml");
         _loc3_.addEventListener(AssetLoaderEvent.ASSET_LOADER_EVENT_COMPLETE,this.onHotLooksConfiguration);
      }
      
      private function onHotLooksConfiguration(param1:Event = null) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:XmlAsset = var_27.manager.assets.getAssetByName("hotLooksConfiguration") as XmlAsset;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.content as XML;
            for each(_loc5_ in _loc4_.habbo)
            {
               _loc6_ = new Outfit(var_27,_loc5_.@figure,_loc5_.@gender);
               (this.var_601[_loc6_.gender] as Array).push(_loc6_);
            }
         }
         else
         {
            Logger.log("Could not retrieve Hot Looks from the server.");
         }
      }
      
      override public function switchCategory(param1:String) : void
      {
      }
      
      override public function getCategoryData(param1:String) : CategoryData
      {
         return null;
      }
      
      override public function selectPart(param1:String, param2:int) : void
      {
      }
   }
}
