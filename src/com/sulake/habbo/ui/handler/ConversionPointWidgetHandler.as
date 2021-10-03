package com.sulake.habbo.ui.handler
{
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetConversionPointMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import flash.events.Event;
   
   public class ConversionPointWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var var_1164:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      public function ConversionPointWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1164;
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_136;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
      }
      
      public function dispose() : void
      {
         this.var_1164 = true;
         this._container = null;
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetConversionPointMessage.const_810];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         switch(param1.type)
         {
            case RoomWidgetConversionPointMessage.const_810:
               _loc2_ = param1 as RoomWidgetConversionPointMessage;
               if(_loc2_ == null)
               {
                  return null;
               }
               this._container.roomSession.sendConversionPoint(_loc2_.category,_loc2_.pointType,_loc2_.action,_loc2_.extraString,_loc2_.extraInt);
               break;
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function update() : void
      {
      }
   }
}
