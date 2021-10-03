package com.sulake.habbo.communication.protocol
{
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.communication.protocol.IProtocolDecoder;
   import com.sulake.core.communication.protocol.IProtocolEncoder;
   import flash.utils.ByteArray;
   
   public class WedgieProtocol implements IProtocol
   {
      
      public static const const_1884:uint = 1;
      
      public static const const_1986:uint = 2;
       
      
      private var var_1523:IProtocolEncoder;
      
      private var var_1240:IProtocolDecoder;
      
      public function WedgieProtocol()
      {
         super();
         this.var_1523 = new WedgieEncoder();
         this.var_1240 = new WedgieDecoder();
      }
      
      public function dispose() : void
      {
         this.var_1523.dispose();
         this.var_1240.dispose();
         this.var_1523 = null;
         this.var_1240 = null;
      }
      
      public function get encoder() : IProtocolEncoder
      {
         return this.var_1523;
      }
      
      public function get decoder() : IProtocolDecoder
      {
         return this.var_1240;
      }
      
      public function getMessages(param1:ByteArray, param2:Array) : uint
      {
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         param1.position = 0;
         var _loc3_:uint = param1.position;
         var _loc4_:ByteArray = new ByteArray();
         while(param1.bytesAvailable)
         {
            _loc5_ = uint(param1.readUnsignedByte());
            if(_loc5_ == const_1884)
            {
               _loc4_.position = 0;
               _loc6_ = this.var_1240.getID(_loc4_);
               param2.push([_loc6_,_loc4_]);
               _loc4_ = new ByteArray();
               _loc3_ = param1.position;
            }
            else
            {
               _loc4_.writeByte(_loc5_);
            }
         }
         return _loc3_;
      }
   }
}
