package com.sulake.habbo.help
{
   public class WelcomeNotification
   {
       
      
      private var var_2697:String;
      
      private var var_339:String;
      
      public function WelcomeNotification(param1:String, param2:String)
      {
         super();
         this.var_2697 = param1;
         this.var_339 = param2;
      }
      
      public function get method_13() : String
      {
         return this.var_2697;
      }
      
      public function get localizationKey() : String
      {
         return this.var_339;
      }
   }
}
