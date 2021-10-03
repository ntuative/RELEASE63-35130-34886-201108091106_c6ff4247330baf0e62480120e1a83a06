package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1195:int;
      
      private var var_2459:String;
      
      private var var_1853:int;
      
      private var var_2502:int;
      
      private var var_2504:int;
      
      private var var_1854:int;
      
      private var var_1852:Boolean;
      
      private var _category:String;
      
      private var var_2503:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1195 = param1.readInteger();
         this.var_2459 = param1.readString();
         this.var_1853 = Math.max(1,param1.readInteger());
         this.var_2502 = param1.readInteger();
         this.var_2504 = param1.readInteger();
         this.var_1854 = param1.readInteger();
         this.var_1852 = param1.readBoolean();
         this._category = param1.readString();
         this.var_2503 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_2459;
      }
      
      public function get level() : int
      {
         return this.var_1195;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_1853;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2502;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2504;
      }
      
      public function get currentPoints() : int
      {
         return this.var_1854;
      }
      
      public function get finalLevel() : Boolean
      {
         return this.var_1852;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get levelCount() : int
      {
         return this.var_2503;
      }
      
      public function get firstLevelAchieved() : Boolean
      {
         return this.var_1195 > 1 || this.var_1852;
      }
      
      public function setMaxProgress() : void
      {
         this.var_1854 = this.var_1853;
      }
   }
}
