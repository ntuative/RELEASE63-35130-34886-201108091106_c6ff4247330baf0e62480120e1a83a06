package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1238:int;
      
      private var var_2335:String;
      
      private var var_2336:int;
      
      private var var_2334:String;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1238 = param1.readInteger();
         this.var_2335 = param1.readString();
         this.var_2334 = param1.readString();
         this.var_2336 = this.var_1238;
      }
      
      public function get requestId() : int
      {
         return this.var_1238;
      }
      
      public function get requesterName() : String
      {
         return this.var_2335;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2336;
      }
      
      public function get figureString() : String
      {
         return this.var_2334;
      }
   }
}
