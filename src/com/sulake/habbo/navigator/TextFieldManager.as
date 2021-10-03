package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_70:ITextFieldWindow;
      
      private var var_721:Boolean;
      
      private var var_1511:String = "";
      
      private var var_2130:int;
      
      private var var_2131:Function;
      
      private var var_2878:String = "";
      
      private var var_117:IWindowContainer;
      
      private var _orgTextBackground:Boolean;
      
      private var var_2877:uint;
      
      private var _orgTextColor:uint;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         this._navigator = param1;
         this.var_70 = param2;
         this.var_2130 = param3;
         this.var_2131 = param4;
         if(param5 != null)
         {
            this.var_721 = true;
            this.var_1511 = param5;
            this.var_70.text = param5;
         }
         Util.setProcDirectly(this.var_70,this.onInputClick);
         this.var_70.addEventListener(WindowKeyboardEvent.const_182,this.checkEnterPress);
         this.var_70.addEventListener(WindowEvent.const_119,this.checkMaxLen);
         this._orgTextBackground = this.var_70.textBackground;
         this.var_2877 = this.var_70.textBackgroundColor;
         this._orgTextColor = this.var_70.textColor;
      }
      
      public function dispose() : void
      {
         if(this.var_70)
         {
            this.var_70.dispose();
            this.var_70 = null;
         }
         if(this.var_117)
         {
            this.var_117.dispose();
            this.var_117 = null;
         }
         this._navigator = null;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!this.isInputValid())
         {
            this.displayError(param1);
            return false;
         }
         this.restoreBackground();
         return true;
      }
      
      public function restoreBackground() : void
      {
         this.var_70.textBackground = this._orgTextBackground;
         this.var_70.textBackgroundColor = this.var_2877;
         this.var_70.textColor = this._orgTextColor;
      }
      
      public function displayError(param1:String) : void
      {
         this.var_70.textBackground = true;
         this.var_70.textBackgroundColor = 4294021019;
         this.var_70.textColor = 4278190080;
         if(this.var_117 == null)
         {
            this.var_117 = IWindowContainer(this._navigator.getXmlWindow("nav_error_popup"));
            this._navigator.refreshButton(this.var_117,"popup_arrow_down",true,null,0);
            IWindowContainer(this.var_70.parent).addChild(this.var_117);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_117.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         this.var_117.findChildByName("border").width = _loc2_.width + 15;
         this.var_117.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         this.var_70.getLocalPosition(_loc3_);
         this.var_117.x = _loc3_.x;
         this.var_117.y = _loc3_.y - this.var_117.height + 3;
         var _loc4_:IWindow = this.var_117.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_117.width / 2 - _loc4_.width / 2;
         this.var_117.x += (this.var_70.width - this.var_117.width) / 2;
         this.var_117.visible = true;
      }
      
      public function goBackToInitialState() : void
      {
         this.clearErrors();
         if(this.var_1511 != null)
         {
            this.var_70.text = this.var_1511;
            this.var_721 = true;
         }
         else
         {
            this.var_70.text = "";
            this.var_721 = false;
         }
      }
      
      public function getText() : String
      {
         if(this.var_721)
         {
            return this.var_2878;
         }
         return this.var_70.text;
      }
      
      public function setText(param1:String) : void
      {
         this.var_721 = false;
         this.var_70.text = param1;
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_117 != null)
         {
            this.var_117.visible = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return this.var_70;
      }
      
      private function isInputValid() : Boolean
      {
         return !this.var_721 && Util.trim(this.getText()).length > 2;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_360)
         {
            return;
         }
         if(!this.var_721)
         {
            return;
         }
         this.var_70.text = this.var_2878;
         this.var_721 = false;
         this.restoreBackground();
      }
      
      private function checkEnterPress(param1:WindowKeyboardEvent) : void
      {
         if(param1.charCode == Keyboard.ENTER)
         {
            if(this.var_2131 != null)
            {
               this.var_2131();
            }
         }
      }
      
      private function checkMaxLen(param1:WindowEvent) : void
      {
         var _loc2_:String = this.var_70.text;
         if(_loc2_.length > this.var_2130)
         {
            this.var_70.text = _loc2_.substring(0,this.var_2130);
         }
      }
   }
}
