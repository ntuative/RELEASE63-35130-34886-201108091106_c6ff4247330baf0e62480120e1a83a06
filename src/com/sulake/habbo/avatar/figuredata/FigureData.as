package com.sulake.habbo.avatar.figuredata
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   
   public class FigureData implements IAvatarImageListener
   {
      
      public static const const_90:String = "M";
      
      public static const FEMALE:String = "F";
      
      public static const const_2079:String = "U";
      
      public static const const_629:String = "h";
      
      public static const const_643:String = "std";
      
      public static const const_978:String = "4";
      
      public static const const_188:String = "0";
      
      public static const const_89:String = "hd";
      
      public static const const_222:String = "hr";
      
      public static const const_283:String = "ha";
      
      public static const const_251:String = "he";
      
      public static const const_292:String = "ea";
      
      public static const const_253:String = "fa";
      
      public static const const_280:String = "cc";
      
      public static const const_205:String = "ch";
      
      public static const const_290:String = "ca";
      
      public static const CHEST_PRINTS:String = "cp";
      
      public static const const_227:String = "lg";
      
      public static const const_312:String = "sh";
      
      public static const const_286:String = "wa";
       
      
      private var var_1548:HabboAvatarEditor;
      
      private var _view:FigureDataView;
      
      private var _data:Dictionary;
      
      private var _colors:Dictionary;
      
      private var var_975:String = "M";
      
      private var var_1164:Boolean;
      
      public function FigureData(param1:HabboAvatarEditor)
      {
         super();
         this.var_1548 = param1;
         this._view = new FigureDataView(param1.manager.windowManager,param1.manager.assets);
      }
      
      public function loadAvatarData(param1:String, param2:String) : void
      {
         this._data = new Dictionary();
         this._colors = new Dictionary();
         this.var_975 = param2;
         this.parseFigureString(param1);
         this.updateView();
      }
      
      public function dispose() : void
      {
         this.var_1548 = null;
         this._view = null;
         this._data = null;
         this._colors = null;
         this.var_1164 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1164;
      }
      
      private function parseFigureString(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1.split("."))
         {
            _loc3_ = _loc2_.split("-");
            if(_loc3_.length > 0)
            {
               _loc4_ = String(_loc3_[0]);
               _loc5_ = parseInt(_loc3_[1]);
               _loc6_ = new Array();
               _loc7_ = 2;
               while(_loc7_ < _loc3_.length)
               {
                  _loc6_.push(_loc3_[_loc7_]);
                  _loc7_++;
               }
               if(_loc6_.length == 0)
               {
                  _loc6_.push(0);
               }
               this.savePartSetId(_loc4_,_loc5_,false);
               this.savePartSetColourId(_loc4_,_loc6_,false);
            }
         }
      }
      
      public function getPartSetId(param1:String) : int
      {
         if(this._data[param1] != null)
         {
            return this._data[param1];
         }
         return -1;
      }
      
      public function getColourIds(param1:String) : Array
      {
         if(this._colors[param1] != null)
         {
            return this._colors[param1];
         }
         return [this.var_1548.getDefaultColour(param1)];
      }
      
      public function getFigureString() : String
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc1_:* = "";
         var _loc2_:* = [];
         for(_loc3_ in this._data)
         {
            if(this._data[_loc3_] != null)
            {
               _loc5_ = this._data[_loc3_];
               _loc6_ = this._colors[_loc3_] as Array;
               _loc7_ = _loc3_ + "-" + _loc5_;
               if(_loc6_)
               {
                  _loc8_ = 0;
                  while(_loc8_ < _loc6_.length)
                  {
                     _loc7_ += "-" + _loc6_[_loc8_];
                     _loc8_++;
                  }
               }
               _loc2_.push(_loc7_);
            }
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc1_ += _loc2_[_loc4_];
            if(_loc4_ < _loc2_.length - 1)
            {
               _loc1_ += ".";
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function savePartData(param1:String, param2:int, param3:Array, param4:Boolean = false) : void
      {
         this.savePartSetId(param1,param2,param4);
         this.savePartSetColourId(param1,param3,param4);
      }
      
      private function savePartSetId(param1:String, param2:int, param3:Boolean = true) : void
      {
         switch(param1)
         {
            case const_89:
            case const_222:
            case const_283:
            case const_251:
            case const_292:
            case const_253:
            case const_205:
            case const_280:
            case const_290:
            case CHEST_PRINTS:
            case const_227:
            case const_312:
            case const_286:
               if(param2 >= 0)
               {
                  this._data[param1] = param2;
               }
               else
               {
                  delete this._data[param1];
               }
               break;
            default:
               Logger.log("[FigureData] Unknown partset: " + param1 + ", can not store id: " + param2);
         }
         if(param3)
         {
            this.updateView();
         }
      }
      
      public function savePartSetColourId(param1:String, param2:Array, param3:Boolean = true) : void
      {
         switch(param1)
         {
            case const_89:
            case const_222:
            case const_283:
            case const_251:
            case const_292:
            case const_253:
            case const_205:
            case const_280:
            case const_290:
            case CHEST_PRINTS:
            case const_227:
            case const_312:
            case const_286:
               this._colors[param1] = param2;
               break;
            default:
               Logger.log("[FigureData] Unknown partset: " + param1 + ", can not store color-ids");
         }
         if(param3)
         {
            this.updateView();
         }
      }
      
      public function getFigureStringWithFace(param1:int) : String
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc2_:* = [];
         _loc2_.push(const_89);
         var _loc3_:* = "";
         var _loc4_:* = [];
         for each(_loc5_ in _loc2_)
         {
            if(this._colors[_loc5_] != null)
            {
               _loc7_ = this._data[_loc5_];
               _loc8_ = this._colors[_loc5_] as Array;
               if(_loc5_ == const_89)
               {
                  _loc7_ = param1;
               }
               _loc9_ = _loc5_ + "-" + _loc7_;
               if(_loc7_ >= 0)
               {
                  _loc10_ = 0;
                  while(_loc10_ < _loc8_.length)
                  {
                     _loc9_ += "-" + _loc8_[_loc10_];
                     _loc10_++;
                  }
               }
               _loc4_.push(_loc9_);
            }
         }
         _loc6_ = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc3_ += _loc4_[_loc6_];
            if(_loc6_ < _loc4_.length - 1)
            {
               _loc3_ += ".";
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      public function updateView() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:String = this.getFigureString();
         var _loc2_:IAvatarImage = this.var_1548.manager.avatarRenderManager.createAvatarImage(_loc1_,AvatarScaleType.const_62,this.gender,this);
         if(_loc2_)
         {
            _loc2_.setDirection(AvatarSetType.const_42,int(const_978));
            _loc3_ = _loc2_.getImage(AvatarSetType.const_42,true);
            this._view.udpate(_loc3_);
            _loc2_.dispose();
         }
         else
         {
            Logger.log("Unable to create avatar image for the preview in avatar editor!");
            _loc4_ = new BitmapData(1,1);
            this._view.udpate(_loc4_);
         }
      }
      
      public function get view() : FigureDataView
      {
         return this._view;
      }
      
      public function get gender() : String
      {
         return this.var_975;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.updateView();
      }
   }
}
