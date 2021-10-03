package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1400:int = 1;
      
      public static const const_916:int = 2;
      
      public static const const_943:int = 3;
      
      public static const const_1805:int = 4;
       
      
      private var _index:int;
      
      private var var_3035:String;
      
      private var var_3036:String;
      
      private var var_3032:Boolean;
      
      private var var_3033:String;
      
      private var var_1023:String;
      
      private var var_3034:int;
      
      private var var_2341:int;
      
      private var _type:int;
      
      private var var_2410:String;
      
      private var var_1151:GuestRoomData;
      
      private var var_1150:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_3035 = param1.readString();
         this.var_3036 = param1.readString();
         this.var_3032 = param1.readInteger() == 1;
         this.var_3033 = param1.readString();
         this.var_1023 = param1.readString();
         this.var_3034 = param1.readInteger();
         this.var_2341 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1400)
         {
            this.var_2410 = param1.readString();
         }
         else if(this._type == const_943)
         {
            this.var_1150 = new PublicRoomData(param1);
         }
         else if(this._type == const_916)
         {
            this.var_1151 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_1151 != null)
         {
            this.var_1151.dispose();
            this.var_1151 = null;
         }
         if(this.var_1150 != null)
         {
            this.var_1150.dispose();
            this.var_1150 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_3035;
      }
      
      public function get popupDesc() : String
      {
         return this.var_3036;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_3032;
      }
      
      public function get picText() : String
      {
         return this.var_3033;
      }
      
      public function get picRef() : String
      {
         return this.var_1023;
      }
      
      public function get folderId() : int
      {
         return this.var_3034;
      }
      
      public function get tag() : String
      {
         return this.var_2410;
      }
      
      public function get userCount() : int
      {
         return this.var_2341;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_1151;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_1150;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1400)
         {
            return 0;
         }
         if(this.type == const_916)
         {
            return this.var_1151.maxUserCount;
         }
         if(this.type == const_943)
         {
            return this.var_1150.maxUsers;
         }
         return 0;
      }
   }
}
