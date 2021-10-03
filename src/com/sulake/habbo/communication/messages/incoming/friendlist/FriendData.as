package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_975:int;
      
      private var var_837:Boolean;
      
      private var var_2078:Boolean;
      
      private var var_630:String;
      
      private var var_1592:int;
      
      private var var_1944:String;
      
      private var var_1945:String;
      
      private var _realName:String;
      
      private var var_2360:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_975 = param1.readInteger();
         this.var_837 = param1.readBoolean();
         this.var_2078 = param1.readBoolean();
         this.var_630 = param1.readString();
         this.var_1592 = param1.readInteger();
         this.var_1944 = param1.readString();
         this.var_1945 = param1.readString();
         this._realName = param1.readString();
         this.var_2360 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_975;
      }
      
      public function get online() : Boolean
      {
         return this.var_837;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_2078;
      }
      
      public function get figure() : String
      {
         return this.var_630;
      }
      
      public function get categoryId() : int
      {
         return this.var_1592;
      }
      
      public function get motto() : String
      {
         return this.var_1944;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1945;
      }
      
      public function get realName() : String
      {
         return this._realName;
      }
      
      public function get facebookId() : String
      {
         return this.var_2360;
      }
   }
}
