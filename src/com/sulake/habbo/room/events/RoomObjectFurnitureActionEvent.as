package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   
   public class RoomObjectFurnitureActionEvent extends RoomObjectEvent
   {
      
      public static const const_628:String = "ROFCAE_DICE_OFF";
      
      public static const const_636:String = "ROFCAE_DICE_ACTIVATE";
      
      public static const const_565:String = "ROFCAE_USE_HABBOWHEEL";
      
      public static const const_554:String = "ROFCAE_STICKIE";
      
      public static const const_621:String = "ROFCAE_VIRAL_GIFT";
      
      public static const const_512:String = "ROFCAE_ENTER_ONEWAYDOOR";
      
      public static const const_672:String = "ROFCAE_QUEST_VENDING";
      
      public static const const_545:String = "ROFCAE_SOUND_MACHINE_INIT";
      
      public static const const_499:String = "ROFCAE_SOUND_MACHINE_START";
      
      public static const const_612:String = "ROFCAE_SOUND_MACHINE_STOP";
      
      public static const const_641:String = "ROFCAE_SOUND_MACHINE_DISPOSE";
      
      public static const const_658:String = "ROFCAE_JUKEBOX_INIT";
      
      public static const const_534:String = "ROFCAE_JUKEBOX_START";
      
      public static const const_620:String = "ROFCAE_JUKEBOX_MACHINE_STOP";
      
      public static const const_520:String = "ROFCAE_JUKEBOX_DISPOSE";
      
      public static const const_279:String = "ROFCAE_MOUSE_BUTTON";
      
      public static const const_381:String = "ROFCAE_MOUSE_ARROW";
       
      
      public function RoomObjectFurnitureActionEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
