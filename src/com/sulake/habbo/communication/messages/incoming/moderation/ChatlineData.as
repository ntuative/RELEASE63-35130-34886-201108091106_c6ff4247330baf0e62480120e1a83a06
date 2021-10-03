package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2852:int;
      
      private var var_2851:int;
      
      private var var_2850:int;
      
      private var var_2853:String;
      
      private var var_1819:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2852 = param1.readInteger();
         this.var_2851 = param1.readInteger();
         this.var_2850 = param1.readInteger();
         this.var_2853 = param1.readString();
         this.var_1819 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2852;
      }
      
      public function get minute() : int
      {
         return this.var_2851;
      }
      
      public function get chatterId() : int
      {
         return this.var_2850;
      }
      
      public function get chatterName() : String
      {
         return this.var_2853;
      }
      
      public function get msg() : String
      {
         return this.var_1819;
      }
   }
}
