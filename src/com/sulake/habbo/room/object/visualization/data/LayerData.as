package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_847:String = "";
      
      public static const const_435:int = 0;
      
      public static const const_593:int = 255;
      
      public static const const_889:Boolean = false;
      
      public static const const_514:int = 0;
      
      public static const const_525:int = 0;
      
      public static const const_438:int = 0;
      
      public static const const_1264:int = 1;
      
      public static const const_1273:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2410:String = "";
      
      private var var_2195:int = 0;
      
      private var var_2523:int = 255;
      
      private var var_2864:Boolean = false;
      
      private var var_2866:int = 0;
      
      private var var_2867:int = 0;
      
      private var var_2865:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2410 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2410;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_2195 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_2195;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2523 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2523;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2864 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2864;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2866 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2866;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2867 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2867;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2865 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2865;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
