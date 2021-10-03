package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_1045:int = 1;
      
      public static const const_752:int = 2;
      
      public static const const_907:int = 3;
      
      public static const const_1262:int = 4;
      
      public static const const_1016:int = 5;
      
      public static const const_1277:int = 6;
       
      
      private var _type:int;
      
      private var var_1394:int;
      
      private var var_2303:String;
      
      private var var_2561:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1394 = param2;
         this.var_2303 = param3;
         this.var_2561 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2303;
      }
      
      public function get time() : String
      {
         return this.var_2561;
      }
      
      public function get senderId() : int
      {
         return this.var_1394;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
