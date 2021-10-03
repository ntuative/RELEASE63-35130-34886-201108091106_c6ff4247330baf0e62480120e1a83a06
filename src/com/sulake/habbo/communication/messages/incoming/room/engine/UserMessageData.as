package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1229:String = "M";
      
      public static const const_1882:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_179:Number = 0;
      
      private var var_178:Number = 0;
      
      private var var_455:int = 0;
      
      private var _name:String = "";
      
      private var var_1735:int = 0;
      
      private var var_1112:String = "";
      
      private var var_630:String = "";
      
      private var var_2362:String = "";
      
      private var var_2364:int;
      
      private var var_2365:int = 0;
      
      private var var_2361:String = "";
      
      private var var_2363:int = 0;
      
      private var var_2366:int = 0;
      
      private var var_2736:String = "";
      
      private var var_201:Boolean = false;
      
      public function UserMessageData(param1:int)
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
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_201)
         {
            this._name = param1;
         }
      }
      
      public function get method_1() : int
      {
         return this.var_1735;
      }
      
      public function set method_1(param1:int) : void
      {
         if(!this.var_201)
         {
            this.var_1735 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_1112;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_201)
         {
            this.var_1112 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_630;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_201)
         {
            this.var_630 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2362;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_201)
         {
            this.var_2362 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2364;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_201)
         {
            this.var_2364 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2365;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_201)
         {
            this.var_2365 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2361;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_201)
         {
            this.var_2361 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2363;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_201)
         {
            this.var_2363 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2366;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_201)
         {
            this.var_2366 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2736;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_201)
         {
            this.var_2736 = param1;
         }
      }
   }
}
