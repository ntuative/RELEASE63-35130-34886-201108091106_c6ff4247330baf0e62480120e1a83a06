package com.sulake.habbo.communication.encryption
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.communication.handshake.IKeyExchange;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1152:BigInteger;
      
      private var var_2642:BigInteger;
      
      private var var_2144:BigInteger;
      
      private var var_2920:BigInteger;
      
      private var var_1660:BigInteger;
      
      private var var_2143:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1660 = param1;
         this.var_2143 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1660.toString() + ",generator: " + this.var_2143.toString() + ",secret: " + param1);
         this.var_1152 = new BigInteger();
         this.var_1152.fromRadix(param1,param2);
         this.var_2642 = this.var_2143.modPow(this.var_1152,this.var_1660);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_2144 = new BigInteger();
         this.var_2144.fromRadix(param1,param2);
         this.var_2920 = this.var_2144.modPow(this.var_1152,this.var_1660);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2642.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2920.toRadix(param1);
      }
   }
}
