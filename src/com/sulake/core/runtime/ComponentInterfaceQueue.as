package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1877:IID;
      
      private var var_1164:Boolean;
      
      private var var_1241:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1877 = param1;
         this.var_1241 = new Array();
         this.var_1164 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1877;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1164;
      }
      
      public function get receivers() : Array
      {
         return this.var_1241;
      }
      
      public function dispose() : void
      {
         if(!this.var_1164)
         {
            this.var_1164 = true;
            this.var_1877 = null;
            while(this.var_1241.length > 0)
            {
               this.var_1241.pop();
            }
            this.var_1241 = null;
         }
      }
   }
}
