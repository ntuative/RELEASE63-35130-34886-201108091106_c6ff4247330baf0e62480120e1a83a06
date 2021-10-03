package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_3061:int;
      
      private var var_3060:int;
      
      private var var_837:Boolean;
      
      private var var_3064:int;
      
      private var var_3062:int;
      
      private var var_3063:int;
      
      private var var_3059:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_3061 = param1.readInteger();
         this.var_3060 = param1.readInteger();
         this.var_837 = param1.readBoolean();
         this.var_3064 = param1.readInteger();
         this.var_3062 = param1.readInteger();
         this.var_3063 = param1.readInteger();
         this.var_3059 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_3061;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_3060;
      }
      
      public function get online() : Boolean
      {
         return this.var_837;
      }
      
      public function get cfhCount() : int
      {
         return this.var_3064;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_3062;
      }
      
      public function get cautionCount() : int
      {
         return this.var_3063;
      }
      
      public function get banCount() : int
      {
         return this.var_3059;
      }
   }
}
