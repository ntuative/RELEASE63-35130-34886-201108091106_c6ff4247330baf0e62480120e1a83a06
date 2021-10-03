package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FavouriteMembershipUpdateMessageParser implements IMessageParser
   {
       
      
      private var var_2406:int;
      
      private var var_3014:int;
      
      private var var_436:int;
      
      public function FavouriteMembershipUpdateMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2406 = param1.readInteger();
         this.var_3014 = param1.readInteger();
         this.var_436 = param1.readInteger();
         return true;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2406;
      }
      
      public function get habboGroupId() : int
      {
         return this.var_3014;
      }
      
      public function get status() : int
      {
         return this.var_436;
      }
   }
}
