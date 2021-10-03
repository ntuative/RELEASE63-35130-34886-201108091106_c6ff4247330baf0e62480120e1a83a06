package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_234:int;
      
      private var var_2333:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_234 = param1;
         this.var_2333 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_234,this.var_2333];
      }
      
      public function dispose() : void
      {
      }
   }
}
