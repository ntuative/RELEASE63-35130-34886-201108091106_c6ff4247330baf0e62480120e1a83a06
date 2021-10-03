package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1951:int;
      
      private var var_2333:String;
      
      private var var_1195:int;
      
      private var var_1422:int;
      
      private var var_1742:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1951 = param1.readInteger();
         this.var_2333 = param1.readString();
         this.var_1195 = param1.readInteger();
         this.var_1422 = param1.readInteger();
         this.var_1742 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1951;
      }
      
      public function get petName() : String
      {
         return this.var_2333;
      }
      
      public function get level() : int
      {
         return this.var_1195;
      }
      
      public function get petType() : int
      {
         return this.var_1422;
      }
      
      public function get breed() : int
      {
         return this.var_1742;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
