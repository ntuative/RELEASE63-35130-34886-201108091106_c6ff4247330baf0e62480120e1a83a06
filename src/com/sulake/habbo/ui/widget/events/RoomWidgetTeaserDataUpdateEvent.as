package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_552:String = "RWTDUE_TEASER_DATA";
      
      public static const const_993:String = "RWTDUE_GIFT_DATA";
      
      public static const const_950:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_234:int;
      
      private var _data:String;
      
      private var var_436:int;
      
      private var var_208:String;
      
      private var var_2687:String;
      
      private var var_2686:Boolean;
      
      private var var_1694:int = 0;
      
      private var var_2848:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_234;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_436;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2687;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2686;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2848;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1694;
      }
      
      public function set status(param1:int) : void
      {
         this.var_436 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2687 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2686 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2848 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_234 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_208;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_208 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1694 = param1;
      }
   }
}
