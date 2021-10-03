package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1274:Boolean;
      
      private var var_1273:Boolean;
      
      private var var_1570:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1274;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1273;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1570;
      }
      
      public function flush() : Boolean
      {
         this.var_1274 = false;
         this.var_1273 = false;
         this.var_1570 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1274 = param1.readBoolean();
         this.var_1273 = param1.readBoolean();
         this.var_1570 = param1.readBoolean();
         return true;
      }
   }
}
