package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_2304:int = 0;
      
      public static const const_1782:int = 1;
      
      public static const const_1818:int = 2;
      
      public static const const_2323:int = 3;
      
      public static const const_2199:int = 4;
      
      public static const const_2277:int = 5;
      
      public static const const_1898:int = 10;
      
      public static const const_2252:int = 11;
      
      public static const const_2264:int = 12;
      
      public static const const_2214:int = 13;
      
      public static const const_2319:int = 16;
      
      public static const const_2299:int = 17;
      
      public static const const_2206:int = 18;
      
      public static const const_2193:int = 19;
      
      public static const const_2230:int = 20;
      
      public static const const_2362:int = 22;
      
      public static const const_2226:int = 23;
      
      public static const const_2174:int = 24;
      
      public static const const_2358:int = 25;
      
      public static const const_2176:int = 26;
      
      public static const const_2186:int = 27;
      
      public static const const_2286:int = 28;
      
      public static const const_2218:int = 29;
      
      public static const const_2376:int = 100;
      
      public static const const_2335:int = 101;
      
      public static const const_2225:int = 102;
      
      public static const const_2374:int = 103;
      
      public static const const_2289:int = 104;
      
      public static const const_2373:int = 105;
      
      public static const const_2173:int = 106;
      
      public static const const_2274:int = 107;
      
      public static const const_2272:int = 108;
      
      public static const const_2370:int = 109;
      
      public static const const_2240:int = 110;
      
      public static const const_2244:int = 111;
      
      public static const const_2308:int = 112;
      
      public static const const_2317:int = 113;
      
      public static const const_2291:int = 114;
      
      public static const const_2322:int = 115;
      
      public static const const_2217:int = 116;
      
      public static const const_2192:int = 117;
      
      public static const const_2360:int = 118;
      
      public static const const_2245:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_9 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1782:
            case const_1898:
               return "banned";
            case const_1818:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
