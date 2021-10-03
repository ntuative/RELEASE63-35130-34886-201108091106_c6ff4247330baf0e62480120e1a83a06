package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   
   public class ProgressBar implements IDisposable
   {
      
      private static const const_1565:int = 3;
      
      private static const const_1566:int = 10;
       
      
      private var var_50:HabboQuestEngine;
      
      private var _window:IWindowContainer;
      
      private var var_814:int;
      
      private var var_1257:String;
      
      private var var_2589:Boolean;
      
      private var var_1256:int;
      
      private var var_1255:int;
      
      private var var_2588:int;
      
      private var var_1917:int;
      
      private var var_283:int;
      
      private var var_1546:Boolean;
      
      private var var_815:BitmapData;
      
      private var var_656:Array;
      
      private var var_1918:ColorMatrixFilter;
      
      public function ProgressBar(param1:HabboQuestEngine, param2:IWindowContainer, param3:int, param4:String, param5:Boolean, param6:Point)
      {
         this.var_656 = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
         this.var_1918 = new ColorMatrixFilter(this.var_656);
         super();
         this.var_50 = param1;
         this._window = param2;
         this.var_814 = param3;
         this.var_1257 = param4;
         this.var_2589 = param5;
         var _loc7_:IWindowContainer = IWindowContainer(this._window.findChildByName("progress_bar_cont"));
         if(_loc7_ == null)
         {
            _loc7_ = IWindowContainer(this.var_50.getXmlWindow("ProgressBar"));
            this._window.addChild(_loc7_);
            _loc7_.x = param6.x;
            _loc7_.y = param6.y;
            _loc7_.width = this.var_814 + const_1566;
         }
         if(param5)
         {
            new PendingImage(this.var_50,this._window.findChildByName("bar_l"),"ach_progressbar1");
            new PendingImage(this.var_50,this._window.findChildByName("bar_c"),"ach_progressbar2");
            new PendingImage(this.var_50,this._window.findChildByName("bar_r"),"ach_progressbar3");
         }
         new PendingImage(this.var_50,this._window.findChildByName("bar_a_c"),"ach_progressbar4");
         new PendingImage(this.var_50,this._window.findChildByName("bar_a_r"),"ach_progressbar5");
      }
      
      public function refresh(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Boolean = param3 != this.var_2588 || param2 != this.var_1255;
         this.var_1255 = param2;
         this.var_1256 = param1;
         this.var_1917 = this.var_283;
         this.var_2588 = param3;
         if(_loc4_)
         {
            this.var_283 = this.getProgressWidth(this.var_1256);
         }
         this.var_1546 = true;
         this.updateView();
      }
      
      public function set visible(param1:Boolean) : void
      {
         var _loc2_:IWindowContainer = IWindowContainer(this._window.findChildByName("progress_bar_cont"));
         if(_loc2_ != null)
         {
            _loc2_.visible = param1;
         }
      }
      
      public function updateView() : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         if(!this.var_1546)
         {
            return;
         }
         var _loc1_:IBitmapWrapperWindow = IBitmapWrapperWindow(this._window.findChildByName("bar_a_c"));
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(this._window.findChildByName("bar_a_r"));
         if(_loc1_.bitmap == null || _loc2_.bitmap == null)
         {
            return;
         }
         if(this.var_2589)
         {
            _loc7_ = IBitmapWrapperWindow(this._window.findChildByName("bar_c"));
            _loc8_ = IBitmapWrapperWindow(this._window.findChildByName("bar_r"));
            if(_loc7_.bitmap == null || _loc8_.bitmap == null)
            {
               return;
            }
            _loc7_.width = this.var_814;
            _loc8_.x = this.var_814 + _loc1_.x;
         }
         if(this.var_815 == null)
         {
            this.var_815 = _loc1_.bitmap.clone();
         }
         var _loc3_:int = this.getProgressWidth(this.var_1256);
         if(this.var_283 < _loc3_)
         {
            _loc9_ = Math.min(Math.abs(this.var_283 - _loc3_),Math.abs(this.var_1917 - _loc3_));
            this.var_283 = Math.min(_loc3_,this.var_283 + Math.max(1,Math.round(Math.sqrt(_loc9_))));
         }
         var _loc4_:* = this.var_283 > 0;
         _loc1_.visible = _loc4_;
         _loc2_.visible = _loc4_;
         if(_loc4_)
         {
            _loc1_.width = this.var_815.width;
            if(this.var_283 < _loc3_)
            {
               this.changeProgressColorFilter();
               _loc1_.bitmap.applyFilter(this.var_815,this.var_815.rect,new Point(0,0),this.var_1918);
            }
            else
            {
               _loc1_.bitmap.copyPixels(this.var_815,this.var_815.rect,new Point(0,0),null,null,true);
            }
            _loc1_.width = this.var_283;
            _loc2_.x = this.var_283 + _loc1_.x;
         }
         this.var_1546 = this.var_283 < _loc3_;
         var _loc5_:ITextWindow = ITextWindow(this._window.findChildByName("progress_txt"));
         var _loc6_:int = !!this.var_1546 ? int(Math.round(this.var_283 / this.var_814 * this.var_1255)) : int(this.var_1256);
         this.var_50.localization.registerParameter(this.var_1257,"progress","" + _loc6_);
         this.var_50.localization.registerParameter(this.var_1257,"limit","" + this.var_1255);
         _loc5_.caption = this.var_50.localization.getKey(this.var_1257,this.var_1257);
         _loc5_.x = const_1565 + _loc1_.x + (this.var_814 - _loc5_.width) / 2;
      }
      
      public function dispose() : void
      {
         this.var_50 = null;
         this._window = null;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_50 == null;
      }
      
      private function getProgressWidth(param1:int) : int
      {
         return Math.max(0,Math.round(this.var_814 * param1 / this.var_1255));
      }
      
      private function changeProgressColorFilter() : void
      {
         var _loc1_:int = this.getProgressWidth(this.var_1256);
         var _loc2_:int = _loc1_ - this.var_1917;
         if(_loc2_ == 0)
         {
            return;
         }
         var _loc3_:Number = (_loc1_ - this.var_283) / _loc2_;
         this.var_656[3] = _loc3_;
         this.var_656[8] = _loc3_;
         this.var_656[0] = 1 - _loc3_;
         this.var_656[6] = 1 - _loc3_;
         this.var_656[12] = 1 - _loc3_;
         this.var_1918.matrix = this.var_656;
      }
   }
}
