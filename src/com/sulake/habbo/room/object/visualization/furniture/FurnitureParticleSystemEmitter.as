package com.sulake.habbo.room.object.visualization.furniture
{
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   
   public class FurnitureParticleSystemEmitter extends FurnitureParticleSystemParticle
   {
      
      public static const const_2056:String = "cone";
      
      public static const const_1850:String = "plane";
      
      public static const const_2067:String = "sphere";
       
      
      private var _name:String;
      
      private var var_2518:int = -1;
      
      private var var_2516:Number;
      
      private var _direction:Vector3D;
      
      private var var_1012:Number = 0.1;
      
      private var var_1864:Number;
      
      private var var_278:Number;
      
      private var var_2517:String;
      
      private var var_1237:Array;
      
      private var var_376:Array;
      
      private var var_1521:int;
      
      private var var_2520:int;
      
      private var var_1013:int;
      
      private var var_2521:int = 10;
      
      private var _energy:Number = 1;
      
      private var var_1140:Boolean = false;
      
      private var var_2519:int = 1;
      
      public function FurnitureParticleSystemEmitter(param1:String = "", param2:int = -1)
      {
         this.var_376 = [];
         super();
         this._name = param1;
         this.var_2518 = param2;
         this.var_1237 = [];
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_376)
         {
            _loc1_.dispose();
         }
         this.var_376 = null;
         this._direction = null;
         this.var_1237 = null;
         super.dispose();
      }
      
      public function setup(param1:int, param2:int, param3:Number, param4:Vector3D, param5:Number, param6:Number, param7:String, param8:Number, param9:int, param10:int) : void
      {
         this.var_1521 = param1;
         this.var_2520 = param2;
         this.var_2516 = param3;
         this._direction = param4;
         this._direction.normalize();
         this.var_1864 = param5;
         this.var_278 = param6;
         this.var_2517 = param7;
         this.var_2521 = param9;
         this._energy = param8;
         this.var_2519 = param10;
         this.reset();
      }
      
      public function reset() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_376)
         {
            _loc1_.dispose();
         }
         this.var_376 = [];
         this.var_1013 = 0;
         this.var_1140 = false;
         this.init(0,0,0,this._direction,this.var_2516,this.var_1012,this.var_2521,true);
      }
      
      public function configureParticle(param1:int, param2:Boolean, param3:Array, param4:Boolean) : void
      {
         var _loc5_:Dictionary = new Dictionary();
         _loc5_["lifeTime"] = param1;
         _loc5_["isEmitter"] = param2;
         _loc5_["frames"] = param3;
         _loc5_["fade"] = param4;
         this.var_1237.push(_loc5_);
      }
      
      override protected function ignite() : void
      {
         this.var_1140 = true;
         if(this.var_1013 < this.var_1521)
         {
            if(this.age > 1)
            {
               this.releaseParticles(this,this.direction);
            }
         }
      }
      
      private function releaseParticles(param1:FurnitureParticleSystemParticle, param2:Vector3D = null) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc9_:* = null;
         if(!param2)
         {
            param2 = new Vector3D();
         }
         var _loc3_:Vector3D = new Vector3D();
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         _loc5_ = this.getRandomParticleConfiguration();
         var _loc10_:int = 0;
         while(_loc10_ < this.var_2520)
         {
            switch(this.var_2517)
            {
               case const_2056:
                  _loc3_.x = !!this.randomBoolean(0.5) ? Number(Math.random()) : Number(-Math.random());
                  _loc3_.y = -(Math.random() + 1);
                  _loc3_.z = !!this.randomBoolean(0.5) ? Number(Math.random()) : Number(-Math.random());
                  break;
               case const_1850:
                  _loc3_.x = !!this.randomBoolean(0.5) ? Number(Math.random()) : Number(-Math.random());
                  _loc3_.y = 0;
                  _loc3_.z = !!this.randomBoolean(0.5) ? Number(Math.random()) : Number(-Math.random());
                  break;
               case const_2067:
                  _loc3_.x = !!this.randomBoolean(0.5) ? Number(Math.random()) : Number(-Math.random());
                  _loc3_.y = !!this.randomBoolean(0.5) ? Number(Math.random()) : Number(-Math.random());
                  _loc3_.z = !!this.randomBoolean(0.5) ? Number(Math.random()) : Number(-Math.random());
                  break;
            }
            _loc3_.normalize();
            _loc4_ = new FurnitureParticleSystemParticle();
            if(_loc5_)
            {
               _loc6_ = Math.floor(Math.random() * _loc5_["lifeTime"] + 10);
               _loc7_ = _loc5_["isEmitter"];
               _loc9_ = _loc5_["frames"];
               _loc8_ = _loc5_["fade"];
            }
            else
            {
               _loc6_ = Math.floor(Math.random() * 20 + 10);
               _loc7_ = false;
               _loc9_ = [];
            }
            _loc4_.init(param1.x,param1.y,param1.z,_loc3_,this._energy,this.var_1012,_loc6_,_loc7_,_loc9_,_loc8_);
            this.var_376.push(_loc4_);
            ++this.var_1013;
            _loc10_++;
         }
      }
      
      private function getRandomParticleConfiguration() : Dictionary
      {
         var _loc1_:int = Math.floor(Math.random() * this.var_1237.length);
         return this.var_1237[_loc1_];
      }
      
      override public function update() : void
      {
         super.update();
         this.accumulateForces();
         this.verlet();
         this.satisfyConstraints();
         if(!isAlive && this.var_1013 < this.var_1521)
         {
            if(this.age % this.var_2519 == 0)
            {
               this.releaseParticles(this,this.direction);
            }
         }
      }
      
      public function verlet() : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(isAlive || this.var_1013 < this.var_1521)
         {
            _loc3_ = this.x;
            _loc4_ = this.y;
            _loc5_ = this.z;
            this.x = (2 - this.var_278) * this.x - (1 - this.var_278) * this.lastX;
            this.y = (2 - this.var_278) * this.y - (1 - this.var_278) * this.lastY + this.var_1864 * this.var_1012 * this.var_1012;
            this.z = (2 - this.var_278) * this.z - (1 - this.var_278) * this.lastZ;
            this.lastX = _loc3_;
            this.lastY = _loc4_;
            this.lastZ = _loc5_;
         }
         var _loc1_:* = [];
         for each(_loc2_ in this.var_376)
         {
            _loc2_.update();
            _loc3_ = _loc2_.x;
            _loc4_ = _loc2_.y;
            _loc5_ = _loc2_.z;
            _loc2_.x = (2 - this.var_278) * _loc2_.x - (1 - this.var_278) * _loc2_.lastX;
            _loc2_.y = (2 - this.var_278) * _loc2_.y - (1 - this.var_278) * _loc2_.lastY + this.var_1864 * this.var_1012 * this.var_1012;
            _loc2_.z = (2 - this.var_278) * _loc2_.z - (1 - this.var_278) * _loc2_.lastZ;
            _loc2_.lastX = _loc3_;
            _loc2_.lastY = _loc4_;
            _loc2_.lastZ = _loc5_;
            if(_loc2_.y > 10 || !_loc2_.isAlive)
            {
               _loc1_.push(_loc2_);
            }
         }
         for each(_loc2_ in _loc1_)
         {
            if(!_loc2_.isEmitter)
            {
            }
            this.var_376.splice(this.var_376.indexOf(_loc2_),1);
            _loc2_.dispose();
         }
      }
      
      private function satisfyConstraints() : void
      {
      }
      
      private function accumulateForces() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_376)
         {
         }
      }
      
      public function get particles() : Array
      {
         return this.var_376;
      }
      
      public function get hasIgnited() : Boolean
      {
         return this.var_1140;
      }
      
      private function randomBoolean(param1:Number) : Boolean
      {
         return Math.random() < param1;
      }
      
      public function get roomObjectSpriteId() : int
      {
         return this.var_2518;
      }
   }
}
