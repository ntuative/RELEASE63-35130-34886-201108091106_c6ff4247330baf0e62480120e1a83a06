package com.sulake.core.utils
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class XMLVariableParser
   {
      
      public static const const_148:String = "hex";
      
      public static const const_36:String = "int";
      
      public static const const_311:String = "uint";
      
      public static const const_140:String = "Number";
      
      public static const const_2001:String = "float";
      
      public static const const_37:String = "Boolean";
      
      public static const const_1922:String = "bool";
      
      public static const const_52:String = "String";
      
      public static const const_275:String = "Point";
      
      public static const const_307:String = "Rectangle";
      
      public static const const_167:String = "Array";
      
      public static const const_289:String = "Map";
      
      private static const const_733:String = "key";
      
      private static const TYPE:String = "type";
      
      private static const const_732:String = "value";
      
      private static const const_705:String = "true";
      
      private static const const_2143:String = "CfhChatlogMessageParser";
      
      private static const X:String = "x";
      
      private static const Y:String = "y";
      
      private static const name_2:String = "width";
      
      private static const name_1:String = "height";
      
      private static const const_1539:String = ",";
       
      
      public function XMLVariableParser()
      {
         super();
      }
      
      public static function parseVariableList(param1:XMLList, param2:Map, param3:Array = null) : uint
      {
         var _loc5_:int = 0;
         var _loc4_:uint = param1.length();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            XMLVariableParser.parseVariableToken(param1[_loc5_],param2,param3);
            _loc5_++;
         }
         return _loc4_;
      }
      
      private static function parseVariableToken(param1:XML, param2:Map, param3:Array = null) : void
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc5_:String = const_52;
         _loc7_ = param1.attribute(const_733);
         if(_loc7_.length() > 0)
         {
            _loc4_ = String(param1.attribute(const_733));
         }
         else
         {
            _loc4_ = param1.child(const_733)[0];
         }
         _loc7_ = param1.attribute(TYPE);
         if(_loc7_.length() > 0)
         {
            _loc5_ = String(param1.attribute(TYPE));
         }
         _loc7_ = param1.attribute(const_732);
         if(_loc7_.length() > 0)
         {
            _loc6_ = String(param1.attribute(const_732));
         }
         if(_loc6_ != null)
         {
            param2[_loc4_] = XMLVariableParser.castStringToType(_loc6_,_loc5_);
         }
         else
         {
            _loc8_ = param1.child(const_732)[0];
            if(_loc8_ != null)
            {
               _loc9_ = _loc8_.child(0)[0];
               _loc6_ = _loc9_.children()[0];
               _loc5_ = _loc9_.localName();
               param2[_loc4_] = XMLVariableParser.parseValueType(_loc9_,_loc5_);
            }
            else if(_loc5_ == const_289 || _loc5_ == const_167)
            {
               param2[_loc4_] = XMLVariableParser.parseValueType(param1,_loc5_);
            }
         }
         if(param3)
         {
            param3.push(_loc5_);
         }
      }
      
      public static function castStringToType(param1:String, param2:String) : Object
      {
         switch(param2)
         {
            case const_311:
               return uint(param1);
            case const_36:
               return int(param1);
            case const_140:
               return Number(param1);
            case const_2001:
               return Number(param1);
            case const_37:
               return param1 == const_705 || int(param1) > 0;
            case const_1922:
               return param1 == const_705 || int(param1) > 0;
            case const_148:
               return uint(param1);
            case const_167:
               return param1.split(const_1539);
            default:
               return String(param1);
         }
      }
      
      public static function parseValueType(param1:XML, param2:String) : Object
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         switch(param2)
         {
            case const_52:
               return String(param1);
            case const_275:
               _loc4_ = new Point();
               _loc4_.x = Number(param1.attribute(X));
               _loc4_.y = Number(param1.attribute(Y));
               return _loc4_;
            case const_307:
               _loc5_ = new Rectangle();
               _loc5_.x = Number(param1.attribute(X));
               _loc5_.y = Number(param1.attribute(Y));
               _loc5_.width = Number(param1.attribute(name_2));
               _loc5_.height = Number(param1.attribute(name_1));
               return _loc5_;
            case const_167:
               _loc3_ = new Map();
               parseVariableList(param1.children(),_loc3_);
               _loc6_ = new Array();
               for(_loc7_ in _loc3_)
               {
                  _loc6_.push(_loc3_[_loc7_]);
               }
               return _loc6_;
            case const_289:
               _loc3_ = new Map();
               XMLVariableParser.parseVariableList(param1.children(),_loc3_);
               return _loc3_;
            default:
               throw new Error("Unable to parse data type \"" + param2 + "\", unknown type!");
         }
      }
   }
}
