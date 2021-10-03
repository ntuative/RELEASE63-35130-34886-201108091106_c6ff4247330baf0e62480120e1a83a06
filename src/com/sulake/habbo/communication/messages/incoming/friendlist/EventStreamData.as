package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class EventStreamData
   {
      
      public static const const_1031:uint = 0;
      
      public static const const_1393:uint = 1;
      
      public static const const_868:uint = 2;
      
      public static const const_1367:uint = 3;
      
      public static const const_1890:uint = 3;
      
      public static const const_2047:int = 0;
      
      public static const const_1337:int = 1;
      
      public static const const_1956:int = 2;
      
      public static const const_1878:int = 3;
      
      public static const LINK_TARGET_OPEN_MOTTO_CHANGER:int = 4;
      
      public static const const_2014:int = 5;
       
      
      private var _id:int;
      
      private var var_3013:int;
      
      private var var_3006:String;
      
      private var var_3009:String;
      
      private var var_3011:String;
      
      private var var_1419:String;
      
      private var var_3008:int;
      
      private var var_3012:int;
      
      private var var_3005:int;
      
      private var var_3010:Boolean;
      
      private var var_3007:Object;
      
      public function EventStreamData(param1:int, param2:int, param3:String, param4:String, param5:String, param6:String, param7:int, param8:int, param9:int, param10:Boolean, param11:IMessageDataWrapper)
      {
         super();
         this._id = param1;
         this.var_3013 = param2;
         this.var_3006 = param3;
         this.var_3009 = param4;
         this.var_3011 = param5;
         this.var_1419 = param6;
         this.var_3008 = param7;
         this.var_3012 = param8;
         this.var_3005 = param9;
         this.var_3010 = param10;
         this.var_3007 = parse(param2,param11);
      }
      
      protected static function parse(param1:int, param2:IMessageDataWrapper) : Object
      {
         var _loc3_:Object = new Object();
         switch(param1)
         {
            case const_1031:
               _loc3_.friendId = param2.readString();
               _loc3_.friendName = param2.readString();
               break;
            case const_1393:
               _loc3_.roomId = param2.readString();
               _loc3_.roomName = param2.readString();
               break;
            case const_868:
               _loc3_.achievementCode = param2.readString();
               break;
            case const_1367:
               _loc3_.motto = param2.readString();
         }
         return _loc3_;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get actionId() : int
      {
         return this.var_3013;
      }
      
      public function get accountId() : String
      {
         return this.var_3006;
      }
      
      public function get accountName() : String
      {
         return this.var_3009;
      }
      
      public function get imageFilePath() : String
      {
         return this.var_1419;
      }
      
      public function get minutesSinceEvent() : int
      {
         return this.var_3008;
      }
      
      public function get linkTargetType() : int
      {
         return this.var_3012;
      }
      
      public function get numberOfLikes() : int
      {
         return this.var_3005;
      }
      
      public function get isLikable() : Boolean
      {
         return this.var_3010;
      }
      
      public function get extraDataStruct() : Object
      {
         return this.var_3007;
      }
      
      public function get accountGender() : String
      {
         return this.var_3011;
      }
   }
}

class Struct
{
    
   
   function Struct()
   {
      super();
   }
}

class FriendMadeStruct extends Struct
{
    
   
   public var friendId:String;
   
   public var friendName:String;
   
   function FriendMadeStruct(param1:String, param2:String)
   {
      super();
      this.friendId = param1;
      this.friendName = param2;
   }
}

class RoomLikedStruct extends Struct
{
    
   
   public var roomId:String;
   
   public var roomName:String;
   
   function RoomLikedStruct(param1:String, param2:String)
   {
      super();
      this.roomId = param1;
      this.roomName = param2;
   }
}

class AchievementEarnedStruct extends Struct
{
    
   
   public var achievementCode:String;
   
   function AchievementEarnedStruct(param1:String)
   {
      super();
      this.achievementCode = param1;
   }
}
