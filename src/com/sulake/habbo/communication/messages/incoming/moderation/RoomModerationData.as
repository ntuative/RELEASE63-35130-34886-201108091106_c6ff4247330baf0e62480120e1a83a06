package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_372:int;
      
      private var var_2341:int;
      
      private var var_2339:Boolean;
      
      private var var_2340:int;
      
      private var _ownerName:String;
      
      private var var_133:RoomData;
      
      private var var_870:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_372 = param1.readInteger();
         this.var_2341 = param1.readInteger();
         this.var_2339 = param1.readBoolean();
         this.var_2340 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_133 = new RoomData(param1);
         this.var_870 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_133 != null)
         {
            this.var_133.dispose();
            this.var_133 = null;
         }
         if(this.var_870 != null)
         {
            this.var_870.dispose();
            this.var_870 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_372;
      }
      
      public function get userCount() : int
      {
         return this.var_2341;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2339;
      }
      
      public function get ownerId() : int
      {
         return this.var_2340;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_133;
      }
      
      public function get event() : RoomData
      {
         return this.var_870;
      }
   }
}
