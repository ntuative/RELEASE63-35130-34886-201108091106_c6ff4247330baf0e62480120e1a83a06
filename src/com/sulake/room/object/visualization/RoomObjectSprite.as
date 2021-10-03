package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_1231:int = 0;
       
      
      private var var_490:BitmapData = null;
      
      private var var_2337:String = "";
      
      private var var_344:Boolean = true;
      
      private var var_2410:String = "";
      
      private var var_2523:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_2213:String;
      
      private var var_1503:Boolean = false;
      
      private var var_1504:Boolean = false;
      
      private var _offset:Point;
      
      private var var_220:int = 0;
      
      private var _height:int = 0;
      
      private var var_1235:Number = 0;
      
      private var var_2408:Boolean = false;
      
      private var var_3038:Boolean = true;
      
      private var var_2409:Boolean = false;
      
      private var _updateID:int = 0;
      
      private var var_2494:int = 0;
      
      private var var_3037:Array = null;
      
      public function RoomObjectSprite()
      {
         this.var_2213 = BlendMode.NORMAL;
         this._offset = new Point(0,0);
         super();
         this.var_2494 = var_1231++;
      }
      
      public function dispose() : void
      {
         this.var_490 = null;
         this.var_220 = 0;
         this._height = 0;
      }
      
      public function get asset() : BitmapData
      {
         return this.var_490;
      }
      
      public function get assetName() : String
      {
         return this.var_2337;
      }
      
      public function get visible() : Boolean
      {
         return this.var_344;
      }
      
      public function get tag() : String
      {
         return this.var_2410;
      }
      
      public function get alpha() : int
      {
         return this.var_2523;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function get blendMode() : String
      {
         return this.var_2213;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1504;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1503;
      }
      
      public function get offsetX() : int
      {
         return this._offset.x;
      }
      
      public function get offsetY() : int
      {
         return this._offset.y;
      }
      
      public function get width() : int
      {
         return this.var_220;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function get relativeDepth() : Number
      {
         return this.var_1235;
      }
      
      public function get varyingDepth() : Boolean
      {
         return this.var_2408;
      }
      
      public function get capturesMouse() : Boolean
      {
         return this.var_3038;
      }
      
      public function get clickHandling() : Boolean
      {
         return this.var_2409;
      }
      
      public function get instanceId() : int
      {
         return this.var_2494;
      }
      
      public function get updateId() : int
      {
         return this._updateID;
      }
      
      public function get filters() : Array
      {
         return this.var_3037;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            this.var_220 = param1.width;
            this._height = param1.height;
         }
         this.var_490 = param1;
         ++this._updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         this.var_2337 = param1;
         ++this._updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.var_344 = param1;
         ++this._updateID;
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2410 = param1;
         ++this._updateID;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         this.var_2523 = param1;
         ++this._updateID;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         this._color = param1;
         ++this._updateID;
      }
      
      public function set blendMode(param1:String) : void
      {
         this.var_2213 = param1;
         ++this._updateID;
      }
      
      public function set filters(param1:Array) : void
      {
         this.var_3037 = param1;
         ++this._updateID;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         this.var_1503 = param1;
         ++this._updateID;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         this.var_1504 = param1;
         ++this._updateID;
      }
      
      public function set offsetX(param1:int) : void
      {
         this._offset.x = param1;
         ++this._updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         this._offset.y = param1;
         ++this._updateID;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         this.var_1235 = param1;
         ++this._updateID;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         this.var_2408 = param1;
         ++this._updateID;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         this.var_3038 = param1;
         ++this._updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         this.var_2409 = param1;
         ++this._updateID;
      }
   }
}
