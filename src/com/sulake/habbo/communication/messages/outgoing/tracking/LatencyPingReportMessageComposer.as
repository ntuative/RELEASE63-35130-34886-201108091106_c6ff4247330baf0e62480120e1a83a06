package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_3049:int;
      
      private var var_3050:int;
      
      private var var_3051:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_3049 = param1;
         this.var_3050 = param2;
         this.var_3051 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_3049,this.var_3050,this.var_3051];
      }
      
      public function dispose() : void
      {
      }
   }
}
