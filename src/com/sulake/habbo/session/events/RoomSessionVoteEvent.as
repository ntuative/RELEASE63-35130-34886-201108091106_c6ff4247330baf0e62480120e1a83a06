package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_147:String = "RSPE_VOTE_QUESTION";
      
      public static const const_172:String = "RSPE_VOTE_RESULT";
       
      
      private var var_1376:String = "";
      
      private var var_1648:Array;
      
      private var var_1219:Array;
      
      private var var_2123:int = 0;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         this.var_1648 = [];
         this.var_1219 = [];
         super(param1,param2,param7,param8);
         this.var_1376 = param3;
         this.var_1648 = param4;
         this.var_1219 = param5;
         if(this.var_1219 == null)
         {
            this.var_1219 = [];
         }
         this.var_2123 = param6;
      }
      
      public function get question() : String
      {
         return this.var_1376;
      }
      
      public function get choices() : Array
      {
         return this.var_1648.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1219.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_2123;
      }
   }
}
