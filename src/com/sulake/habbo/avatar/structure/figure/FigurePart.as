package com.sulake.habbo.avatar.structure.figure
{
   public class FigurePart implements IFigurePart
   {
       
      
      private var _id:int;
      
      private var _type:String;
      
      private var var_1742:int = -1;
      
      private var var_2673:int;
      
      private var _index:int;
      
      private var var_2582:int = -1;
      
      public function FigurePart(param1:XML)
      {
         super();
         this._id = parseInt(param1.@id);
         this._type = String(param1.@type);
         this._index = parseInt(param1.@index);
         this.var_2673 = parseInt(param1.@colorindex);
         var _loc2_:String = param1.@palettemapid;
         if(_loc2_ != "")
         {
            this.var_2582 = int(_loc2_);
         }
         var _loc3_:String = param1.@breed;
         if(_loc3_ != "")
         {
            this.var_1742 = int(_loc3_);
         }
      }
      
      public function dispose() : void
      {
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get breed() : int
      {
         return this.var_1742;
      }
      
      public function get colorLayerIndex() : int
      {
         return this.var_2673;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get paletteMap() : int
      {
         return this.var_2582;
      }
   }
}
