package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_2026:String = "WE_DESTROY";
      
      public static const const_370:String = "WE_DESTROYED";
      
      public static const const_1856:String = "WE_OPEN";
      
      public static const const_1802:String = "WE_OPENED";
      
      public static const const_1840:String = "WE_CLOSE";
      
      public static const const_1931:String = "WE_CLOSED";
      
      public static const const_1808:String = "WE_FOCUS";
      
      public static const const_360:String = "WE_FOCUSED";
      
      public static const const_2015:String = "WE_UNFOCUS";
      
      public static const const_1995:String = "WE_UNFOCUSED";
      
      public static const const_1953:String = "WE_ACTIVATE";
      
      public static const const_667:String = "WE_ACTIVATED";
      
      public static const const_1843:String = "WE_DEACTIVATE";
      
      public static const const_681:String = "WE_DEACTIVATED";
      
      public static const const_364:String = "WE_SELECT";
      
      public static const const_47:String = "WE_SELECTED";
      
      public static const const_585:String = "WE_UNSELECT";
      
      public static const const_651:String = "WE_UNSELECTED";
      
      public static const const_2027:String = "WE_LOCK";
      
      public static const const_1936:String = "WE_LOCKED";
      
      public static const const_2018:String = "WE_UNLOCK";
      
      public static const const_1917:String = "WE_UNLOCKED";
      
      public static const const_1001:String = "WE_ENABLE";
      
      public static const const_212:String = "WE_ENABLED";
      
      public static const const_864:String = "WE_DISABLE";
      
      public static const const_232:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_428:String = "WE_RELOCATED";
      
      public static const const_1208:String = "WE_RESIZE";
      
      public static const const_40:String = "WE_RESIZED";
      
      public static const const_1994:String = "WE_MINIMIZE";
      
      public static const const_2050:String = "WE_MINIMIZED";
      
      public static const const_2008:String = "WE_MAXIMIZE";
      
      public static const const_1813:String = "WE_MAXIMIZED";
      
      public static const const_1951:String = "WE_RESTORE";
      
      public static const const_1937:String = "WE_RESTORED";
      
      public static const const_661:String = "WE_CHILD_ADDED";
      
      public static const const_439:String = "WE_CHILD_REMOVED";
      
      public static const const_210:String = "WE_CHILD_RELOCATED";
      
      public static const const_144:String = "WE_CHILD_RESIZED";
      
      public static const const_357:String = "WE_CHILD_ACTIVATED";
      
      public static const const_507:String = "WE_PARENT_ADDED";
      
      public static const const_1861:String = "WE_PARENT_REMOVED";
      
      public static const const_2012:String = "WE_PARENT_RELOCATED";
      
      public static const const_647:String = "WE_PARENT_RESIZED";
      
      public static const const_1406:String = "WE_PARENT_ACTIVATED";
      
      public static const const_173:String = "WE_OK";
      
      public static const const_526:String = "WE_CANCEL";
      
      public static const const_119:String = "WE_CHANGE";
      
      public static const const_515:String = "WE_SCROLL";
      
      public static const const_116:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_760:IWindow;
      
      protected var var_1165:Boolean;
      
      protected var var_520:Boolean;
      
      protected var var_169:Boolean;
      
      protected var var_761:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_760 = param3;
         _loc5_.var_520 = param4;
         _loc5_.var_169 = false;
         _loc5_.var_761 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_760;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_520;
      }
      
      public function recycle() : void
      {
         if(this.var_169)
         {
            throw new Error("Event already recycled!");
         }
         this.var_760 = null;
         this._window = null;
         this.var_169 = true;
         this.var_1165 = false;
         this.var_761.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1165;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1165 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1165;
      }
      
      public function stopPropagation() : void
      {
         this.var_1165 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1165 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_520 + " window: " + this._window + " }";
      }
   }
}
