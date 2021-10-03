package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoucherRedeemOkMessageParser implements IMessageParser
   {
       
      
      private var var_986:String = "";
      
      private var var_1193:String = "";
      
      public function VoucherRedeemOkMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1193 = "";
         this.var_986 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1193 = param1.readString();
         this.var_986 = param1.readString();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_986;
      }
      
      public function get productDescription() : String
      {
         return this.var_1193;
      }
   }
}
