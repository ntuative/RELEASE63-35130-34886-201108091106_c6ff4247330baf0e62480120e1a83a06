package com.sulake.habbo.communication.messages.incoming.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementLevelUpData
   {
       
      
      private var _type:int;
      
      private var var_1195:int;
      
      private var var_1901:int;
      
      private var var_2502:int;
      
      private var var_2504:int;
      
      private var var_2496:int;
      
      private var var_2459:int;
      
      private var var_2535:String = "";
      
      private var var_3046:String = "";
      
      private var var_3047:int;
      
      private var _category:String;
      
      public function AchievementLevelUpData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1195 = param1.readInteger();
         this.var_2459 = param1.readInteger();
         this.var_2535 = param1.readString();
         this.var_1901 = param1.readInteger();
         this.var_2502 = param1.readInteger();
         this.var_2504 = param1.readInteger();
         this.var_2496 = param1.readInteger();
         this.var_3047 = param1.readInteger();
         this.var_3046 = param1.readString();
         this._category = param1.readString();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1195;
      }
      
      public function get points() : int
      {
         return this.var_1901;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2502;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2504;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_2496;
      }
      
      public function get badgeId() : int
      {
         return this.var_2459;
      }
      
      public function get badgeCode() : String
      {
         return this.var_2535;
      }
      
      public function get removedBadgeCode() : String
      {
         return this.var_3046;
      }
      
      public function get achievementID() : int
      {
         return this.var_3047;
      }
      
      public function get category() : String
      {
         return this._category;
      }
   }
}
