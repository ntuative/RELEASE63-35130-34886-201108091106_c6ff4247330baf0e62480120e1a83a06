package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1830:Boolean;
      
      private var var_2475:int;
      
      private var var_2477:String;
      
      private var var_372:int;
      
      private var var_2476:int;
      
      private var var_2153:String;
      
      private var var_2478:String;
      
      private var var_2479:String;
      
      private var var_951:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_951 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1830 = false;
            return;
         }
         this.var_1830 = true;
         this.var_2475 = int(_loc2_);
         this.var_2477 = param1.readString();
         this.var_372 = int(param1.readString());
         this.var_2476 = param1.readInteger();
         this.var_2153 = param1.readString();
         this.var_2478 = param1.readString();
         this.var_2479 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_951.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_951 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2475;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2477;
      }
      
      public function get flatId() : int
      {
         return this.var_372;
      }
      
      public function get eventType() : int
      {
         return this.var_2476;
      }
      
      public function get eventName() : String
      {
         return this.var_2153;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2478;
      }
      
      public function get creationTime() : String
      {
         return this.var_2479;
      }
      
      public function get tags() : Array
      {
         return this.var_951;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1830;
      }
   }
}
