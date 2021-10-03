package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_234:int = 0;
      
      private var var_1869:int = 0;
      
      private var var_1868:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_234;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1869;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1868;
      }
      
      public function flush() : Boolean
      {
         this.var_234 = 0;
         this.var_1869 = 0;
         this.var_1868 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_234 = param1.readInteger();
         this.var_1869 = param1.readInteger();
         this.var_1868 = param1.readString();
         return true;
      }
   }
}
