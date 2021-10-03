package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class PlaneMaterialCellColumn
   {
      
      public static const const_944:int = 0;
      
      public static const const_406:int = 1;
      
      public static const const_265:int = 2;
      
      public static const const_274:int = 3;
      
      public static const const_295:int = 4;
      
      public static const const_297:int = 5;
       
      
      private var var_36:Array;
      
      private var var_1965:int = 1;
      
      private var var_220:int = 1;
      
      private var var_32:BitmapData;
      
      private var _cachedBitmapNormal:Vector3d = null;
      
      private var var_1889:Boolean = false;
      
      private var var_2030:Boolean = true;
      
      public function PlaneMaterialCellColumn(param1:int, param2:Array, param3:int = 1)
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         this.var_36 = [];
         super();
         if(param1 < 1)
         {
            param1 = 1;
         }
         this.var_220 = param1;
         if(param2 != null)
         {
            _loc4_ = 0;
            while(_loc4_ < param2.length)
            {
               _loc5_ = param2[_loc4_] as PlaneMaterialCell;
               if(_loc5_ != null)
               {
                  this.var_36.push(_loc5_);
                  if(!_loc5_.isStatic)
                  {
                     this.var_2030 = false;
                  }
               }
               _loc4_++;
            }
         }
         this.var_1965 = param3;
      }
      
      public function get isStatic() : Boolean
      {
         return this.var_2030;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.var_36 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_36.length)
            {
               _loc2_ = this.var_36[_loc1_] as PlaneMaterialCell;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            this.var_36 = null;
         }
         if(this.var_32 != null)
         {
            this.var_32.dispose();
            this.var_32 = null;
         }
         if(this._cachedBitmapNormal != null)
         {
            this._cachedBitmapNormal = null;
         }
      }
      
      public function clearCache() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(!this.var_1889)
         {
            return;
         }
         if(this.var_32 != null)
         {
            this.var_32.dispose();
            this.var_32 = null;
         }
         if(this._cachedBitmapNormal != null)
         {
            this._cachedBitmapNormal.x = 0;
            this._cachedBitmapNormal.y = 0;
            this._cachedBitmapNormal.z = 0;
         }
         if(this.var_36 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_36.length)
            {
               _loc2_ = this.var_36[_loc1_] as PlaneMaterialCell;
               if(_loc2_ != null)
               {
                  _loc2_.clearCache();
               }
               _loc1_++;
            }
         }
         this.var_1889 = false;
      }
      
      public function render(param1:int, param2:IVector3d) : BitmapData
      {
         var _loc3_:int = 0;
         if(this.var_1965 == const_944)
         {
            _loc3_ = this.getCellsHeight(this.var_36,param2);
            param1 = _loc3_;
         }
         if(this._cachedBitmapNormal == null)
         {
            this._cachedBitmapNormal = new Vector3d();
         }
         if(this.isStatic)
         {
            if(this.var_32 != null)
            {
               if(this.var_32.height == param1 && Vector3d.isEqual(this._cachedBitmapNormal,param2))
               {
                  return this.var_32;
               }
               this.var_32.dispose();
               this.var_32 = null;
            }
         }
         else if(this.var_32 != null)
         {
            if(this.var_32.height == param1)
            {
               this.var_32.fillRect(this.var_32.rect,16777215);
            }
            else
            {
               this.var_32.dispose();
               this.var_32 = null;
            }
         }
         this.var_1889 = true;
         if(this.var_32 == null)
         {
            this.var_32 = new BitmapData(this.var_220,param1,true,16777215);
         }
         this._cachedBitmapNormal.assign(param2);
         if(this.var_36.length == 0)
         {
            return this.var_32;
         }
         switch(this.var_1965)
         {
            case const_944:
               this.renderRepeatNone(param2);
               break;
            case const_265:
               this.renderRepeatBorders(param2);
               break;
            case const_274:
               this.renderRepeatCenter(param2);
               break;
            case const_295:
               this.renderRepeatFirst(param2);
               break;
            case const_297:
               this.renderRepeatLast(param2);
               break;
            default:
               this.renderRepeatAll(param2);
         }
         return this.var_32;
      }
      
      private function getCellsHeight(param1:Array, param2:IVector3d) : int
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(param1 == null || param1.length == 0)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = param1[_loc4_] as PlaneMaterialCell;
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.getHeight(param2);
               _loc3_ += _loc6_;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function renderCells(param1:Array, param2:int, param3:Boolean, param4:IVector3d) : int
      {
         if(param1 == null || param1.length == 0 || this.var_32 == null)
         {
            return param2;
         }
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         while(_loc7_ < param1.length)
         {
            if(param3)
            {
               _loc5_ = param1[_loc7_] as PlaneMaterialCell;
            }
            else
            {
               _loc5_ = param1[param1.length - 1 - _loc7_] as PlaneMaterialCell;
            }
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.render(param4);
               if(_loc6_ != null)
               {
                  if(!param3)
                  {
                     param2 -= _loc6_.height;
                  }
                  this.var_32.copyPixels(_loc6_,_loc6_.rect,new Point(0,param2),_loc6_,null,true);
                  if(param3)
                  {
                     param2 += _loc6_.height;
                  }
                  if(param3 && param2 >= this.var_32.height || !param3 && param2 <= 0)
                  {
                     return param2;
                  }
               }
            }
            _loc7_++;
         }
         return param2;
      }
      
      private function renderRepeatNone(param1:IVector3d) : void
      {
         if(this.var_36.length == 0 || this.var_32 == null)
         {
            return;
         }
         this.renderCells(this.var_36,0,true,param1);
      }
      
      private function renderRepeatAll(param1:IVector3d) : void
      {
         if(this.var_36.length == 0 || this.var_32 == null)
         {
            return;
         }
         var _loc2_:int = this.getCellsHeight(this.var_36,param1);
         var _loc3_:int = 0;
         if(_loc2_ > this.var_32.height)
         {
         }
         while(_loc3_ < this.var_32.height)
         {
            _loc3_ = this.renderCells(this.var_36,_loc3_,true,param1);
            if(_loc3_ == 0)
            {
               return;
            }
         }
      }
      
      private function renderRepeatBorders(param1:IVector3d) : void
      {
         if(this.var_36.length == 0 || this.var_32 == null)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc4_:* = [];
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         _loc7_ = 1;
         while(_loc7_ < this.var_36.length - 1)
         {
            _loc2_ = this.var_36[_loc7_] as PlaneMaterialCell;
            if(_loc2_ != null)
            {
               _loc6_ = _loc2_.getHeight(param1);
               if(_loc6_ > 0)
               {
                  _loc5_ += _loc6_;
                  _loc4_.push(_loc2_);
               }
            }
            _loc7_++;
         }
         if(this.var_36.length == 1)
         {
            _loc2_ = this.var_36[0] as PlaneMaterialCell;
            if(_loc2_ != null)
            {
               _loc6_ = _loc2_.getHeight(param1);
               if(_loc6_ > 0)
               {
                  _loc5_ += _loc6_;
                  _loc4_.push(_loc2_);
               }
            }
         }
         var _loc8_:* = this.var_32.height - _loc5_ >> 1;
         var _loc9_:int = this.renderCells(_loc4_,_loc8_,true,param1);
         _loc2_ = this.var_36[0] as PlaneMaterialCell;
         if(_loc2_ != null)
         {
            _loc4_ = [_loc2_];
            while(_loc8_ >= 0)
            {
               _loc8_ = int(this.renderCells(_loc4_,_loc8_,false,param1));
            }
         }
         _loc2_ = this.var_36[this.var_36.length - 1] as PlaneMaterialCell;
         if(_loc2_ != null)
         {
            _loc4_ = [_loc2_];
            while(_loc9_ < this.var_32.height)
            {
               _loc9_ = this.renderCells(_loc4_,_loc9_,true,param1);
            }
         }
      }
      
      private function renderRepeatCenter(param1:IVector3d) : void
      {
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:* = null;
         if(this.var_36.length == 0 || this.var_32 == null)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc4_:* = [];
         var _loc5_:* = [];
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         _loc9_ = 0;
         while(_loc9_ < this.var_36.length >> 1)
         {
            _loc2_ = this.var_36[_loc9_] as PlaneMaterialCell;
            if(_loc2_ != null)
            {
               _loc8_ = _loc2_.getHeight(param1);
               if(_loc8_ > 0)
               {
                  _loc6_ += _loc8_;
                  _loc4_.push(_loc2_);
               }
            }
            _loc9_++;
         }
         _loc9_ = (this.var_36.length >> 1) + 1;
         while(_loc9_ < this.var_36.length)
         {
            _loc2_ = this.var_36[_loc9_] as PlaneMaterialCell;
            if(_loc2_ != null)
            {
               _loc8_ = _loc2_.getHeight(param1);
               if(_loc8_ > 0)
               {
                  _loc7_ += _loc8_;
                  _loc5_.push(_loc2_);
               }
            }
            _loc9_++;
         }
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = this.var_32.height;
         if(_loc6_ + _loc7_ > this.var_32.height)
         {
            _loc10_ = _loc6_ + _loc7_ - this.var_32.height;
            _loc11_ -= _loc10_ >> 1;
            _loc12_ += _loc10_ - (_loc10_ >> 1);
         }
         if(_loc10_ == 0)
         {
            _loc2_ = this.var_36[this.var_36.length >> 1] as PlaneMaterialCell;
            if(_loc2_ != null)
            {
               _loc8_ = _loc2_.getHeight(param1);
               if(_loc8_ > 0)
               {
                  _loc13_ = this.var_32.height - (_loc6_ + _loc7_);
                  _loc14_ = Math.ceil(_loc13_ / _loc8_) * _loc8_;
                  _loc11_ = _loc6_ - (_loc14_ - _loc13_ >> 1);
                  _loc15_ = _loc11_ + _loc14_;
                  _loc16_ = [_loc2_];
                  while(_loc11_ < _loc15_)
                  {
                     _loc11_ = this.renderCells(_loc16_,_loc11_,true,param1);
                  }
               }
            }
         }
         _loc11_ = 0;
         this.renderCells(_loc4_,_loc11_,true,param1);
         this.renderCells(_loc5_,_loc12_,false,param1);
      }
      
      private function renderRepeatFirst(param1:IVector3d) : void
      {
         var _loc4_:* = null;
         if(this.var_36.length == 0 || this.var_32 == null)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc3_:int = this.var_32.height;
         _loc3_ = this.renderCells(this.var_36,_loc3_,false,param1);
         _loc2_ = this.var_36[0] as PlaneMaterialCell;
         if(_loc2_ != null)
         {
            _loc4_ = [_loc2_];
            while(_loc3_ >= 0)
            {
               _loc3_ = this.renderCells(_loc4_,_loc3_,false,param1);
            }
         }
      }
      
      private function renderRepeatLast(param1:IVector3d) : void
      {
         var _loc4_:* = null;
         if(this.var_36.length == 0 || this.var_32 == null)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc3_:int = 0;
         _loc3_ = this.renderCells(this.var_36,_loc3_,true,param1);
         _loc2_ = this.var_36[this.var_36.length - 1] as PlaneMaterialCell;
         if(_loc2_ != null)
         {
            _loc4_ = [_loc2_];
            while(_loc3_ < this.var_32.height)
            {
               _loc3_ = this.renderCells(_loc4_,_loc3_,true,param1);
            }
         }
      }
   }
}
