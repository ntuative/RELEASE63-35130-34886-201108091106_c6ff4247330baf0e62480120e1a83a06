package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetPurchaseOverrideEvent extends Event
   {
       
      
      private var var_314:Function;
      
      public function CatalogWidgetPurchaseOverrideEvent(param1:Function, param2:Boolean = false, param3:Boolean = false)
      {
         super(WidgetEvent.CWE_PURCHASE_OVERRIDE,param2,param3);
         this.var_314 = param1;
      }
      
      public function get callback() : Function
      {
         return this.var_314;
      }
   }
}
