package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1453:IHabboTracking;
      
      private var var_2061:Boolean = false;
      
      private var var_2577:int = 0;
      
      private var var_1908:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1453 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1453 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2061 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2577 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_2061)
         {
            return;
         }
         ++this.var_1908;
         if(this.var_1908 <= this.var_2577)
         {
            this.var_1453.trackGoogle("toolbar",param1);
         }
      }
   }
}
