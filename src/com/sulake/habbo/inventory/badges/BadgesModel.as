package com.sulake.habbo.inventory.badges
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.inventory.badges.GetBadgesComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.badges.SetActivatedBadgesComposer;
   import com.sulake.habbo.communication.messages.outgoing.notifications.ResetUnseenItemsComposer;
   import com.sulake.habbo.communication.messages.outgoing.notifications.UnseenItemCategoryEnum;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class BadgesModel implements IInventoryModel
   {
      
      public static const const_1874:int = -1;
      
      public static const const_679:int = 0;
      
      public static const const_346:int = 1;
       
      
      private var var_27:HabboInventory;
      
      private var _view:BadgesView;
      
      private var var_245:Array;
      
      private var var_810:Array;
      
      private var var_1248:Map;
      
      private var var_650:Array;
      
      private var _assets:IAssetLibrary;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_404:ISessionDataManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _disposed:Boolean = false;
      
      private const const_2396:int = 5;
      
      public function BadgesModel(param1:HabboInventory, param2:IHabboWindowManager, param3:IHabboCommunicationManager, param4:IAssetLibrary, param5:ISessionDataManager)
      {
         super();
         this.var_27 = param1;
         this._windowManager = param2;
         this.var_245 = new Array();
         this.var_810 = new Array();
         this._assets = param4;
         this._communication = param3;
         this.var_404 = param5;
         this.var_404.events.addEventListener(BadgeImageReadyEvent.const_139,this.onBadgeImageReady);
         this._view = new BadgesView(this,param2,param4);
         this.var_650 = [];
         this.var_1248 = new Map();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_27 = null;
         this._windowManager = null;
         this.var_245 = null;
         this.var_810 = null;
         if(this.var_1248)
         {
            this.var_1248.dispose();
            this.var_1248 = null;
         }
         if(this._view != null)
         {
            this._view.dispose();
            this._view = null;
         }
         this._assets = null;
         this._communication = null;
         if(this.var_404 != null)
         {
            this.var_404.events.removeEventListener(BadgeImageReadyEvent.const_139,this.onBadgeImageReady);
            this.var_404 = null;
         }
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
         this._communication.getHabboMainConnection(null).send(new GetBadgesComposer());
      }
      
      public function getMaxActiveCount() : int
      {
         return this.const_2396;
      }
      
      public function updateView() : void
      {
         if(this._view != null)
         {
            this._view.updateAll();
         }
      }
      
      private function updateActionView() : void
      {
         if(this._view != null)
         {
            this._view.updateActionView();
         }
      }
      
      private function startWearingBadge(param1:Badge) : void
      {
         this.var_810.push(param1);
         param1.isInUse = true;
      }
      
      private function stopWearingBadge(param1:Badge) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.var_810.length)
         {
            if(this.var_810[_loc2_] == param1)
            {
               this.var_810.splice(_loc2_,1);
               param1.isInUse = false;
               return;
            }
            _loc2_++;
         }
      }
      
      public function updateBadge(param1:String, param2:Boolean, param3:int = 0) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = false;
         var _loc11_:* = null;
         if(param3 > 0)
         {
            this.var_1248.add(param1,param3);
         }
         var _loc4_:Badge = this.getBadge(param1);
         if(_loc4_ != null)
         {
            if(_loc4_.isInUse != param2)
            {
               if(param2)
               {
                  this.startWearingBadge(_loc4_);
               }
               else
               {
                  this.stopWearingBadge(_loc4_);
               }
            }
         }
         else
         {
            _loc5_ = this._assets.getAssetByName("inventory_thumb_xml");
            _loc6_ = XmlAsset(_loc5_);
            _loc7_ = this._windowManager.buildFromXML(XML(_loc6_.content)) as IWindowContainer;
            _loc8_ = this._assets.getAssetByName("thumb_selected_outline_png") as BitmapDataAsset;
            _loc9_ = _loc7_.findChildByName("outline") as IBitmapWrapperWindow;
            _loc9_.bitmap = _loc8_.content as BitmapData;
            _loc9_.disposesBitmap = false;
            _loc10_ = this.var_650.indexOf(param3) != -1;
            _loc11_ = new Badge(param1,_loc7_,_loc10_);
            _loc11_.iconImage = this.var_404.getBadgeImage(param1);
            if(_loc10_)
            {
               this.var_245.unshift(_loc11_);
            }
            else
            {
               this.var_245.push(_loc11_);
            }
            if(param2)
            {
               this.startWearingBadge(_loc11_);
            }
         }
      }
      
      private function getBadge(param1:String) : Badge
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_245.length)
         {
            _loc3_ = this.var_245[_loc2_];
            if(_loc3_.type == param1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function removeBadge(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_245.length)
         {
            _loc3_ = this.var_245[_loc2_];
            if(_loc3_.type == param1)
            {
               this.var_245.splice(_loc2_,1);
               this.stopWearingBadge(_loc3_);
               this.updateView();
               return;
            }
            _loc2_++;
         }
      }
      
      public function toggleBadgeWearing(param1:String) : void
      {
         var _loc2_:Badge = this.getBadge(param1);
         if(_loc2_ != null)
         {
            if(_loc2_.isInUse)
            {
               this.stopWearingBadge(_loc2_);
            }
            else
            {
               this.startWearingBadge(_loc2_);
            }
            this.saveBadgeSelection();
         }
      }
      
      public function saveBadgeSelection() : void
      {
         var _loc4_:* = null;
         var _loc1_:SetActivatedBadgesComposer = new SetActivatedBadgesComposer();
         var _loc2_:Array = this.getBadges(const_346);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_];
            _loc1_.addActivatedBadge(_loc4_.type);
            _loc3_++;
         }
         this._communication.getHabboMainConnection(null).send(_loc1_);
      }
      
      public function setBadgeSelected(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_245.length)
         {
            _loc3_ = this.var_245[_loc2_] as Badge;
            if(_loc3_ != null)
            {
               _loc3_.isSelected = _loc3_.type == param1;
            }
            _loc2_++;
         }
         this.updateActionView();
      }
      
      public function forceSelection() : void
      {
         var _loc1_:Badge = this.getSelectedBadge();
         if(_loc1_ != null)
         {
            return;
         }
         var _loc2_:Array = this.getBadges(const_679);
         if(_loc2_ != null && _loc2_.length > 0)
         {
            _loc1_ = _loc2_[0] as Badge;
            _loc1_.isSelected = true;
            this.updateView();
            return;
         }
         var _loc3_:Array = this.getBadges(const_346);
         if(_loc3_ != null && _loc3_.length > 0)
         {
            _loc1_ = _loc3_[0] as Badge;
            _loc1_.isSelected = true;
            this.updateView();
         }
      }
      
      public function getSelectedBadge(param1:int = -1) : Badge
      {
         var _loc4_:* = null;
         var _loc2_:Array = this.getBadges(param1);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_];
            if(_loc4_.isSelected)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getBadges(param1:int = -1) : Array
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         switch(param1)
         {
            case const_1874:
               return this.var_245;
            case const_679:
               _loc2_ = new Array();
               for each(_loc3_ in this.var_245)
               {
                  if(!_loc3_.isInUse)
                  {
                     _loc2_.push(_loc3_);
                  }
               }
               return _loc2_;
            case const_346:
               return this.var_810;
            default:
               Logger.log("Unexpected filter. Returning an empty array to maintain backward compatibility");
               return new Array();
         }
      }
      
      public function getBadgeFromActive(param1:int) : Badge
      {
         return this.getItemInIndex(param1,const_346);
      }
      
      public function getBadgeFromInactive(param1:int) : Badge
      {
         return this.getItemInIndex(param1,const_679);
      }
      
      public function getItemInIndex(param1:int, param2:int = -1) : Badge
      {
         var _loc3_:Array = this.getBadges(param2);
         if(param1 < 0 || param1 >= _loc3_.length)
         {
            return null;
         }
         return _loc3_[param1];
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return this._view.getWindowContainer();
      }
      
      private function onBadgeImageReady(param1:BadgeImageReadyEvent) : void
      {
         var _loc2_:Badge = this.getBadge(param1.badgeId);
         if(_loc2_ != null)
         {
            _loc2_.iconImage = param1.badgeImage.clone();
            this.updateActionView();
         }
      }
      
      public function closingInventoryView() : void
      {
         if(this._view.isVisible)
         {
            this.resetUnseenItems();
         }
      }
      
      public function categorySwitch(param1:String) : void
      {
         if(param1 == InventoryCategory.const_278 && this.var_27.isVisible)
         {
            this.var_27.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_BADGES));
         }
      }
      
      public function subCategorySwitch(param1:String) : void
      {
      }
      
      public function get controller() : HabboInventory
      {
         return this.var_27;
      }
      
      public function addUnseenBadges(param1:Array) : void
      {
         var _loc2_:int = 0;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1)
         {
            if(this.var_650.indexOf(_loc2_) == -1)
            {
               this.var_650.push(_loc2_);
            }
         }
      }
      
      public function getUnseenItemCount() : int
      {
         return this.var_650.length;
      }
      
      public function resetUnseenItems() : void
      {
         var _loc2_:* = null;
         if(!this.var_27.isMainViewActive)
         {
            return;
         }
         var _loc1_:IConnection = this._communication.getHabboMainConnection(null);
         if(this.var_650 && this.var_650.length > 0)
         {
            _loc1_.send(new ResetUnseenItemsComposer(UnseenItemCategoryEnum.const_1215));
            this.var_650 = [];
            for each(_loc2_ in this.var_245)
            {
               _loc2_.isUnseen = false;
            }
            this.updateView();
            this.var_27.updateUnseenItemCounts();
         }
      }
   }
}
