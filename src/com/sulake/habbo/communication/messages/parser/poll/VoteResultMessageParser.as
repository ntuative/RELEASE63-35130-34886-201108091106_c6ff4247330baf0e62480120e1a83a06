package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1376:String;
      
      private var var_1648:Array;
      
      private var var_1219:Array;
      
      private var var_2123:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1376;
      }
      
      public function get choices() : Array
      {
         return this.var_1648.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1219.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_2123;
      }
      
      public function flush() : Boolean
      {
         this.var_1376 = "";
         this.var_1648 = [];
         this.var_1219 = [];
         this.var_2123 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1376 = param1.readString();
         this.var_1648 = [];
         this.var_1219 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1648.push(param1.readString());
            this.var_1219.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2123 = param1.readInteger();
         return true;
      }
   }
}
