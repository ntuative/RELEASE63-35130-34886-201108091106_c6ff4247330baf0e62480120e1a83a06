package com.sulake.habbo.avatar.promo
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.ISideContentModel;
   import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
   
   public class ClubPromoModel implements ISideContentModel
   {
       
      
      private var var_27:HabboAvatarEditor;
      
      private var _view:ClubPromoView;
      
      public function ClubPromoModel(param1:HabboAvatarEditor)
      {
         super();
         this.var_27 = param1;
      }
      
      public function dispose() : void
      {
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
      }
      
      public function reset() : void
      {
      }
      
      private function init() : void
      {
         if(!this._view)
         {
            this._view = new ClubPromoView(this);
         }
      }
      
      public function tryClubClothes() : void
      {
         this._view.showBuyView();
         if(this.var_27)
         {
            this.var_27.useClubClothing();
         }
         if(this.var_27.manager.communication)
         {
            this.var_27.manager.communication.getHabboMainConnection(null).send(new EventLogMessageComposer("AvatarEditor","click","try_club_clothes"));
         }
      }
      
      public function get controller() : HabboAvatarEditor
      {
         return this.var_27;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         this.init();
         if(this._view)
         {
            return this._view.getWindowContainer();
         }
         return null;
      }
   }
}
