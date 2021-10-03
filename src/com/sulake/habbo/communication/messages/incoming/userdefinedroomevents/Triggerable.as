package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class Triggerable
   {
       
      
      private var var_2721:Boolean;
      
      private var _furniLimit:int;
      
      private var var_2019:Array;
      
      private var _id:int;
      
      private var var_2719:String;
      
      private var var_1594:Array;
      
      private var var_2720:int;
      
      private var var_2020:int;
      
      public function Triggerable(param1:IMessageDataWrapper)
      {
         var _loc5_:int = 0;
         this.var_2019 = new Array();
         this.var_1594 = new Array();
         super();
         this.var_2721 = param1.readBoolean();
         this._furniLimit = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = param1.readInteger();
            this.var_2019.push(_loc5_);
            _loc3_++;
         }
         this.var_2720 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_2719 = param1.readString();
         var _loc4_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            this.var_1594.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2020 = param1.readInteger();
      }
      
      public function get stuffTypeSelectionEnabled() : Boolean
      {
         return this.var_2721;
      }
      
      public function get stuffTypeSelectionCode() : int
      {
         return this.var_2020;
      }
      
      public function set stuffTypeSelectionCode(param1:int) : void
      {
         this.var_2020 = param1;
      }
      
      public function get furniLimit() : int
      {
         return this._furniLimit;
      }
      
      public function get stuffIds() : Array
      {
         return this.var_2019;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get stringParam() : String
      {
         return this.var_2719;
      }
      
      public function get intParams() : Array
      {
         return this.var_1594;
      }
      
      public function get code() : int
      {
         return 0;
      }
      
      public function get stuffTypeId() : int
      {
         return this.var_2720;
      }
      
      public function getBoolean(param1:int) : Boolean
      {
         return this.var_1594[param1] == 1;
      }
   }
}
