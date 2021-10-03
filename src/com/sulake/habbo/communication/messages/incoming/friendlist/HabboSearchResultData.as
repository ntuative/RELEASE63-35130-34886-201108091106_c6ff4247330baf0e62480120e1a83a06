package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2527:int;
      
      private var var_2009:String;
      
      private var var_2708:String;
      
      private var var_2905:Boolean;
      
      private var var_2906:Boolean;
      
      private var var_2907:int;
      
      private var var_2707:String;
      
      private var var_2904:String;
      
      private var _realName:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2527 = param1.readInteger();
         this.var_2009 = param1.readString();
         this.var_2708 = param1.readString();
         this.var_2905 = param1.readBoolean();
         this.var_2906 = param1.readBoolean();
         param1.readString();
         this.var_2907 = param1.readInteger();
         this.var_2707 = param1.readString();
         this.var_2904 = param1.readString();
         this._realName = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2527;
      }
      
      public function get avatarName() : String
      {
         return this.var_2009;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2708;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2905;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2906;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2907;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2707;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2904;
      }
      
      public function get realName() : String
      {
         return this._realName;
      }
   }
}
