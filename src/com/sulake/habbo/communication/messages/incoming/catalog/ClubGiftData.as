package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_1413:int;
      
      private var var_2873:Boolean;
      
      private var var_2353:Boolean;
      
      private var var_2872:int;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1413 = param1.readInteger();
         this.var_2873 = param1.readBoolean();
         this.var_2872 = param1.readInteger();
         this.var_2353 = param1.readBoolean();
      }
      
      public function get offerId() : int
      {
         return this.var_1413;
      }
      
      public function get isVip() : Boolean
      {
         return this.var_2873;
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_2353;
      }
      
      public function get daysRequired() : int
      {
         return this.var_2872;
      }
   }
}
