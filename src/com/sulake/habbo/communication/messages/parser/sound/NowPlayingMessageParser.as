package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1884:int;
      
      private var _currentPosition:int;
      
      private var var_1886:int;
      
      private var var_1885:int;
      
      private var var_1887:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1884;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1886;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1885;
      }
      
      public function get syncCount() : int
      {
         return this.var_1887;
      }
      
      public function flush() : Boolean
      {
         this.var_1884 = -1;
         this._currentPosition = -1;
         this.var_1886 = -1;
         this.var_1885 = -1;
         this.var_1887 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1884 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1886 = param1.readInteger();
         this.var_1885 = param1.readInteger();
         this.var_1887 = param1.readInteger();
         return true;
      }
   }
}
