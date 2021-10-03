package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestController implements IDisposable, IUpdateReceiver
   {
       
      
      private var var_50:HabboQuestEngine;
      
      private var var_559:QuestsList;
      
      private var var_469:QuestDetails;
      
      private var _questCompleted:QuestCompleted;
      
      private var var_387:QuestTracker;
      
      private var var_669:NextQuestTimer;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         super();
         this.var_50 = param1;
         this.var_387 = new QuestTracker(this.var_50);
         this.var_559 = new QuestsList(this.var_50);
         this.var_469 = new QuestDetails(this.var_50);
         this._questCompleted = new QuestCompleted(this.var_50);
         this.var_669 = new NextQuestTimer(this.var_50);
      }
      
      public function onToolbarClick() : void
      {
         this.var_559.onToolbarClick();
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         this.var_559.onQuests(param1,param2);
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.var_387.onQuest(param1);
         this.var_469.onQuest(param1);
         this._questCompleted.onQuest(param1);
         this.var_669.onQuest(param1);
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.var_387.onQuestCompleted(param1);
         this.var_469.onQuestCompleted(param1);
         this._questCompleted.onQuestCompleted(param1);
      }
      
      public function onQuestCancelled() : void
      {
         this.var_387.onQuestCancelled();
         this.var_469.onQuestCancelled();
         this._questCompleted.onQuestCancelled();
         this.var_669.onQuestCancelled();
      }
      
      public function onRoomEnter() : void
      {
         this.var_387.onRoomEnter();
      }
      
      public function onRoomExit() : void
      {
         this.var_559.onRoomExit();
         this.var_387.onRoomExit();
         this.var_469.onRoomExit();
         this.var_669.onRoomExit();
      }
      
      public function update(param1:uint) : void
      {
         this._questCompleted.update(param1);
         this.var_387.update(param1);
         this.var_669.update(param1);
         this.var_559.update(param1);
         this.var_469.update(param1);
      }
      
      public function dispose() : void
      {
         this.var_50 = null;
         if(this.var_559)
         {
            this.var_559.dispose();
            this.var_559 = null;
         }
         if(this.var_387)
         {
            this.var_387.dispose();
            this.var_387 = null;
         }
         if(this.var_469)
         {
            this.var_469.dispose();
            this.var_469 = null;
         }
         if(this._questCompleted)
         {
            this._questCompleted.dispose();
            this._questCompleted = null;
         }
         if(this.var_669)
         {
            this.var_669.dispose();
            this.var_669 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_50 == null;
      }
      
      public function get questsList() : QuestsList
      {
         return this.var_559;
      }
      
      public function get questDetails() : QuestDetails
      {
         return this.var_469;
      }
      
      public function get questTracker() : QuestTracker
      {
         return this.var_387;
      }
   }
}
