package com.sulake.habbo.communication.messages.parser.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementData;
   
   public class AchievementMessageParser implements IMessageParser
   {
       
      
      private var var_77:AchievementData;
      
      public function AchievementMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_77 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_77 = new AchievementData(param1);
         return true;
      }
      
      public function get achievement() : AchievementData
      {
         return this.var_77;
      }
   }
}
