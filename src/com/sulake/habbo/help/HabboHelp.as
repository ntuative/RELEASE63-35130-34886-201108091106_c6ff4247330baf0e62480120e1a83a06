package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.utils.Dictionary;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_412:IHabboToolbar;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_280:IHabboCommunicationManager;
      
      private var var_437:IHabboLocalizationManager;
      
      private var var_621:IHabboConfigurationManager;
      
      private var var_404:ISessionDataManager;
      
      private var var_1304:FaqIndex;
      
      private var var_1530:IncomingMessages;
      
      private var var_75:HelpUI;
      
      private var var_124:TutorialUI;
      
      private var var_848:HotelMergeUI;
      
      private var var_1607:CallForHelpData;
      
      private var var_2740:UserRegistry;
      
      private var var_2741:String = "";
      
      private var var_1065:WelcomeScreenController;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1607 = new CallForHelpData();
         this.var_2740 = new UserRegistry();
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_1304 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
      }
      
      public function set ownUserName(param1:String) : void
      {
         this.var_2741 = param1;
      }
      
      public function get ownUserName() : String
      {
         return this.var_2741;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return this.var_1607;
      }
      
      public function get userRegistry() : UserRegistry
      {
         return this.var_2740;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_437;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this.var_412;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_404;
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return this.var_124;
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return this.var_848;
      }
      
      public function hasChangedName() : Boolean
      {
         if(this.var_124)
         {
            return this.var_124.hasChangedName;
         }
         return true;
      }
      
      override public function dispose() : void
      {
         if(this.var_75 != null)
         {
            this.var_75.dispose();
            this.var_75 = null;
         }
         if(this.var_124 != null)
         {
            this.var_124.dispose();
            this.var_124 = null;
         }
         if(this.var_848)
         {
            this.var_848.dispose();
            this.var_848 = null;
         }
         if(this.var_1304 != null)
         {
            this.var_1304.dispose();
            this.var_1304 = null;
         }
         this.var_1530 = null;
         if(this.var_412)
         {
            this.var_412.release(new IIDHabboToolbar());
            this.var_412 = null;
         }
         if(this.var_437)
         {
            this.var_437.release(new IIDHabboLocalizationManager());
            this.var_437 = null;
         }
         if(this.var_280)
         {
            this.var_280.release(new IIDHabboCommunicationManager());
            this.var_280 = null;
         }
         if(this.var_621)
         {
            this.var_621.release(new IIDHabboConfigurationManager());
            this.var_621 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_404 != null)
         {
            this.var_404.release(new IIDSessionDataManager());
            this.var_404 = null;
         }
         if(this.var_1065 != null)
         {
            this.var_1065.dispose();
            this.var_1065 = null;
         }
         super.dispose();
      }
      
      public function showUI(param1:String = null) : void
      {
         if(this.var_75 != null)
         {
            this.var_75.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(this.var_75 != null)
         {
            this.var_75.hideUI();
         }
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_75 != null)
         {
            this.var_75.tellUI(param1,param2);
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(this.var_75 != null)
         {
            this.var_75.updateCallForGuideBotUI(true);
         }
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(this.var_75 != null)
         {
            this.var_75.updateCallForGuideBotUI(false);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return this.var_1304;
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(this.var_280 != null && param1 != null)
         {
            this.var_280.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_621 == null)
         {
            return param1;
         }
         return this.var_621.getKey(param1,param2,param3);
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(this.var_75 != null)
         {
            this.var_75.showCallForHelpReply(param1);
         }
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(this.var_75 != null)
         {
            this.var_75.showCallForHelpResult(param1);
         }
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         this.var_1607.reportedUserId = param1;
         this.var_1607.reportedUserName = param2;
         this.var_75.showUI(HabboHelpViewEnum.const_444);
      }
      
      private function toggleHelpUI() : void
      {
         if(this.var_75 == null)
         {
            if(!this.createHelpUI())
            {
               return;
            }
         }
         this.var_75.toggleUI();
      }
      
      private function createHelpUI() : Boolean
      {
         if(this.var_75 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_75 = new HelpUI(this,this._assetLibrary,this._windowManager);
         }
         return this.var_75 != null;
      }
      
      private function createTutorialUI() : Boolean
      {
         var _loc1_:* = false;
         if(this.var_124 == null && this._assetLibrary != null && this._windowManager != null)
         {
            _loc1_ = this.getConfigurationKey("avatar.widget.enabled","0") == "0";
            this.var_124 = new TutorialUI(this,_loc1_);
         }
         return this.var_124 != null;
      }
      
      public function removeTutorialUI() : void
      {
         if(this.var_124 != null)
         {
            this.var_124.dispose();
            this.var_124 = null;
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!this.var_848)
         {
            this.var_848 = new HotelMergeUI(this);
         }
         this.var_848.startNameChange();
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            this.removeTutorialUI();
            return;
         }
         if(this.var_124 == null)
         {
            if(!this.createTutorialUI())
            {
               return;
            }
         }
         this.var_124.update(param1,param2,param3);
      }
      
      public function startNameChange() : void
      {
         if(this.var_124)
         {
            this.var_124.showView(TutorialUI.const_325);
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_280 = IHabboCommunicationManager(param2);
         this.var_1530 = new IncomingMessages(this,this.var_280);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_412 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_437 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_621 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_77,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_81,this.onRoomSessionEvent);
         this.var_412.events.addEventListener(HabboToolbarEvent.const_48,this.onHabboToolbarEvent);
         this.createHelpUI();
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_404 = param2 as ISessionDataManager;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_77:
               if(this.var_75 != null)
               {
                  this.var_75.setRoomSessionStatus(true);
               }
               if(this.var_124 != null)
               {
                  this.var_124.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_81:
               if(this.var_75 != null)
               {
                  this.var_75.setRoomSessionStatus(false);
               }
               if(this.var_124 != null)
               {
                  this.var_124.setRoomSessionStatus(false);
               }
               this.userRegistry.unregisterRoom();
         }
      }
      
      public function showWelcomeScreen(param1:WelcomeNotification) : void
      {
         if(!this.var_1065)
         {
            this.var_1065 = new WelcomeScreenController(this,this._windowManager);
         }
         this.var_1065.showWelcomeScreen(param1);
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_48)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               this.toggleHelpUI();
            }
         }
      }
   }
}
