package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_2337:String;
      
      private var var_2812:String;
      
      private var var_490:BitmapDataAsset;
      
      private var var_1503:Boolean;
      
      private var var_1504:Boolean;
      
      private var var_2811:Boolean;
      
      private var _offsetX:int;
      
      private var var_1175:int;
      
      private var var_220:int;
      
      private var _height:int;
      
      private var var_907:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_2337 = param1;
         this.var_2812 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_490 = _loc9_;
            this.var_907 = false;
         }
         else
         {
            this.var_490 = null;
            this.var_907 = true;
         }
         this.var_1503 = param4;
         this.var_1504 = param5;
         this._offsetX = param6;
         this.var_1175 = param7;
         this.var_2811 = param8;
      }
      
      public function dispose() : void
      {
         this.var_490 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_907 && this.var_490 != null)
         {
            _loc1_ = this.var_490.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_220 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_907 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1504;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1503;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_220;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_2337;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2812;
      }
      
      public function get asset() : IAsset
      {
         return this.var_490;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2811;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1503)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1504)
         {
            return this.var_1175;
         }
         return -(this.height + this.var_1175);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1175;
      }
   }
}
