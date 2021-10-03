package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IOutfit;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class WardrobeSlot implements IOutfit, IAvatarImageListener
   {
       
      
      private var var_27:HabboAvatarEditor;
      
      private var var_630:String;
      
      private var var_975:String;
      
      private var var_1470:Boolean;
      
      private var _view:IWindowContainer;
      
      private var var_369:IBitmapWrapperWindow;
      
      private var var_1766:int;
      
      private var var_1164:Boolean;
      
      public function WardrobeSlot(param1:HabboAvatarEditor, param2:int, param3:Boolean, param4:String = null, param5:String = null)
      {
         super();
         this.var_27 = param1;
         this.var_1766 = param2;
         this.createView();
         this.update(param4,param5,param3);
      }
      
      public function get id() : int
      {
         return this.var_1766;
      }
      
      public function update(param1:String, param2:String, param3:Boolean) : void
      {
         switch(param2)
         {
            case FigureData.const_90:
            case "m":
            case "M":
               param2 = "null";
               break;
            case FigureData.FEMALE:
            case "f":
            case "F":
               param2 = "null";
         }
         this.var_630 = param1;
         this.var_975 = param2;
         this.var_1470 = param3;
         this.updateView();
      }
      
      private function createView() : void
      {
         var _loc1_:XmlAsset = this.var_27.manager.assets.getAssetByName("wardrobe_slot") as XmlAsset;
         if(!_loc1_)
         {
            return;
         }
         this._view = this.var_27.manager.windowManager.buildFromXML(_loc1_.content as XML) as IWindowContainer;
         this._view.procedure = this.eventHandler;
         this._view.visible = false;
         this.var_369 = this._view.findChildByName("image") as IBitmapWrapperWindow;
      }
      
      public function dispose() : void
      {
         this.var_27 = null;
         this.var_630 = null;
         this.var_975 = null;
         this.var_369 = null;
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
         this.var_1164 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1164;
      }
      
      public function updateView() : void
      {
         var _loc1_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Boolean = true;
         if(this.var_630 && this.var_1470)
         {
            _loc5_ = this.var_27.manager.avatarRenderManager.createAvatarImage(this.figure,AvatarScaleType.const_111,this.var_975,this);
            if(_loc5_)
            {
               _loc5_.setDirection(AvatarSetType.const_42,parseInt(FigureData.const_978));
               _loc1_ = _loc5_.getCroppedImage(AvatarSetType.const_42);
               _loc5_.dispose();
            }
         }
         else
         {
            _loc6_ = this.var_27.manager.assets.getAssetByName("wardrobe_empty_slot") as BitmapDataAsset;
            if(_loc6_)
            {
               _loc1_ = _loc6_.content as BitmapData;
               _loc2_ = false;
            }
         }
         if(!_loc1_)
         {
            return;
         }
         if(this.var_369)
         {
            if(this.var_369.bitmap)
            {
               this.var_369.bitmap.dispose();
            }
            this.var_369.bitmap = new BitmapData(this.var_369.width,this.var_369.height,true,0);
            _loc7_ = (this.var_369.width - _loc1_.width) / 2;
            _loc8_ = (this.var_369.height - _loc1_.height) / 2;
            this.var_369.bitmap.draw(_loc1_,new Matrix(1,0,0,1,_loc7_,_loc8_));
         }
         if(_loc2_)
         {
            _loc1_.dispose();
         }
         var _loc3_:IContainerButtonWindow = this._view.findChildByName("set_button") as IContainerButtonWindow;
         if(_loc3_)
         {
            _loc3_.visible = this.var_1470;
         }
         var _loc4_:IContainerButtonWindow = this._view.findChildByName("get_button") as IContainerButtonWindow;
         if(_loc4_)
         {
            _loc4_.visible = this.var_1470 && this.var_630 != null;
         }
      }
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "set_button":
               this.var_630 = this.var_27.figureData.getFigureString();
               this.var_975 = this.var_27.gender;
               this.var_27.handler.saveWardrobeOutfit(this.var_1766,this);
               this.updateView();
               break;
            case "get_button":
               if(this.var_630)
               {
                  this.var_27.loadAvatarInEditor(this.var_630,this.var_975,this.var_27.clubMemberLevel);
               }
         }
      }
      
      public function get figure() : String
      {
         return this.var_630;
      }
      
      public function get gender() : String
      {
         return this.var_975;
      }
      
      public function get view() : IWindowContainer
      {
         return this._view;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.updateView();
      }
   }
}
