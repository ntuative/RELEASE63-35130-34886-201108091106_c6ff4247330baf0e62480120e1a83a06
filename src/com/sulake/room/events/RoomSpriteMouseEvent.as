package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1940:String = "";
      
      private var var_2196:String = "";
      
      private var var_2300:String = "";
      
      private var var_2982:Number = 0;
      
      private var var_2981:Number = 0;
      
      private var var_2803:Number = 0;
      
      private var var_2801:Number = 0;
      
      private var var_2684:Boolean = false;
      
      private var var_2683:Boolean = false;
      
      private var var_2681:Boolean = false;
      
      private var var_2682:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1940 = param2;
         this.var_2196 = param3;
         this.var_2300 = param4;
         this.var_2982 = param5;
         this.var_2981 = param6;
         this.var_2803 = param7;
         this.var_2801 = param8;
         this.var_2684 = param9;
         this.var_2683 = param10;
         this.var_2681 = param11;
         this.var_2682 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1940;
      }
      
      public function get canvasId() : String
      {
         return this.var_2196;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2300;
      }
      
      public function get screenX() : Number
      {
         return this.var_2982;
      }
      
      public function get screenY() : Number
      {
         return this.var_2981;
      }
      
      public function get localX() : Number
      {
         return this.var_2803;
      }
      
      public function get localY() : Number
      {
         return this.var_2801;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2684;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2683;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2681;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2682;
      }
   }
}
