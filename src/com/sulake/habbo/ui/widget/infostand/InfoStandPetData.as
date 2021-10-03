package com.sulake.habbo.ui.widget.infostand
{
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1195:int;
      
      private var var_2399:int;
      
      private var var_2401:int;
      
      private var var_2400:int;
      
      private var _energy:int;
      
      private var var_2404:int;
      
      private var _nutrition:int;
      
      private var var_2403:int;
      
      private var _petRespect:int;
      
      private var _name:String = "";
      
      private var var_1951:int = -1;
      
      private var _type:int;
      
      private var var_2405:int;
      
      private var var_48:BitmapData;
      
      private var var_2402:Boolean;
      
      private var var_2340:int;
      
      private var _ownerName:String;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var var_2406:int;
      
      private var var_599:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get id() : int
      {
         return this.var_1951;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get race() : int
      {
         return this.var_2405;
      }
      
      public function get image() : BitmapData
      {
         return this.var_48;
      }
      
      public function get isOwnPet() : Boolean
      {
         return this.var_2402;
      }
      
      public function get ownerId() : int
      {
         return this.var_2340;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return this._canOwnerBeKicked;
      }
      
      public function get age() : int
      {
         return this.var_599;
      }
      
      public function get level() : int
      {
         return this.var_1195;
      }
      
      public function get levelMax() : int
      {
         return this.var_2399;
      }
      
      public function get experience() : int
      {
         return this.var_2401;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2400;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2404;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2403;
      }
      
      public function get petRespect() : int
      {
         return this._petRespect;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2406;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this._name = param1.name;
         this.var_1951 = param1.id;
         this._type = param1.petType;
         this.var_2405 = param1.petRace;
         this.var_48 = param1.image;
         this.var_2402 = param1.isOwnPet;
         this.var_2340 = param1.ownerId;
         this._ownerName = param1.ownerName;
         this._canOwnerBeKicked = param1.canOwnerBeKicked;
         this.var_1195 = param1.level;
         this.var_2399 = param1.levelMax;
         this.var_2401 = param1.experience;
         this.var_2400 = param1.experienceMax;
         this._energy = param1.energy;
         this.var_2404 = param1.energyMax;
         this._nutrition = param1.nutrition;
         this.var_2403 = param1.nutritionMax;
         this._petRespect = param1.petRespect;
         this.var_2406 = param1.roomIndex;
         this.var_599 = param1.age;
      }
   }
}
