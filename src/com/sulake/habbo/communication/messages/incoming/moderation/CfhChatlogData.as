package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_2022:int;
      
      private var var_2727:int;
      
      private var var_1494:int;
      
      private var var_2601:int;
      
      private var var_133:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2022 = param1.readInteger();
         this.var_2727 = param1.readInteger();
         this.var_1494 = param1.readInteger();
         this.var_2601 = param1.readInteger();
         this.var_133 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_2022);
      }
      
      public function get callId() : int
      {
         return this.var_2022;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2727;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1494;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2601;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_133;
      }
   }
}
