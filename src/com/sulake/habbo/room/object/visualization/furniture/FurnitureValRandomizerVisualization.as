package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1106:int = 20;
      
      private static const const_735:int = 10;
      
      private static const const_1591:int = 31;
      
      private static const const_1590:int = 32;
      
      private static const const_734:int = 30;
       
      
      private var var_346:Array;
      
      private var var_809:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_346 = new Array();
         super();
         super.setAnimation(const_734);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_809)
            {
               this.var_809 = true;
               this.var_346 = new Array();
               this.var_346.push(const_1591);
               this.var_346.push(const_1590);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_735)
         {
            if(this.var_809)
            {
               this.var_809 = false;
               this.var_346 = new Array();
               if(direction == 2)
               {
                  this.var_346.push(const_1106 + 5 - param1);
                  this.var_346.push(const_735 + 5 - param1);
               }
               else
               {
                  this.var_346.push(const_1106 + param1);
                  this.var_346.push(const_735 + param1);
               }
               this.var_346.push(const_734);
               return;
            }
            super.setAnimation(const_734);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
         {
            if(this.var_346.length > 0)
            {
               super.setAnimation(this.var_346.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
