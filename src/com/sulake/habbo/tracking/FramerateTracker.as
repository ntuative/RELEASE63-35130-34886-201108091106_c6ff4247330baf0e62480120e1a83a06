package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1989:int;
      
      private var var_2694:int;
      
      private var var_822:int;
      
      private var var_610:Number;
      
      private var var_2696:Boolean;
      
      private var var_2695:int;
      
      private var var_1990:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_610);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2694 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2695 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2696 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_822;
         if(this.var_822 == 1)
         {
            this.var_610 = param1;
            this.var_1989 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_822);
            this.var_610 = this.var_610 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2696 && param3 - this.var_1989 >= this.var_2694)
         {
            this.var_822 = 0;
            if(this.var_1990 < this.var_2695)
            {
               param2.trackGoogle("performance","averageFramerate",this.frameRate);
               ++this.var_1990;
               this.var_1989 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
