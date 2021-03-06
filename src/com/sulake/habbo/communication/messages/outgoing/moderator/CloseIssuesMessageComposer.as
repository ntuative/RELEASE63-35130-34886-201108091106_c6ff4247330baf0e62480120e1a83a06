package com.sulake.habbo.communication.messages.outgoing.moderator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class CloseIssuesMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_34:Array;
      
      public function CloseIssuesMessageComposer(param1:Array, param2:int)
      {
         this.var_34 = new Array();
         super();
         this.var_34.push(param2);
         this.var_34.push(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            this.var_34.push(param1[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getMessageArray() : Array
      {
         return this.var_34;
      }
      
      public function dispose() : void
      {
         this.var_34 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
