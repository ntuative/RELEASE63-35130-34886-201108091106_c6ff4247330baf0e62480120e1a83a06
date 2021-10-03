package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1951:int;
      
      private var _name:String;
      
      private var var_1195:int;
      
      private var var_2650:int;
      
      private var var_2401:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_630:String;
      
      private var var_2651:int;
      
      private var var_2652:int;
      
      private var var_2653:int;
      
      private var var_2587:int;
      
      private var var_2340:int;
      
      private var _ownerName:String;
      
      private var var_599:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1951;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1195;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2650;
      }
      
      public function get experience() : int
      {
         return this.var_2401;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_630;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2651;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2652;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2653;
      }
      
      public function get respect() : int
      {
         return this.var_2587;
      }
      
      public function get ownerId() : int
      {
         return this.var_2340;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_599;
      }
      
      public function flush() : Boolean
      {
         this.var_1951 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1951 = param1.readInteger();
         this._name = param1.readString();
         this.var_1195 = param1.readInteger();
         this.var_2650 = param1.readInteger();
         this.var_2401 = param1.readInteger();
         this.var_2651 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2652 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2653 = param1.readInteger();
         this.var_630 = param1.readString();
         this.var_2587 = param1.readInteger();
         this.var_2340 = param1.readInteger();
         this.var_599 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
