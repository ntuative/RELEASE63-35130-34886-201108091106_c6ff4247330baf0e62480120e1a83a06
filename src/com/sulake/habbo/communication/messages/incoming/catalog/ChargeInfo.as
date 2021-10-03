package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2830:int;
      
      private var var_2947:int;
      
      private var var_1389:int;
      
      private var var_1388:int;
      
      private var var_2186:int;
      
      private var var_2948:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2830 = param1.readInteger();
         this.var_2947 = param1.readInteger();
         this.var_1389 = param1.readInteger();
         this.var_1388 = param1.readInteger();
         this.var_2186 = param1.readInteger();
         this.var_2948 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2830;
      }
      
      public function get charges() : int
      {
         return this.var_2947;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1389;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1388;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2948;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2186;
      }
   }
}
