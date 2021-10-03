package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_2219:String;
      
      private var var_2222:int;
      
      private var var_2217:int;
      
      private var var_2186:int;
      
      private var _id:int;
      
      private var var_2220:Boolean;
      
      private var _type:String;
      
      private var var_3053:String;
      
      private var var_3055:int;
      
      private var var_2218:String;
      
      private var var_3056:int;
      
      private var var_3054:int;
      
      private var var_1719:int;
      
      private var var_2221:Date;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         this.var_2221 = new Date();
         super();
         this.var_2219 = param1.readString();
         this.var_2222 = param1.readInteger();
         this.var_2217 = param1.readInteger();
         this.var_2186 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_2220 = param1.readBoolean();
         this._type = param1.readString();
         this.var_3053 = param1.readString();
         this.var_3055 = param1.readInteger();
         this.var_2218 = param1.readString();
         this.var_3056 = param1.readInteger();
         this.var_3054 = param1.readInteger();
         this.var_1719 = param1.readInteger();
      }
      
      public function get campaignCode() : String
      {
         return this.var_2219;
      }
      
      public function get localizationCode() : String
      {
         return this.var_2218;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_2222;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_2217;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2186;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_2220;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get imageVersion() : String
      {
         return this.var_3053;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_3055;
      }
      
      public function get completedSteps() : int
      {
         return this.var_3056;
      }
      
      public function get totalSteps() : int
      {
         return this.var_3054;
      }
      
      public function get waitPeriodSeconds() : int
      {
         if(this.var_1719 < 1)
         {
            return 0;
         }
         var _loc1_:Date = new Date();
         var _loc2_:int = _loc1_.getTime() - this.var_2221.getTime();
         return int(Math.max(0,this.var_1719 - Math.floor(_loc2_ / 1000)));
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.var_2219;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this.var_2218;
      }
      
      public function get completedCampaign() : Boolean
      {
         return this._id < 1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set accepted(param1:Boolean) : void
      {
         this.var_2220 = param1;
      }
      
      public function get lastQuestInCampaign() : Boolean
      {
         return this.var_2222 >= this.var_2217;
      }
      
      public function get receiveTime() : Date
      {
         return this.var_2221;
      }
      
      public function set waitPeriodSeconds(param1:int) : void
      {
         this.var_1719 = param1;
      }
   }
}
