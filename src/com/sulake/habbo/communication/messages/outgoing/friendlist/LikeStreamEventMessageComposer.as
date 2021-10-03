package com.sulake.habbo.communication.messages.outgoing.friendlist
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LikeStreamEventMessageComposer implements IMessageComposer
   {
       
      
      private var var_2977:int;
      
      private var var_2527:int;
      
      public function LikeStreamEventMessageComposer(param1:int, param2:int)
      {
         super();
         this.var_2977 = param1;
         this.var_2527 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2977,this.var_2527];
      }
   }
}
