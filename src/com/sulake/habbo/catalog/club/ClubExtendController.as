package com.sulake.habbo.catalog.club
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.communication.messages.incoming.catalog.ClubOfferExtendData;
   import com.sulake.habbo.communication.messages.incoming.catalog.HabboClubExtendOfferMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
   import com.sulake.habbo.communication.messages.parser.catalog.HabboClubExtendOfferMessageParser;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class ClubExtendController
   {
       
      
      private var _catalog:HabboCatalog;
      
      private var var_204:ClubExtendConfirmationDialog;
      
      private var var_104:ClubOfferExtendData;
      
      private var _disposed:Boolean = false;
      
      public function ClubExtendController(param1:HabboCatalog)
      {
         super();
         this._catalog = param1;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this.closeConfirmation();
         this.var_104 = null;
         this._catalog = null;
         this._disposed = true;
      }
      
      public function onOffer(param1:HabboClubExtendOfferMessageEvent) : void
      {
         if(this._disposed)
         {
            return;
         }
         var _loc2_:HabboClubExtendOfferMessageParser = param1.getParser();
         this.var_104 = _loc2_.offer();
         this.showConfirmation();
         if(this._catalog.connection)
         {
            if(this.var_104.vip)
            {
               this._catalog.connection.send(new EventLogMessageComposer("Catalog","dialog_show","vip.membership.extension.purchase"));
            }
            else
            {
               this._catalog.connection.send(new EventLogMessageComposer("Catalog","dialog_show","basic.membership.extension.purchase"));
            }
         }
      }
      
      public function closeConfirmation() : void
      {
         if(this.var_204)
         {
            this.var_204.dispose();
            this.var_204 = null;
         }
      }
      
      public function showConfirmation() : void
      {
         this.closeConfirmation();
         this.var_204 = new ClubExtendConfirmationDialog(this,this.var_104);
         this.var_204.showConfirmation();
      }
      
      public function confirmSelection() : void
      {
         if(!this._catalog || !this._catalog.connection || !this.var_104)
         {
            return;
         }
         if(this.var_104.vip)
         {
            this._catalog.purchaseVipMembershipExtension(this.var_104.offerId);
         }
         else
         {
            this._catalog.purchaseBasicMembershipExtension(this.var_104.offerId);
         }
         this.closeConfirmation();
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         if(!this._catalog)
         {
            return null;
         }
         return this._catalog.windowManager;
      }
      
      public function get localization() : ICoreLocalizationManager
      {
         if(!this._catalog)
         {
            return null;
         }
         return this._catalog.localization;
      }
      
      public function get assets() : IAssetLibrary
      {
         if(!this._catalog)
         {
            return null;
         }
         return this._catalog.assets;
      }
   }
}
