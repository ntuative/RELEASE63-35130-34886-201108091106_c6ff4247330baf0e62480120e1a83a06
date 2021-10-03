package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1589:Boolean;
      
      private var var_2117:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function get isOpen() : Boolean
      {
         return this.var_1589;
      }
      
      public function get onShutDown() : Boolean
      {
         return this.var_2117;
      }
      
      public function flush() : Boolean
      {
         this.var_1589 = false;
         this.var_2117 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1589 = param1.readInteger() > 0;
         this.var_2117 = param1.readInteger() > 0;
         return true;
      }
   }
}
