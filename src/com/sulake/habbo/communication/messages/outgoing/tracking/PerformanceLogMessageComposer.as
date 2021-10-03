package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2528:int = 0;
      
      private var var_1711:String = "";
      
      private var var_2208:String = "";
      
      private var var_2677:String = "";
      
      private var var_2676:String = "";
      
      private var var_1969:int = 0;
      
      private var var_2678:int = 0;
      
      private var var_2679:int = 0;
      
      private var var_1710:int = 0;
      
      private var var_2680:int = 0;
      
      private var var_1709:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2528 = param1;
         this.var_1711 = param2;
         this.var_2208 = param3;
         this.var_2677 = param4;
         this.var_2676 = param5;
         if(param6)
         {
            this.var_1969 = 1;
         }
         else
         {
            this.var_1969 = 0;
         }
         this.var_2678 = param7;
         this.var_2679 = param8;
         this.var_1710 = param9;
         this.var_2680 = param10;
         this.var_1709 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2528,this.var_1711,this.var_2208,this.var_2677,this.var_2676,this.var_1969,this.var_2678,this.var_2679,this.var_1710,this.var_2680,this.var_1709];
      }
   }
}
