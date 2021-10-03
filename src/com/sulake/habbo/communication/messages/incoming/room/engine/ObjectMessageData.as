package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_179:Number = 0;
      
      private var var_178:Number = 0;
      
      private var var_455:int = 0;
      
      private var var_604:int = 0;
      
      private var var_743:int = 0;
      
      private var _type:int = 0;
      
      private var var_3151:String = "";
      
      private var var_2132:int = -1;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_2440:int = 0;
      
      private var var_2441:Boolean;
      
      private var var_2745:String = null;
      
      private var var_201:Boolean = false;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_201 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_201)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_179;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_201)
         {
            this.var_179 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_178;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_201)
         {
            this.var_178 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_455;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_201)
         {
            this.var_455 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return this.var_604;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_201)
         {
            this.var_604 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return this.var_743;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_201)
         {
            this.var_743 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_201)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_201)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_201)
         {
            this._data = param1;
         }
      }
      
      public function get staticClass() : String
      {
         return this.var_2745;
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!this.var_201)
         {
            this.var_2745 = param1;
         }
      }
      
      public function get extra() : int
      {
         return this.var_2132;
      }
      
      public function set extra(param1:int) : void
      {
         if(!this.var_201)
         {
            this.var_2132 = param1;
         }
      }
      
      public function get expiryTime() : int
      {
         return this.var_2440;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!this.var_201)
         {
            this.var_2440 = param1;
         }
      }
      
      public function get knownAsUsable() : Boolean
      {
         return this.var_2441;
      }
      
      public function set knownAsUsable(param1:Boolean) : void
      {
         this.var_2441 = param1;
      }
   }
}
