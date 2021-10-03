package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_2090:int;
      
      private var var_2815:String;
      
      private var var_344:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_2090 = param1.readInteger();
         this.var_2815 = param1.readString();
         this.var_344 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_2090;
      }
      
      public function get nodeName() : String
      {
         return this.var_2815;
      }
      
      public function get visible() : Boolean
      {
         return this.var_344;
      }
   }
}
