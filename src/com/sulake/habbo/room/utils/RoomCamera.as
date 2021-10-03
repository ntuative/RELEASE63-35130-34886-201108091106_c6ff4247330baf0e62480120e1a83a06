package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_1632:Number = 12;
       
      
      private var var_2767:int = -1;
      
      private var var_2763:int = -2;
      
      private var var_222:Vector3d = null;
      
      private var var_1312:Number = 0;
      
      private var var_1617:Number = 0;
      
      private var var_2050:Boolean = false;
      
      private var var_203:Vector3d = null;
      
      private var var_2048:Vector3d;
      
      private var var_2769:Boolean = false;
      
      private var var_2764:Boolean = false;
      
      private var var_2762:Boolean = false;
      
      private var var_2766:Boolean = false;
      
      private var var_2768:int = 0;
      
      private var var_2771:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2770:int = 0;
      
      private var var_2765:int = 0;
      
      private var var_1832:int = -1;
      
      private var var_2049:int = 0;
      
      private var var_2051:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_2048 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_203;
      }
      
      public function get targetId() : int
      {
         return this.var_2767;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2763;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_2048;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2769;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2764;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2762;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2766;
      }
      
      public function get screenWd() : int
      {
         return this.var_2768;
      }
      
      public function get screenHt() : int
      {
         return this.var_2771;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2770;
      }
      
      public function get roomHt() : int
      {
         return this.var_2765;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1832;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_222 != null && this.var_203 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2767 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_2048.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2763 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2769 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2764 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2762 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2766 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2768 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2771 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_2051 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2770 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2765 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1832 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         var _loc2_:* = null;
         if(this.var_222 == null)
         {
            this.var_222 = new Vector3d();
         }
         if(this.var_222.x != param1.x || this.var_222.y != param1.y || this.var_222.z != param1.z)
         {
            this.var_222.assign(param1);
            this.var_2049 = 0;
            _loc2_ = Vector3d.dif(this.var_222,this.var_203);
            this.var_1312 = _loc2_.length;
            this.var_2050 = true;
         }
      }
      
      public function dispose() : void
      {
         this.var_222 = null;
         this.var_203 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_203 != null)
         {
            return;
         }
         this.var_203 = new Vector3d();
         this.var_203.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_203 == null)
         {
            this.var_203 = new Vector3d();
         }
         this.var_203.assign(param1);
      }
      
      public function update(param1:uint, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.var_222 != null && this.var_203 != null)
         {
            ++this.var_2049;
            if(this.var_2051)
            {
               this.var_2051 = false;
               this.var_203 = this.var_222;
               this.var_222 = null;
               return;
            }
            _loc3_ = Vector3d.dif(this.var_222,this.var_203);
            if(_loc3_.length > this.var_1312)
            {
               this.var_1312 = _loc3_.length;
            }
            if(_loc3_.length <= param2)
            {
               this.var_203 = this.var_222;
               this.var_222 = null;
               this.var_1617 = 0;
            }
            else
            {
               _loc4_ = Math.sin(0 * _loc3_.length / this.var_1312);
               _loc5_ = param2 * 0.5;
               _loc6_ = this.var_1312 / const_1632;
               _loc7_ = _loc5_ + (_loc6_ - _loc5_) * _loc4_;
               if(this.var_2050)
               {
                  if(_loc7_ < this.var_1617)
                  {
                     _loc7_ = this.var_1617;
                     if(_loc7_ > _loc3_.length)
                     {
                        _loc7_ = _loc3_.length;
                     }
                  }
                  else
                  {
                     this.var_2050 = false;
                  }
               }
               this.var_1617 = _loc7_;
               _loc3_.div(_loc3_.length);
               _loc3_.mul(_loc7_);
               this.var_203 = Vector3d.sum(this.var_203,_loc3_);
            }
         }
      }
      
      public function reset() : void
      {
         this.var_1832 = -1;
      }
   }
}
