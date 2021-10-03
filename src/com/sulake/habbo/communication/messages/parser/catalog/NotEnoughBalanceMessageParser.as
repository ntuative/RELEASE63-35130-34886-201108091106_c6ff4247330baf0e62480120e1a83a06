package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_2228:int = 0;
      
      private var var_2227:int = 0;
      
      private var var_2186:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_2228;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_2227;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2186;
      }
      
      public function flush() : Boolean
      {
         this.var_2228 = 0;
         this.var_2227 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2228 = param1.readInteger();
         this.var_2227 = param1.readInteger();
         this.var_2186 = param1.readInteger();
         return true;
      }
   }
}
