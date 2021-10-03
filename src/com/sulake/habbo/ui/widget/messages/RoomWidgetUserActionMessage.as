package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_602:String = "RWUAM_WHISPER_USER";
      
      public static const const_528:String = "RWUAM_IGNORE_USER";
      
      public static const const_541:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_403:String = "RWUAM_KICK_USER";
      
      public static const const_656:String = "RWUAM_BAN_USER";
      
      public static const const_600:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_540:String = "RWUAM_RESPECT_USER";
      
      public static const const_613:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_607:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_583:String = "RWUAM_START_TRADING";
      
      public static const const_1033:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_524:String = "RWUAM_KICK_BOT";
      
      public static const const_664:String = "RWUAM_REPORT";
      
      public static const const_617:String = "RWUAM_PICKUP_PET";
      
      public static const const_1984:String = "RWUAM_TRAIN_PET";
      
      public static const const_671:String = " RWUAM_RESPECT_PET";
      
      public static const const_308:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_676:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
