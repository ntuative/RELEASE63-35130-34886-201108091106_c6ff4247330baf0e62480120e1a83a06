package com.sulake.habbo.avatar.structure
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.animation.AnimationAction;
   import flash.utils.Dictionary;
   
   public class AnimationData implements IStructureData
   {
       
      
      private var var_361:Dictionary;
      
      public function AnimationData()
      {
         super();
         this.var_361 = new Dictionary();
      }
      
      public function parse(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.action)
         {
            this.var_361[String(_loc2_.@id)] = new AnimationAction(_loc2_);
         }
         return true;
      }
      
      public function appendXML(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.action)
         {
            this.var_361[String(_loc2_.@id)] = new AnimationAction(_loc2_);
         }
         return true;
      }
      
      public function getAction(param1:IActionDefinition) : AnimationAction
      {
         return this.var_361[param1.assetPartDefinition];
      }
   }
}
