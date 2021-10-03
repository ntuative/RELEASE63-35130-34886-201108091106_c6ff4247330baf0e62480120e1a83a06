package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeMessageData
   {
       
      
      private var var_2338:String;
      
      private var var_2149:int;
      
      public function PrizeMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2338 = param1.readString();
         this.var_2149 = param1.readInteger();
      }
      
      public function get productItemType() : String
      {
         return this.var_2338;
      }
      
      public function get productItemTypeId() : int
      {
         return this.var_2149;
      }
   }
}
