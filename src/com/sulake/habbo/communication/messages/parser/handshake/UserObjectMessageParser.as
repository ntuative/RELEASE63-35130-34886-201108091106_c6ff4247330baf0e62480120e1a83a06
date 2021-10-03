package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_630:String;
      
      private var var_1112:String;
      
      private var var_2757:String;
      
      private var _realName:String;
      
      private var var_2754:int;
      
      private var var_2755:int;
      
      private var var_1183:int;
      
      private var var_776:int;
      
      private var var_2756:Boolean;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_630 = param1.readString();
         this.var_1112 = param1.readString();
         this.var_2757 = param1.readString();
         this._realName = param1.readString();
         this.var_2754 = param1.readInteger();
         this.var_2755 = param1.readInteger();
         this.var_1183 = param1.readInteger();
         this.var_776 = param1.readInteger();
         this.var_2756 = param1.readBoolean();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_630;
      }
      
      public function get sex() : String
      {
         return this.var_1112;
      }
      
      public function get customData() : String
      {
         return this.var_2757;
      }
      
      public function get realName() : String
      {
         return this._realName;
      }
      
      public function get directMail() : int
      {
         return this.var_2754;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2755;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1183;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_776;
      }
      
      public function get streamPublishingAllowed() : Boolean
      {
         return this.var_2756;
      }
   }
}
