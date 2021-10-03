package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      public static const const_2220:int = 16777215;
      
      public static const const_1212:int = 8191;
      
      public static const const_1278:int = 8191;
      
      public static const const_2363:int = 1;
      
      public static const const_1213:int = 1;
      
      public static const const_1425:int = 1;
      
      private static var var_552:uint = 0;
      
      private static var var_551:uint = 0;
       
      
      private var _owner:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         if(param2 > const_1212)
         {
            param2 = const_1212;
         }
         else if(param2 < const_1213)
         {
            param2 = const_1213;
         }
         if(param3 > const_1278)
         {
            param3 = const_1278;
         }
         else if(param3 < const_1425)
         {
            param3 = const_1425;
         }
         super(param2,param3,param4,param5);
         ++var_552;
         var_551 += param2 * param3 * 4;
         this._owner = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_552;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_551;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_551 -= width * height * 4;
            --var_552;
            this._disposed = true;
            this._owner = null;
            super.dispose();
         }
      }
   }
}
