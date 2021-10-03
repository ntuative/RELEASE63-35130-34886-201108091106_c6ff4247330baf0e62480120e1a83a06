package com.sulake.habbo.communication.messages.incoming.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboGroupEntryData
   {
       
      
      private var var_2420:int;
      
      private var var_2536:String;
      
      private var var_2535:String;
      
      private var var_2537:Boolean;
      
      public function HabboGroupEntryData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2420 = param1.readInteger();
         this.var_2536 = param1.readString();
         this.var_2535 = param1.readString();
         this.var_2537 = param1.readBoolean();
      }
      
      public function get groupId() : int
      {
         return this.var_2420;
      }
      
      public function get groupName() : String
      {
         return this.var_2536;
      }
      
      public function get badgeCode() : String
      {
         return this.var_2535;
      }
      
      public function get favourite() : Boolean
      {
         return this.var_2537;
      }
   }
}
