package com.sulake.habbo.help.hotelmerge
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.avatar.ChangeUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.INameChangeUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   
   public class HotelMergeUI implements INameChangeUI
   {
       
      
      private var var_198:HabboHelp;
      
      private var _view:HotelMergeNameChangeView;
      
      public function HotelMergeUI(param1:HabboHelp)
      {
         super();
         this.var_198 = param1;
      }
      
      public function get assets() : IAssetLibrary
      {
         return this.var_198.assets;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_198.localization;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this.var_198.windowManager;
      }
      
      public function dispose() : void
      {
         this.var_198 = null;
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
      }
      
      public function startNameChange() : void
      {
         if(!this._view)
         {
            this._view = new HotelMergeNameChangeView(this);
         }
         this._view.showMainView();
      }
      
      public function changeName(param1:String) : void
      {
         this.var_198.sendMessage(new ChangeUserNameMessageComposer(param1));
      }
      
      public function checkName(param1:String) : void
      {
         this.var_198.sendMessage(new CheckUserNameMessageComposer(param1));
      }
      
      public function onUserNameChanged(param1:String) : void
      {
         var name:String = param1;
         if(!this.var_198)
         {
            return;
         }
         this.var_198.localization.registerParameter("help.tutorial.name.changed","name",name);
         this.var_198.windowManager.alert("${generic.notice}","${help.tutorial.name.changed}",0,function(param1:IAlertDialog, param2:WindowEvent):void
         {
            param1.dispose();
         });
      }
      
      public function onChangeUserNameResult(param1:ChangeUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ChangeUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_512)
         {
            this._view.dispose();
         }
         else
         {
            this._view.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function onCheckUserNameResult(param1:CheckUserNameResultMessageEvent) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:CheckUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_512)
         {
            this._view.checkedName = _loc2_.name;
         }
         else
         {
            this._view.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function get myName() : String
      {
         return this.var_198.ownUserName;
      }
      
      public function showView(param1:String) : void
      {
      }
      
      public function buildXmlWindow(param1:String, param2:uint = 1) : IWindow
      {
         if(this.var_198 == null || this.var_198.assets == null)
         {
            return null;
         }
         var _loc3_:XmlAsset = XmlAsset(this.var_198.assets.getAssetByName(param1 + "_xml"));
         if(_loc3_ == null || this.var_198.windowManager == null)
         {
            return null;
         }
         return this.var_198.windowManager.buildFromXML(XML(_loc3_.content),param2);
      }
   }
}
