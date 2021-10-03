package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_355:int = -2.147483648E9;
      
      private var var_353:int = 2.147483647E9;
      
      private var var_354:int = -2.147483648E9;
      
      private var var_352:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         this._target = param1;
      }
      
      public function get minWidth() : int
      {
         return this.var_355;
      }
      
      public function get maxWidth() : int
      {
         return this.var_353;
      }
      
      public function get minHeight() : int
      {
         return this.var_354;
      }
      
      public function get maxHeight() : int
      {
         return this.var_352;
      }
      
      public function set minWidth(param1:int) : void
      {
         this.var_355 = param1;
         if(this.var_355 > int.MIN_VALUE && !this._target.disposed && this._target.width < this.var_355)
         {
            this._target.width = this.var_355;
         }
      }
      
      public function set maxWidth(param1:int) : void
      {
         this.var_353 = param1;
         if(this.var_353 < int.MAX_VALUE && !this._target.disposed && this._target.width > this.var_353)
         {
            this._target.width = this.var_353;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         this.var_354 = param1;
         if(this.var_354 > int.MIN_VALUE && !this._target.disposed && this._target.height < this.var_354)
         {
            this._target.height = this.var_354;
         }
      }
      
      public function set maxHeight(param1:int) : void
      {
         this.var_352 = param1;
         if(this.var_352 < int.MAX_VALUE && !this._target.disposed && this._target.height > this.var_352)
         {
            this._target.height = this.var_352;
         }
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_355 == int.MIN_VALUE && this.var_353 == int.MAX_VALUE && this.var_354 == int.MIN_VALUE && this.var_352 == int.MAX_VALUE;
      }
      
      public function setEmpty() : void
      {
         this.var_355 = int.MIN_VALUE;
         this.var_353 = int.MAX_VALUE;
         this.var_354 = int.MIN_VALUE;
         this.var_352 = int.MAX_VALUE;
      }
      
      public function limit() : void
      {
         if(!this.isEmpty && this._target)
         {
            if(this._target.width < this.var_355)
            {
               this._target.width = this.var_355;
            }
            else if(this._target.width > this.var_353)
            {
               this._target.width = this.var_353;
            }
            if(this._target.height < this.var_354)
            {
               this._target.height = this.var_354;
            }
            else if(this._target.height > this.var_352)
            {
               this._target.height = this.var_352;
            }
         }
      }
      
      public function assign(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.var_355 = param1;
         this.var_353 = param2;
         this.var_354 = param3;
         this.var_352 = param4;
         this.limit();
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_355 = this.var_355;
         _loc2_.var_353 = this.var_353;
         _loc2_.var_354 = this.var_354;
         _loc2_.var_352 = this.var_352;
         return _loc2_;
      }
   }
}
