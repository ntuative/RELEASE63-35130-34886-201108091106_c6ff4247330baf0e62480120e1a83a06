package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1106:int = 20;
      
      private static const const_735:int = 9;
      
      private static const const_1590:int = -1;
       
      
      private var var_346:Array;
      
      private var var_809:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_346 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_809)
            {
               this.var_809 = true;
               this.var_346 = new Array();
               this.var_346.push(const_1590);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_809)
            {
               this.var_809 = false;
               this.var_346 = new Array();
               this.var_346.push(const_1106);
               this.var_346.push(const_735 + param1);
               this.var_346.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(0))
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
