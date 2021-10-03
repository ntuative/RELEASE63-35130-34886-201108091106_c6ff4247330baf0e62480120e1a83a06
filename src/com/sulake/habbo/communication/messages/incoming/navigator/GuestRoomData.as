package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_372:int;
      
      private var var_870:Boolean;
      
      private var var_1008:String;
      
      private var _ownerName:String;
      
      private var var_2319:int;
      
      private var var_2341:int;
      
      private var var_2358:int;
      
      private var var_2092:String;
      
      private var var_2355:int;
      
      private var var_2322:Boolean;
      
      private var var_817:int;
      
      private var var_1592:int;
      
      private var var_2356:String;
      
      private var var_951:Array;
      
      private var var_2354:RoomThumbnailData;
      
      private var var_2357:Boolean;
      
      private var var_2359:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_951 = new Array();
         super();
         this.var_372 = param1.readInteger();
         this.var_870 = param1.readBoolean();
         this.var_1008 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2319 = param1.readInteger();
         this.var_2341 = param1.readInteger();
         this.var_2358 = param1.readInteger();
         this.var_2092 = param1.readString();
         this.var_2355 = param1.readInteger();
         this.var_2322 = param1.readBoolean();
         this.var_817 = param1.readInteger();
         this.var_1592 = param1.readInteger();
         this.var_2356 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_951.push(_loc4_);
            _loc3_++;
         }
         this.var_2354 = new RoomThumbnailData(param1);
         this.var_2357 = param1.readBoolean();
         this.var_2359 = param1.readBoolean();
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
      
      public function get flatId() : int
      {
         return this.var_372;
      }
      
      public function get event() : Boolean
      {
         return this.var_870;
      }
      
      public function get roomName() : String
      {
         return this.var_1008;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2319;
      }
      
      public function get userCount() : int
      {
         return this.var_2341;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2358;
      }
      
      public function get description() : String
      {
         return this.var_2092;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2355;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2322;
      }
      
      public function get score() : int
      {
         return this.var_817;
      }
      
      public function get categoryId() : int
      {
         return this.var_1592;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2356;
      }
      
      public function get tags() : Array
      {
         return this.var_951;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2354;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2357;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2359;
      }
   }
}
