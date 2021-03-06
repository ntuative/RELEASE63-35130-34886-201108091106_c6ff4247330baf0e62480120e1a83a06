package com.sulake.habbo.communication.messages.incoming.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboGroupDetailsData
   {
      
      public static const const_1845:int = 0;
      
      public static const const_2342:int = 1;
      
      public static const const_1989:int = 2;
       
      
      private var var_2420:int;
      
      private var var_2536:String;
      
      private var var_2092:String;
      
      private var var_2535:String;
      
      private var _roomId:int = -1;
      
      private var var_1008:String = "";
      
      private var var_436:int;
      
      private var var_2619:int;
      
      private var var_2537:Boolean;
      
      public function HabboGroupDetailsData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2420 = param1.readInteger();
         this.var_2536 = param1.readString();
         this.var_2092 = param1.readString();
         this.var_2535 = param1.readString();
         this._roomId = param1.readInteger();
         this.var_1008 = param1.readString();
         this.var_436 = param1.readInteger();
         this.var_2619 = param1.readInteger();
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
      
      public function get description() : String
      {
         return this.var_2092;
      }
      
      public function get badgeCode() : String
      {
         return this.var_2535;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_1008;
      }
      
      public function get status() : int
      {
         return this.var_436;
      }
      
      public function get totalMembers() : int
      {
         return this.var_2619;
      }
      
      public function get favourite() : Boolean
      {
         return this.var_2537;
      }
   }
}
