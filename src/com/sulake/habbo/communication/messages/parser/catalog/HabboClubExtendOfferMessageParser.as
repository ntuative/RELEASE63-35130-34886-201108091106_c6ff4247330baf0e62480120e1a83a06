package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.catalog.ClubOfferExtendData;
   
   public class HabboClubExtendOfferMessageParser implements IMessageParser
   {
       
      
      private var var_104:ClubOfferExtendData;
      
      public function HabboClubExtendOfferMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_104 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_104 = new ClubOfferExtendData(param1);
         return true;
      }
      
      public function offer() : ClubOfferExtendData
      {
         return this.var_104;
      }
   }
}
