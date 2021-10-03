package com.sulake.habbo.sound.trax
{
   import com.sulake.core.runtime.IDisposable;
   import flash.utils.ByteArray;
   
   public class TraxSample implements IDisposable
   {
      
      public static const const_1935:String = "sample_44khz";
      
      public static const const_1974:String = "sample_22khz";
      
      public static const const_1959:String = "sample_11khz";
      
      public static const const_1880:String = "sample_16bit";
      
      public static const const_1834:String = "sample_8bit";
      
      public static const SAMPLE_VALUE_MULTIPLIER:Number = 0.000030517578125;
      
      private static const const_1153:int = 32;
      
      private static const const_79:int = 255;
      
      private static const const_204:int = 65535;
      
      private static const const_80:int = 127;
      
      private static const const_203:int = 32767;
       
      
      private var _disposed:Boolean = false;
      
      private var var_142:Vector.<int> = null;
      
      private var _id:int;
      
      private var var_183:int = 2;
      
      private var var_90:int = 1;
      
      private var var_718:Array;
      
      private var var_2869:uint;
      
      public function TraxSample(param1:ByteArray, param2:int, param3:String = "sample_44khz", param4:String = "sample_16bit")
      {
         var _loc12_:Number = NaN;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         this.var_718 = [];
         super();
         this._id = param2;
         var _loc5_:int = 65536;
         switch(param3)
         {
            case const_1974:
               this.var_90 = 2;
               break;
            case const_1959:
               this.var_90 = 4;
               break;
            default:
               this.var_90 = 1;
         }
         switch(param4)
         {
            case const_1834:
               this.var_183 = 4;
               _loc5_ = 256;
               break;
            default:
               this.var_183 = 2;
               _loc5_ = 65536;
         }
         var _loc6_:int = this.var_183 * this.var_90;
         var _loc7_:int = param1.length / 8;
         _loc7_ = int(_loc7_ / _loc6_) * _loc6_;
         this.var_142 = new Vector.<int>(_loc7_ / _loc6_,true);
         var _loc8_:Number = 1 / (Number(_loc5_) / 2);
         param1.position = 0;
         var _loc9_:int = 0;
         var _loc10_:int = _loc7_ / this.var_90;
         var _loc11_:int = 0;
         while(_loc11_ < _loc10_)
         {
            _loc12_ = param1.readFloat();
            param1.readFloat();
            _loc13_ = 2;
            while(_loc13_ <= this.var_90)
            {
               _loc15_ = param1.readFloat();
               param1.readFloat();
               _loc16_ = Number(_loc13_);
               _loc12_ = _loc12_ * (_loc16_ - 1) / _loc16_ + Number(_loc15_) / _loc16_;
               _loc13_++;
            }
            if(_loc11_ >= _loc10_ - 1 - const_1153)
            {
               _loc12_ *= (_loc10_ - _loc11_ - 1) / Number(const_1153);
            }
            _loc14_ = (_loc12_ + 1) / _loc8_;
            if(_loc14_ < 0)
            {
               _loc14_ = 0;
            }
            else if(_loc14_ >= _loc5_)
            {
               _loc14_ = _loc5_ - 1;
            }
            _loc9_ *= _loc5_;
            _loc9_ += _loc14_;
            if(_loc11_ % this.var_183 == this.var_183 - 1)
            {
               this.var_142[int(_loc11_ / this.var_183)] = _loc9_;
               _loc9_ = 0;
            }
            _loc11_++;
         }
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get length() : uint
      {
         return this.var_142.length * this.var_183 * this.var_90;
      }
      
      public function get usageCount() : int
      {
         return this.var_718.length;
      }
      
      public function get usageTimeStamp() : int
      {
         return this.var_2869;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_142 = null;
            this.var_718 = null;
         }
      }
      
      public function setSample(param1:Vector.<int>, param2:int, param3:int, param4:int) : int
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = 0;
         if(param1 == null || this.var_142 == null)
         {
            return param4;
         }
         var _loc5_:int = this.var_183 * this.var_90;
         param4 /= _loc5_;
         if(param2 < 0)
         {
            param3 += param2;
            param2 = 0;
         }
         if(param3 > param1.length - param2)
         {
            param3 = param1.length - param2;
         }
         var _loc6_:int = param3 / _loc5_;
         var _loc7_:int = 0;
         if(_loc6_ > this.var_142.length - param4)
         {
            _loc7_ = (_loc6_ - (this.var_142.length - param4)) * _loc5_;
            _loc6_ = this.var_142.length - param4;
            if(_loc7_ > param1.length - param2)
            {
               _loc7_ = param1.length - param2;
            }
         }
         if(this.var_90 == 1)
         {
            if(this.var_183 == 2)
            {
               while(_loc6_-- > 0)
               {
                  _loc8_ = this.var_142[param4++];
                  var _loc11_:*;
                  param1[_loc11_ = param2++] = (_loc8_ >> 16 & const_204) - const_203;
                  var _loc12_:*;
                  param1[_loc12_ = param2++] = (_loc8_ & const_204) - const_203;
               }
            }
            else if(this.var_183 == 4)
            {
               while(_loc6_-- > 0)
               {
                  _loc8_ = this.var_142[param4++];
                  param1[_loc11_ = param2++] = (_loc8_ >> 24 & const_79) - const_80 << 8;
                  param1[_loc12_ = param2++] = (_loc8_ >> 16 & const_79) - const_80 << 8;
                  var _loc13_:*;
                  param1[_loc13_ = param2++] = (_loc8_ >> 8 & const_79) - const_80 << 8;
                  var _loc14_:*;
                  param1[_loc14_ = param2++] = (_loc8_ & const_79) - const_80 << 8;
               }
            }
         }
         else if(this.var_90 >= 2)
         {
            _loc9_ = 0;
            _loc10_ = 0;
            if(this.var_183 == 2)
            {
               while(_loc6_-- > 0)
               {
                  _loc8_ = this.var_142[param4++];
                  _loc10_ = int((_loc8_ >> 16 & const_204) - const_203);
                  _loc9_ = this.var_90;
                  while(_loc9_ > 0)
                  {
                     param1[_loc11_ = param2++] = _loc10_;
                     _loc9_--;
                  }
                  _loc10_ = int((_loc8_ & const_204) - const_203);
                  _loc9_ = this.var_90;
                  while(_loc9_ > 0)
                  {
                     param1[_loc11_ = param2++] = _loc10_;
                     _loc9_--;
                  }
               }
            }
            else if(this.var_183 == 4)
            {
               while(_loc6_-- > 0)
               {
                  _loc8_ = this.var_142[param4++];
                  _loc10_ = (_loc8_ >> 24 & const_79) - const_80 << 8;
                  _loc9_ = this.var_90;
                  while(_loc9_ > 0)
                  {
                     param1[_loc11_ = param2++] = _loc10_;
                     _loc9_--;
                  }
                  _loc10_ = (_loc8_ >> 16 & const_79) - const_80 << 8;
                  _loc9_ = this.var_90;
                  while(_loc9_ > 0)
                  {
                     param1[_loc11_ = param2++] = _loc10_;
                     _loc9_--;
                  }
                  _loc10_ = (_loc8_ >> 8 & const_79) - const_80 << 8;
                  _loc9_ = this.var_90;
                  while(_loc9_ > 0)
                  {
                     param1[_loc11_ = param2++] = _loc10_;
                     _loc9_--;
                  }
                  _loc10_ = (_loc8_ & const_79) - const_80 << 8;
                  _loc9_ = this.var_90;
                  while(_loc9_ > 0)
                  {
                     param1[_loc11_ = param2++] = _loc10_;
                     _loc9_--;
                  }
               }
            }
         }
         while(_loc7_-- > 0)
         {
            param1[_loc11_ = param2++] = 0;
         }
         return param4 * _loc5_;
      }
      
      public function addSample(param1:Vector.<int>, param2:int, param3:int, param4:int) : int
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = 0;
         if(param1 == null || this.var_142 == null)
         {
            return param4;
         }
         var _loc5_:int = this.var_183 * this.var_90;
         param4 /= _loc5_;
         if(param2 < 0)
         {
            param3 += param2;
            param2 = 0;
         }
         if(param3 > param1.length - param2)
         {
            param3 = param1.length - param2;
         }
         var _loc6_:int = param3 / _loc5_;
         if(_loc6_ > this.var_142.length - param4)
         {
            _loc6_ = this.var_142.length - param4;
         }
         if(this.var_90 == 1)
         {
            if(this.var_183 == 2)
            {
               while(_loc6_-- > 0)
               {
                  _loc7_ = this.var_142[param4++];
                  var _loc10_:*;
                  param1[_loc10_ = param2++] = param1[_loc10_] + ((_loc7_ >> 16 & const_204) - const_203);
                  var _loc11_:*;
                  param1[_loc11_ = param2++] = param1[_loc11_] + ((_loc7_ & const_204) - const_203);
               }
            }
            else if(this.var_183 == 4)
            {
               while(_loc6_-- > 0)
               {
                  _loc7_ = this.var_142[param4++];
                  param1[_loc10_ = param2++] = param1[_loc10_] + ((_loc7_ >> 24 & const_79) - const_80 << 8);
                  param1[_loc11_ = param2++] = param1[_loc11_] + ((_loc7_ >> 16 & const_79) - const_80 << 8);
                  var _loc12_:*;
                  param1[_loc12_ = param2++] = param1[_loc12_] + ((_loc7_ >> 8 & const_79) - const_80 << 8);
                  var _loc13_:*;
                  param1[_loc13_ = param2++] = param1[_loc13_] + ((_loc7_ & const_79) - const_80 << 8);
               }
            }
         }
         else if(this.var_90 >= 2)
         {
            _loc8_ = 0;
            _loc9_ = 0;
            if(this.var_183 == 2)
            {
               while(_loc6_-- > 0)
               {
                  _loc7_ = this.var_142[param4++];
                  _loc9_ = int((_loc7_ >> 16 & const_204) - const_203);
                  _loc8_ = this.var_90;
                  while(_loc8_ > 0)
                  {
                     param1[_loc10_ = param2++] = param1[_loc10_] + _loc9_;
                     _loc8_--;
                  }
                  _loc9_ = int((_loc7_ & const_204) - const_203);
                  _loc8_ = this.var_90;
                  while(_loc8_ > 0)
                  {
                     param1[_loc10_ = param2++] = param1[_loc10_] + _loc9_;
                     _loc8_--;
                  }
               }
            }
            else if(this.var_183 == 4)
            {
               while(_loc6_-- > 0)
               {
                  _loc7_ = this.var_142[param4++];
                  _loc9_ = (_loc7_ >> 24 & const_79) - const_80 << 8;
                  _loc8_ = this.var_90;
                  while(_loc8_ > 0)
                  {
                     param1[_loc10_ = param2++] = param1[_loc10_] + _loc9_;
                     _loc8_--;
                  }
                  _loc9_ = (_loc7_ >> 16 & const_79) - const_80 << 8;
                  _loc8_ = this.var_90;
                  while(_loc8_ > 0)
                  {
                     param1[_loc10_ = param2++] = param1[_loc10_] + _loc9_;
                     _loc8_--;
                  }
                  _loc9_ = (_loc7_ >> 8 & const_79) - const_80 << 8;
                  _loc8_ = this.var_90;
                  while(_loc8_ > 0)
                  {
                     param1[_loc10_ = param2++] = param1[_loc10_] + _loc9_;
                     _loc8_--;
                  }
                  _loc9_ = (_loc7_ & const_79) - const_80 << 8;
                  _loc8_ = this.var_90;
                  while(_loc8_ > 0)
                  {
                     param1[_loc10_ = param2++] = param1[_loc10_] + _loc9_;
                     _loc8_--;
                  }
               }
            }
         }
         return param4 * _loc5_;
      }
      
      public function setUsageFromSong(param1:int, param2:uint) : void
      {
         if(this.var_718 == null)
         {
            return;
         }
         if(this.var_718.indexOf(param1) == -1)
         {
            this.var_718.push(param1);
         }
         this.var_2869 = param2;
      }
      
      public function isUsedFromSong(param1:int) : Boolean
      {
         if(this.var_718 == null)
         {
            return false;
         }
         return this.var_718.indexOf(param1) != -1;
      }
   }
}
