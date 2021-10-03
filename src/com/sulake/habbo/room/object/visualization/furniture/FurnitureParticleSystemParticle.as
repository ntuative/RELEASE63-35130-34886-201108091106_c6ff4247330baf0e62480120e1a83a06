package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import flash.geom.Vector3D;
   
   public class FurnitureParticleSystemParticle
   {
       
      
      private var _x:Number;
      
      private var var_179:Number;
      
      private var var_178:Number;
      
      private var var_2156:Number;
      
      private var var_2155:Number;
      
      private var var_2157:Number;
      
      private var var_1374:Boolean = false;
      
      private var _direction:Vector3D;
      
      private var var_599:int = 0;
      
      private var var_1123:int;
      
      private var var_2929:Boolean = false;
      
      private var var_2158:Boolean = false;
      
      private var var_1733:Number;
      
      private var _alphaMultiplier:Number = 1.0;
      
      private var _frames:Array;
      
      public function FurnitureParticleSystemParticle()
      {
         super();
      }
      
      public function get fade() : Boolean
      {
         return this.var_2158;
      }
      
      public function get alphaMultiplier() : Number
      {
         return this._alphaMultiplier;
      }
      
      public function get direction() : Vector3D
      {
         return this._direction;
      }
      
      public function get age() : int
      {
         return this.var_599;
      }
      
      public function init(param1:Number, param2:Number, param3:Number, param4:Vector3D, param5:Number, param6:Number, param7:int, param8:Boolean = false, param9:Array = null, param10:Boolean = false) : void
      {
         this._x = param1;
         this.var_179 = param2;
         this.var_178 = param3;
         this._direction = new Vector3D(param4.x,param4.y,param4.z);
         this._direction.scaleBy(param5);
         this.var_2156 = this._x - this._direction.x * param6;
         this.var_2155 = this.var_179 - this._direction.y * param6;
         this.var_2157 = this.var_178 - this._direction.z * param6;
         this.var_599 = 0;
         this.var_1374 = false;
         this.var_1123 = param7;
         this.var_2929 = param8;
         this._frames = param9;
         this.var_2158 = param10;
         this._alphaMultiplier = 1;
         this.var_1733 = 0.5 + Math.random() * 0.5;
      }
      
      public function update() : void
      {
         ++this.var_599;
         if(this.var_599 == this.var_1123)
         {
            this.ignite();
         }
         if(this.var_2158)
         {
            if(this.var_599 / this.var_1123 > this.var_1733)
            {
               this._alphaMultiplier = (this.var_1123 - this.var_599) / (this.var_1123 * (1 - this.var_1733));
            }
         }
      }
      
      public function getAsset() : IGraphicAsset
      {
         if(this._frames && this._frames.length > 0)
         {
            return this._frames[this.var_599 % this._frames.length];
         }
         return null;
      }
      
      protected function ignite() : void
      {
      }
      
      public function get isEmitter() : Boolean
      {
         return this.var_2929;
      }
      
      public function get isAlive() : Boolean
      {
         return this.var_599 <= this.var_1123;
      }
      
      public function dispose() : void
      {
         this._direction = null;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_179;
      }
      
      public function get z() : Number
      {
         return this.var_178;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
      }
      
      public function set y(param1:Number) : void
      {
         this.var_179 = param1;
      }
      
      public function set z(param1:Number) : void
      {
         this.var_178 = param1;
      }
      
      public function get lastX() : Number
      {
         return this.var_2156;
      }
      
      public function set lastX(param1:Number) : void
      {
         this.var_1374 = true;
         this.var_2156 = param1;
      }
      
      public function get lastY() : Number
      {
         return this.var_2155;
      }
      
      public function set lastY(param1:Number) : void
      {
         this.var_1374 = true;
         this.var_2155 = param1;
      }
      
      public function get lastZ() : Number
      {
         return this.var_2157;
      }
      
      public function set lastZ(param1:Number) : void
      {
         this.var_1374 = true;
         this.var_2157 = param1;
      }
      
      public function get hasMoved() : Boolean
      {
         return this.var_1374;
      }
      
      public function toString() : String
      {
         return [this._x,this.var_179,this.var_178].toString();
      }
   }
}
