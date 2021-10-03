package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1766:int;
      
      private var var_2334:String;
      
      private var var_975:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1766 = param1.readInteger();
         this.var_2334 = param1.readString();
         this.var_975 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1766;
      }
      
      public function get figureString() : String
      {
         return this.var_2334;
      }
      
      public function get gender() : String
      {
         return this.var_975;
      }
   }
}
