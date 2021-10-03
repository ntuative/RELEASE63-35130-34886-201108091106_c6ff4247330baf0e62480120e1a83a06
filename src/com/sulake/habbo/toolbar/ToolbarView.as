package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IBorderWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.event.CatalogEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   
   public class ToolbarView
   {
      
      private static const const_1495:Point = new Point(3,3);
      
      private static const const_1584:uint = 7433577;
      
      private static const const_1585:uint = 5723213;
      
      private static const const_483:String = "_hover";
      
      private static const const_484:String = "_normal";
      
      private static const const_482:int = 5;
      
      private static const const_1588:int = 600;
      
      private static const const_1586:int = 80;
      
      private static const const_1587:int = 74;
      
      private static const ICON_SPACING_NORMAL:int = 10;
      
      private static const const_1589:int = -2;
      
      private static const const_1583:int = 5;
      
      private static const const_1582:int = 10;
       
      
      private var _window:IWindowContainer;
      
      private var _events:IEventDispatcher;
      
      private var _config:IHabboConfigurationManager;
      
      private var _disposed:Boolean;
      
      private var var_412:HabboToolbar;
      
      private var _assets:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _catalog:IHabboCatalog;
      
      private var var_1037:Map;
      
      private var var_219:IWindowContainer;
      
      private var var_2639:Boolean;
      
      private var var_1563:Boolean;
      
      private var var_1561:BitmapData;
      
      private var var_1562:BitmapData;
      
      public function ToolbarView(param1:HabboToolbar, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IConnection, param5:IHabboCatalog, param6:IEventDispatcher, param7:IHabboConfigurationManager)
      {
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         super();
         this.var_412 = param1;
         this._windowManager = param2;
         this._assets = param3;
         this._events = param6;
         this._config = param7;
         this.var_1037 = new Map();
         var _loc8_:XmlAsset = param3.getAssetByName("toolbar_view_with_achievements_xml") as XmlAsset;
         this._window = param2.buildFromXML(_loc8_.content as XML,2) as IWindowContainer;
         if(this._window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         this._window.position = const_1495;
         this._window.addEventListener(WindowEvent.const_647,this.onParentResized);
         var _loc9_:Array = new Array();
         this._window.groupChildrenWithTag("ICON_REG",_loc9_,true);
         for each(_loc10_ in _loc9_)
         {
            if(_loc10_)
            {
               _loc10_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onIconMouseEvent);
               _loc10_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onIconHoverMouseEvent);
               _loc10_.addEventListener(WindowMouseEvent.const_25,this.onIconHoverMouseEvent);
            }
         }
         _loc9_ = new Array();
         this._window.groupChildrenWithTag("ICON_BMP",_loc9_,true);
         for each(_loc11_ in _loc9_)
         {
            this.setIconHoverState(_loc11_,const_484);
         }
         this.iconVisibility("QUESTS",false);
         this.iconVisibility("MEMENU",false);
         this.iconVisibility("INVENTORY",false);
         _loc12_ = param3.getAssetByName("new_items_label_xml") as XmlAsset;
         this.var_219 = param2.buildFromXML(_loc12_.content as XML,2) as IWindowContainer;
         if(this.var_219 == null)
         {
            throw new Error("Failed to construct toolbar label from XML!");
         }
         var _loc13_:IWindowContainer = this._window.findChildByName("CATALOGUE") as IWindowContainer;
         _loc13_.addChild(this.var_219);
         var _loc14_:ITextWindow = this.var_219.findChildByName("new_textfield") as ITextWindow;
         var _loc15_:ILocalization = param5.localization.getLocalization("toolbar.new_additions.notification");
         if(_loc15_ != null)
         {
            _loc14_.text = _loc15_.value;
         }
         this.var_219.visible = false;
         this.var_219.x = _loc13_.width - this.var_219.width - const_482;
         this.var_219.y = const_482;
         this.var_2639 = this.isNewItemsNotificationEnabled();
         this._catalog = param5;
         if(this._catalog != null)
         {
            this.disableCatalogIcon();
            this._catalog.events.addEventListener(CatalogEvent.CATALOG_INITIALIZED,this.onCatalogEvent);
            this._catalog.events.addEventListener(CatalogEvent.CATALOG_NOT_READY,this.onCatalogEvent);
            this._catalog.events.addEventListener(CatalogEvent.CATALOG_NEW_ITEMS_SHOW,this.onCatalogEvent);
            this._catalog.events.addEventListener(CatalogEvent.CATALOG_NEW_ITEMS_HIDE,this.onCatalogEvent);
         }
         this.checkSize(true);
      }
      
      private function onParentResized(param1:WindowEvent) : void
      {
         this.checkSize();
      }
      
      private function checkSize(param1:Boolean = false) : void
      {
         var _loc6_:* = null;
         if(!this._window || !this._windowManager)
         {
            return;
         }
         var _loc2_:* = this._windowManager.getDesktop(2).height < const_1588;
         if(!param1 && _loc2_ == this.var_1563)
         {
            return;
         }
         this.var_1563 = _loc2_;
         var _loc3_:int = !!_loc2_ ? int(const_1587) : int(const_1586);
         var _loc4_:int = !!_loc2_ ? int(const_1589) : int(ICON_SPACING_NORMAL);
         var _loc5_:Array = new Array();
         this._window.groupChildrenWithTag("ICON_REG",_loc5_);
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc6_ = _loc5_[_loc7_];
            _loc6_.height = _loc3_;
            _loc6_.y = const_1583 + _loc7_ * (_loc3_ + _loc4_);
            _loc7_++;
         }
         this._window.height = _loc6_.rectangle.bottom + const_1582;
      }
      
      public function dispose() : void
      {
         if(this.var_1037 != null)
         {
            this.var_1037.dispose();
            this.var_1037 = null;
         }
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_219 != null)
         {
            this.var_219.dispose();
            this.var_219 = null;
         }
         this.var_412 = null;
         this._windowManager = null;
         this._assets = null;
         this._config = null;
         this._disposed = true;
         if(this._events)
         {
            this._events = null;
         }
         if(this._catalog != null)
         {
            this._catalog.events.removeEventListener(CatalogEvent.CATALOG_INITIALIZED,this.onCatalogEvent);
            this._catalog.events.removeEventListener(CatalogEvent.CATALOG_NOT_READY,this.onCatalogEvent);
            this._catalog.events.removeEventListener(CatalogEvent.CATALOG_NEW_ITEMS_SHOW,this.onCatalogEvent);
            this._catalog.events.removeEventListener(CatalogEvent.CATALOG_NEW_ITEMS_HIDE,this.onCatalogEvent);
            this._catalog = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      private function disableCatalogIcon() : void
      {
         var _loc1_:IWindowContainer = this._window.findChildByName("CATALOGUE") as IWindowContainer;
         _loc1_.blend = 0.5;
         _loc1_.disable();
      }
      
      private function onCatalogEvent(param1:CatalogEvent) : void
      {
         var _loc2_:* = null;
         switch(param1.type)
         {
            case CatalogEvent.CATALOG_INITIALIZED:
               _loc2_ = this._window.findChildByName("CATALOGUE") as IWindowContainer;
               _loc2_.blend = 1;
               _loc2_.enable();
               break;
            case CatalogEvent.CATALOG_NOT_READY:
               this.disableCatalogIcon();
               break;
            case CatalogEvent.CATALOG_NEW_ITEMS_SHOW:
               if(this.var_219 != null && this.var_2639)
               {
                  this.var_219.visible = true;
               }
               break;
            case CatalogEvent.CATALOG_NEW_ITEMS_HIDE:
               if(this.var_219 != null)
               {
                  this.var_219.visible = false;
               }
         }
      }
      
      public function setToolbarState(param1:String) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:* = null;
         var _loc2_:Array = new Array();
         this._window.groupChildrenWithTag("VIEW_STATE_TOGGLE",_loc2_,true);
         switch(param1)
         {
            case HabboToolbarEnum.const_905:
               _loc3_ = false;
               break;
            case HabboToolbarEnum.const_1037:
               _loc3_ = true;
         }
         for each(_loc4_ in _loc2_)
         {
            if(_loc4_)
            {
               _loc4_.visible = _loc3_;
            }
         }
      }
      
      private function iconVisibility(param1:String, param2:Boolean) : void
      {
         var _loc3_:IWindowContainer = this._window.findChildByName(param1) as IWindowContainer;
         if(_loc3_)
         {
            _loc3_.visible = param2;
         }
      }
      
      private function onIconHoverMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:IWindowContainer = param1.target as IWindowContainer;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:IBorderWindow = _loc2_.findChildByTag("ICON_BORDER") as IBorderWindow;
         var _loc4_:IBitmapWrapperWindow = _loc2_.findChildByTag("ICON_BMP") as IBitmapWrapperWindow;
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               this.setIconHoverState(_loc4_,const_483);
               this.setIconBgHoverState(_loc3_,const_483);
               break;
            case WindowMouseEvent.const_25:
               this.setIconHoverState(_loc4_,const_484);
               this.setIconBgHoverState(_loc3_,const_484);
         }
      }
      
      private function setIconHoverState(param1:IBitmapWrapperWindow, param2:String) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(!param1)
         {
            return;
         }
         var _loc3_:String = param1.name;
         if(_loc3_ == "icon_me_menu")
         {
            _loc4_ = param2 == const_483 ? this.var_1562 : this.var_1561;
         }
         else
         {
            _loc5_ = _loc3_ + param2;
            _loc6_ = this._assets.getAssetByName(_loc5_);
            if(!_loc6_)
            {
               Logger.log("Error, could not locate toolbar icon asset: " + _loc3_);
            }
            else
            {
               _loc4_ = _loc6_.content as BitmapData;
            }
         }
         if(_loc4_)
         {
            this.drawIconBitmap(param1,_loc4_);
         }
      }
      
      private function setIconBgHoverState(param1:IWindowContainer, param2:String) : void
      {
         if(!param1)
         {
            return;
         }
         if(param2 == const_483)
         {
            param1.color = const_1584;
         }
         else
         {
            param1.color = const_1585;
         }
      }
      
      private function onIconMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:String = IWindow(param1.target).name;
         this.var_412.toggleWindowVisibility(_loc2_);
      }
      
      public function setIconBitmap(param1:String, param2:BitmapData) : void
      {
         var _loc3_:* = null;
         if(!param2)
         {
            return;
         }
         switch(param1)
         {
            case HabboToolbarIconEnum.MEMENU:
               _loc3_ = "icon_me_menu";
               this.setMeMenuIconBitmaps(param2);
         }
         var _loc4_:IBitmapWrapperWindow = this._window.findChildByName(_loc3_) as IBitmapWrapperWindow;
         if(_loc4_)
         {
            this.setIconHoverState(_loc4_,const_484);
         }
      }
      
      public function getIconVerticalLocation(param1:String) : int
      {
         switch(param1)
         {
            case HabboToolbarIconEnum.NAVIGATOR:
               return !!this.var_1563 ? 45 : 50;
            case HabboToolbarIconEnum.QUESTS:
               return !!this.var_1563 ? 125 : 140;
            default:
               return 0;
         }
      }
      
      private function setMeMenuIconBitmaps(param1:BitmapData) : void
      {
         if(this.var_1561)
         {
            this.var_1561.dispose();
         }
         this.var_1561 = this.addShadow(param1,new Point(2,3),4280426782);
         if(this.var_1562)
         {
            this.var_1562.dispose();
         }
         this.var_1562 = this.addShadow(param1,new Point(4,5),4281150249);
         param1.dispose();
      }
      
      private function addShadow(param1:BitmapData, param2:Point, param3:uint) : BitmapData
      {
         var _loc4_:BitmapData = new BitmapData(param1.width,param1.height,true,0);
         _loc4_.fillRect(_loc4_.rect,param3);
         _loc4_.copyChannel(param1,param1.rect,new Point(0,0),BitmapDataChannel.ALPHA,BitmapDataChannel.ALPHA);
         var _loc5_:BitmapData = new BitmapData(param1.width + param2.x,param1.height + param2.y,true,0);
         _loc5_.copyPixels(_loc4_,_loc4_.rect,param2);
         _loc5_.copyPixels(param1,param1.rect,new Point(0,0),null,null,true);
         _loc4_.dispose();
         return _loc5_;
      }
      
      private function drawIconBitmap(param1:IBitmapWrapperWindow, param2:BitmapData) : void
      {
         if(!param1.bitmap)
         {
            param1.bitmap = new BitmapData(param1.width,param1.height,true,0);
         }
         else
         {
            param1.bitmap.fillRect(param1.bitmap.rect,0);
         }
         var _loc3_:Point = new Point(int((param1.width - param2.width) / 2),int((param1.height - param2.height) / 2));
         param1.bitmap.copyPixels(param2,param2.rect,_loc3_,null,null,true);
         param1.invalidate();
      }
      
      public function setUnseenItemCount(param1:String, param2:int) : void
      {
         var _loc3_:IWindowContainer = this.getUnseenItemCounter(param1);
         if(!_loc3_)
         {
            return;
         }
         if(param2 > 0)
         {
            _loc3_.visible = true;
            _loc3_.findChildByName("count").caption = param2.toString();
         }
         else
         {
            _loc3_.visible = false;
         }
      }
      
      public function getUnseenItemCounter(param1:String) : IWindowContainer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 != HabboToolbarIconEnum.INVENTORY)
         {
            return null;
         }
         var _loc2_:IWindowContainer = this.var_1037.getValue(param1) as IWindowContainer;
         if(!_loc2_)
         {
            _loc3_ = this._assets.getAssetByName("unseen_items_counter_xml") as XmlAsset;
            _loc2_ = this._windowManager.buildFromXML(_loc3_.content as XML) as IWindowContainer;
            _loc4_ = this._window.findChildByName("INVENTORY") as IWindowContainer;
            _loc4_.addChild(_loc2_);
            _loc2_.x = _loc4_.width - _loc2_.width - const_482;
            _loc2_.y = const_482;
            this.var_1037.add(param1,_loc2_);
         }
         return _loc2_;
      }
      
      public function isNewItemsNotificationEnabled() : Boolean
      {
         return this._config.getKey("toolbar.new_additions.notification.enabled","CfhChatlogMessageParser") == "true";
      }
   }
}
