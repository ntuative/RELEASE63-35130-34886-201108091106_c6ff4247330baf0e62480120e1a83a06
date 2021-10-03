package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2990:String;
      
      private var var_2598:int;
      
      private var var_2591:int;
      
      private var var_2861:String;
      
      private var var_3000:int;
      
      private var var_2090:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2990 = param1.readString();
         this.var_2598 = param1.readInteger();
         this.var_2591 = param1.readInteger();
         this.var_2861 = param1.readString();
         this.var_3000 = param1.readInteger();
         this.var_2090 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2990;
      }
      
      public function get unitPort() : int
      {
         return this.var_2598;
      }
      
      public function get worldId() : int
      {
         return this.var_2591;
      }
      
      public function get castLibs() : String
      {
         return this.var_2861;
      }
      
      public function get maxUsers() : int
      {
         return this.var_3000;
      }
      
      public function get nodeId() : int
      {
         return this.var_2090;
      }
   }
}
