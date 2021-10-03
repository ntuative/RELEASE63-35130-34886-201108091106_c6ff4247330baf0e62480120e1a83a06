package com.sulake.habbo.communication.messages.outgoing.friendlist
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class GetEventStreamComposer implements IMessageComposer
   {
      
      public static const const_1913:int = 0;
      
      public static const const_1946:int = 1;
       
      
      private var var_20:int;
      
      public function GetEventStreamComposer(param1:int = 0)
      {
         super();
         this.var_20 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_20];
      }
   }
}
