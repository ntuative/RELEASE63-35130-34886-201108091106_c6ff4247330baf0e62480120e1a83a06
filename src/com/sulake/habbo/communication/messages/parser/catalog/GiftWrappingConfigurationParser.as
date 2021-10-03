package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2481:Boolean;
      
      private var var_2480:int;
      
      private var var_1831:Array;
      
      private var var_936:Array;
      
      private var var_937:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2481;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2480;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1831;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_936;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_937;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1831 = [];
         this.var_936 = [];
         this.var_937 = [];
         this.var_2481 = param1.readBoolean();
         this.var_2480 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1831.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_936.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_937.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
