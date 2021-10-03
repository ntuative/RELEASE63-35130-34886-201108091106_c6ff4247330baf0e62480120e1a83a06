package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.recycler.RecyclerFinishedMessageParser;
   
   public class RecyclerFinishedMessageEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1404:int = 1;
      
      public static const const_1942:int = 2;
       
      
      public function RecyclerFinishedMessageEvent(param1:Function)
      {
         super(param1,RecyclerFinishedMessageParser);
      }
      
      public function getParser() : RecyclerFinishedMessageParser
      {
         return var_9 as RecyclerFinishedMessageParser;
      }
   }
}
