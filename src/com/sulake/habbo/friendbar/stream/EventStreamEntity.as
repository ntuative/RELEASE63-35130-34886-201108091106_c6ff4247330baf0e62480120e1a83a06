package com.sulake.habbo.friendbar.stream
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.friendbar.utils.LinkResolver;
   import com.sulake.habbo.friendbar.utils.LinkTarget;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import flash.display.BitmapData;
   import flash.net.URLRequest;
   
   public class EventStreamEntity implements IDisposable
   {
      
      public static var name_6:IWindowContainer;
      
      public static var var_2264:IHabboLocalizationManager;
      
      public static var ASSETS:IAssetLibrary;
      
      public static var var_1428:IHabboEventStream;
      
      private static const const_398:Vector.<EventStreamEntity> = new Vector.<EventStreamEntity>();
      
      private static const const_1180:String = "title";
      
      private static const const_1171:String = "message";
      
      private static const LINK:String = "link";
      
      private static const TEXT:String = "text";
      
      private static const const_1763:String = "time";
      
      private static const const_321:String = "canvas";
      
      private static const const_248:String = "like";
      
      private static const const_399:String = "border";
      
      private static const const_497:String = "label";
      
      private static const const_2155:String = "icon";
      
      private static const const_496:uint = 4293519841;
      
      private static const const_741:uint = 4292467926;
      
      private static const const_1761:String = "minutes";
      
      private static const const_1762:String = "hours";
      
      private static const const_1764:String = "days";
       
      
      private var _window:IWindowContainer;
      
      private var _disposed:Boolean = false;
      
      private var var_169:Boolean = false;
      
      private var _id:int = -1;
      
      private var var_899:LinkTarget;
      
      private var var_1718:int;
      
      private var var_1419:String;
      
      public function EventStreamEntity()
      {
         super();
         this._window = name_6.clone() as IWindowContainer;
         this._window.findChildByName(LINK).addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onLinkClicked);
      }
      
      public static function allocate() : EventStreamEntity
      {
         var _loc1_:EventStreamEntity = false ? const_398.pop() : new EventStreamEntity();
         _loc1_.var_169 = false;
         return _loc1_;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set even(param1:Boolean) : void
      {
         this._window.color = !!param1 ? uint(const_496) : uint(const_741);
         this._window.findChildByName(const_399).color = this._window.color;
      }
      
      public function get even() : Boolean
      {
         return this._window.color == const_496;
      }
      
      public function set title(param1:String) : void
      {
         this._window.findChildByName(const_1180).caption = param1;
      }
      
      public function get title() : String
      {
         return !!this._window ? this._window.findChildByName(const_1180).caption : null;
      }
      
      public function set message(param1:String) : void
      {
         this._window.findChildByName(const_1171).caption = param1;
      }
      
      public function get message() : String
      {
         return !!this._window ? this._window.findChildByName(const_1171).caption : null;
      }
      
      public function set numberOfLikes(param1:int) : void
      {
         IWindowContainer(this._window.findChildByName(const_248)).findChildByName(const_497).caption = String(param1);
      }
      
      public function get numberOfLikes() : int
      {
         return !!this._window ? int(parseInt(IWindowContainer(this._window.findChildByName(const_248)).findChildByName(const_497).caption)) : 0;
      }
      
      public function set isLikable(param1:Boolean) : void
      {
         this.setIsLikable(param1);
      }
      
      public function set isLikingEnabled(param1:Boolean) : void
      {
         if(this._window)
         {
            this._window.findChildByName(const_248).visible = param1;
         }
      }
      
      public function set linkTarget(param1:LinkTarget) : void
      {
         this.var_899 = param1;
         var _loc2_:IWindowContainer = IWindowContainer(this._window.findChildByName(LINK));
         if(this.var_899.type == LinkTarget.NONE)
         {
            _loc2_.visible = false;
         }
         else
         {
            _loc2_.visible = true;
            _loc2_.getChildByName(TEXT).caption = param1.text;
         }
      }
      
      public function get linkTarget() : LinkTarget
      {
         return this.var_899;
      }
      
      public function set imageFilePath(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 != this.var_1419)
         {
            this.var_1419 = param1;
            _loc2_ = ASSETS.getAssetByName(param1);
            if(_loc2_)
            {
               this.image = _loc2_.content as BitmapData;
            }
            else
            {
               _loc3_ = ASSETS.loadAssetFromFile(param1,new URLRequest(param1));
               _loc3_.addEventListener(AssetLoaderEvent.ASSET_LOADER_EVENT_COMPLETE,this.onImageFileLoaded);
               _loc3_.addEventListener(AssetLoaderEvent.const_41,this.onImageFileLoaded);
            }
         }
      }
      
      public function set image(param1:BitmapData) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!this.disposed && this._window && param1)
         {
            _loc2_ = this._window.findChildByName(const_321) as IBitmapWrapperWindow;
            _loc3_ = _loc2_.x + _loc2_.width / 2;
            _loc4_ = _loc2_.y + _loc2_.height / 2;
            _loc2_.bitmap = param1;
            _loc2_.x = _loc3_ - param1.width / 2;
            _loc2_.y = _loc4_ - param1.height / 2;
            _loc2_.width = param1.width;
            _loc2_.height = param1.height;
            this.var_1419 = null;
         }
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get recycled() : Boolean
      {
         return this.var_169;
      }
      
      public function set minutesElapsed(param1:int) : void
      {
         this.var_1718 = param1;
         var _loc2_:String = const_1761;
         if(this.var_1718 >= 1440)
         {
            _loc2_ = const_1764;
            param1 /= 1440;
         }
         else if(this.var_1718 >= 60)
         {
            _loc2_ = const_1762;
            param1 /= 60;
         }
         var _loc3_:ILocalization = var_2264.getLocalization("friendbar.stream." + _loc2_ + ".ago");
         this._window.findChildByName(const_1763).caption = !!_loc3_ ? _loc3_.raw.replace("%value%",String(param1)) : "...?";
      }
      
      public function get minutesElapsed() : int
      {
         return this.var_1718;
      }
      
      public function recycle() : void
      {
         if(!this.var_169)
         {
            if(!this._disposed)
            {
               this._window.parent = null;
               IBitmapWrapperWindow(this._window.findChildByName(const_321)).bitmap = null;
               this.setIsLikable(false);
               this.var_169 = true;
               const_398.push(this);
            }
         }
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.setIsLikable(false);
            if(this._window)
            {
               this._window.findChildByName(LINK).removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onLinkClicked);
               this._window.dispose();
               this._window = null;
            }
            if(this.var_169)
            {
               const_398.splice(const_398.indexOf(this),1);
               this.var_169 = false;
            }
            this._disposed = true;
         }
      }
      
      private function onLinkClicked(param1:WindowMouseEvent) : void
      {
         var _loc2_:* = null;
         if(LinkResolver.open(this.var_899))
         {
            _loc2_ = this._window.findChildByName(LINK);
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onLinkClicked);
            _loc2_.visible = false;
         }
      }
      
      private function onLikeMouseEvent(param1:WindowMouseEvent) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(var_1428 && true)
            {
               var_1428.likeStreamEvent(this);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            IWindowContainer(this._window.findChildByName(const_248)).findChildByName(const_399).color = 4294967295;
            IWindowContainer(this._window.findChildByName(const_248)).findChildByName(const_399).blend = 0.5;
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            IWindowContainer(this._window.findChildByName(const_248)).findChildByName(const_399).color = !!this.even ? uint(const_496) : uint(const_741);
         }
      }
      
      private function setIsLikable(param1:Boolean) : void
      {
         var _loc2_:IRegionWindow = this._window.findChildByName(const_248) as IRegionWindow;
         _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onLikeMouseEvent);
         _loc2_.removeEventListener(WindowMouseEvent.const_25,this.onLikeMouseEvent);
         _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onLikeMouseEvent);
         _loc2_.findChildByName(const_399).color = !!this.even ? uint(const_496) : uint(const_741);
         ITextWindow(_loc2_.findChildByName(const_497)).underline = param1;
         ITextWindow(_loc2_.findChildByName(const_497)).textColor = !!param1 ? 4278220726 : uint(4283058242);
         if(param1)
         {
            _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onLikeMouseEvent);
            _loc2_.addEventListener(WindowMouseEvent.const_25,this.onLikeMouseEvent);
            _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onLikeMouseEvent);
            _loc2_.enable();
         }
         else
         {
            _loc2_.disable();
         }
      }
      
      private function onImageFileLoaded(param1:AssetLoaderEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1.type == AssetLoaderEvent.ASSET_LOADER_EVENT_COMPLETE)
         {
            _loc2_ = param1.target as AssetLoaderStruct;
            if(_loc2_.assetName == this.var_1419)
            {
               _loc3_ = ASSETS.getAssetByName(this.var_1419);
               if(_loc3_)
               {
                  this.image = _loc3_.content as BitmapData;
               }
            }
         }
      }
   }
}
