package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      public static const const_1233:int = 1;
      
      public static const const_503:int = 2;
      
      private static const const_1145:int = 5;
      
      private static const const_1672:int = 250;
      
      private static const const_1670:int = 100;
      
      private static const const_1669:int = 180;
      
      private static const const_1671:int = 200;
       
      
      private var var_405:Timer;
      
      private var var_406:Timer;
      
      private var _assets:IAssetLibrary;
      
      private var var_95:IWindowContainer;
      
      private var _parent:IWindowContainer;
      
      private var var_2074:int = 2;
      
      private var var_863:BitmapData;
      
      private var var_1077:BitmapData;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         this.var_405 = new Timer(const_1672,1);
         this.var_406 = new Timer(const_1670,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         this.var_95 = param1;
         this.var_95.visible = false;
         this._assets = param2;
         this.var_405.addEventListener(TimerEvent.TIMER,this.onDisplayTimer);
         this.var_406.addEventListener(TimerEvent.TIMER,this.onHideTimer);
         var _loc3_:BitmapDataAsset = this._assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            this.var_1077 = _loc3_.content as BitmapData;
         }
         _loc3_ = this._assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            this.var_863 = _loc3_.content as BitmapData;
         }
      }
      
      public function dispose() : void
      {
         if(this.var_405 != null)
         {
            this.var_405.removeEventListener(TimerEvent.TIMER,this.onDisplayTimer);
            this.var_405.stop();
            this.var_405 = null;
         }
         if(this.var_406 != null)
         {
            this.var_406.removeEventListener(TimerEvent.TIMER,this.onHideTimer);
            this.var_406.stop();
            this.var_406 = null;
         }
         this._assets = null;
         this.var_95 = null;
         this._parent = null;
         this.var_863 = null;
         this.var_1077 = null;
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(this.var_95 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(this._parent != null)
         {
            this._parent.removeChild(this.var_95);
         }
         this._parent = param1;
         this.var_2074 = param4;
         var _loc5_:ITextWindow = ITextWindow(this.var_95.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = this.var_95.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1669,param3.width),Math.min(const_1671,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (this.var_95.width - _loc6_.width) / 2;
            this.var_95.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      public function show() : void
      {
         this.var_406.reset();
         this.var_405.reset();
         if(this._parent == null)
         {
            return;
         }
         this.var_95.visible = true;
         this._parent.addChild(this.var_95);
         this.refreshArrow(this.var_2074);
         switch(this.var_2074)
         {
            case const_1233:
               this.var_95.x = -1 * this.var_95.width - const_1145;
               break;
            case const_503:
               this.var_95.x = this._parent.width + const_1145;
         }
         this.var_95.y = (this._parent.height - this.var_95.height) / 2;
      }
      
      public function hide() : void
      {
         this.var_95.visible = false;
         this.var_406.reset();
         this.var_405.reset();
         if(this._parent != null)
         {
            this._parent.removeChild(this.var_95);
         }
      }
      
      public function showDelayed() : void
      {
         this.var_406.reset();
         this.var_405.reset();
         this.var_405.start();
      }
      
      public function hideDelayed() : void
      {
         this.var_406.reset();
         this.var_405.reset();
         this.var_406.start();
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(this.var_95 == null || this.var_95.disposed)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(this.var_95.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_1233:
               _loc2_.bitmap = this.var_1077.clone();
               _loc2_.width = this.var_1077.width;
               _loc2_.height = this.var_1077.height;
               _loc2_.y = (this.var_95.height - this.var_1077.height) / 2;
               _loc2_.x = this.var_95.width - 1;
               break;
            case const_503:
               _loc2_.bitmap = this.var_863.clone();
               _loc2_.width = this.var_863.width;
               _loc2_.height = this.var_863.height;
               _loc2_.y = (this.var_95.height - this.var_863.height) / 2;
               _loc2_.x = -1 * this.var_863.width + 1;
         }
         _loc2_.invalidate();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         this.show();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         this.hide();
      }
   }
}
