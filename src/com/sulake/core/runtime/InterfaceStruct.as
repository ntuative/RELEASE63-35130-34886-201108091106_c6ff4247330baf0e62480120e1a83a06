package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1701:IID;
      
      private var var_2201:String;
      
      private var var_121:IUnknown;
      
      private var var_923:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1701 = param1;
         this.var_2201 = getQualifiedClassName(this.var_1701);
         this.var_121 = param2;
         this.var_923 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1701;
      }
      
      public function get iis() : String
      {
         return this.var_2201;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_121;
      }
      
      public function get references() : uint
      {
         return this.var_923;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_121 == null;
      }
      
      public function dispose() : void
      {
         this.var_1701 = null;
         this.var_2201 = null;
         this.var_121 = null;
         this.var_923 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_923;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_923) : uint(0);
      }
   }
}
