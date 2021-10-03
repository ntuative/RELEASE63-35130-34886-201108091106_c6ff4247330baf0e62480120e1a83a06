package com.sulake.habbo.friendbar.view.tabs.tokens
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.habbo.friendbar.data.FriendNotification;
   import com.sulake.habbo.friendbar.view.utils.DropAnimation;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class Token implements IDisposable
   {
      
      protected static var var_1451:IHabboWindowManager;
      
      protected static var var_1452:IAssetLibrary;
      
      protected static const ICON:String = "icon";
      
      protected static const const_1180:String = "title";
      
      protected static const const_1171:String = "message";
      
      protected static const const_1454:Rectangle = new Rectangle(0,0,25,25);
       
      
      protected var _icon:IRegionWindow;
      
      protected var _window:IWindowContainer;
      
      protected var _disposed:Boolean;
      
      protected var var_1449:FriendNotification;
      
      protected var var_1172:DropAnimation;
      
      public function Token(param1:FriendNotification)
      {
         super();
         this.var_1449 = param1;
      }
      
      public static function set WINDOWING(param1:IHabboWindowManager) : void
      {
         var_1451 = param1;
      }
      
      public static function set ASSETS(param1:IAssetLibrary) : void
      {
         var_1452 = param1;
      }
      
      public function get typeCode() : int
      {
         return this.var_1449.typeCode;
      }
      
      public function get viewOnce() : Boolean
      {
         return this.var_1449.viewOnce;
      }
      
      public function get notification() : FriendNotification
      {
         return this.var_1449;
      }
      
      public function get iconElement() : IWindow
      {
         return this._icon;
      }
      
      public function get windowElement() : IWindow
      {
         return this._window;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this._icon)
         {
            this._icon.dispose();
            this._icon = null;
         }
         if(this.var_1172)
         {
            this.var_1172.dispose();
            this.var_1172 = null;
         }
         this.var_1449 = null;
         this._disposed = true;
      }
      
      protected function prepare(param1:String, param2:String, param3:String, param4:String, param5:String, param6:Boolean) : void
      {
         var _loc7_:* = null;
         this._window = var_1451.buildFromXML(var_1452.getAssetByName(param3).content as XML) as IWindowContainer;
         this._window.findChildByName(const_1180).caption = param1;
         this._window.findChildByName(const_1171).caption = !!param2 ? param2 : "";
         _loc7_ = var_1452.getAssetByName(param5) as BitmapDataAsset;
         if(_loc7_)
         {
            IBitmapWrapperWindow(this._window.findChildByName(ICON)).bitmap = _loc7_.content as BitmapData;
         }
         this._icon = var_1451.create("ICON_" + this.typeCode,WindowType.const_358,WindowStyle.const_101,WindowParam.const_29,Token.const_1454) as IRegionWindow;
         this._icon.mouseThreshold = 0;
         var _loc8_:IBitmapWrapperWindow = var_1451.create("BITMAP_" + this.typeCode,WindowType.const_405,WindowStyle.const_101,WindowParam.const_189,Token.const_1454) as IBitmapWrapperWindow;
         _loc8_.disposesBitmap = false;
         _loc7_ = var_1452.getAssetByName(param4) as BitmapDataAsset;
         if(_loc7_)
         {
            _loc8_.bitmap = _loc7_.content as BitmapData;
         }
         this._icon.addChild(_loc8_);
         if(this.var_1172)
         {
            this.var_1172.dispose();
         }
         if(param6)
         {
            this.var_1172 = new DropAnimation(this._icon,600,32);
         }
      }
   }
}
