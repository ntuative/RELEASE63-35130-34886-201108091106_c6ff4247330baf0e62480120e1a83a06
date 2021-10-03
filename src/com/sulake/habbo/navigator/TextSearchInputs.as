package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.navigator.domain.Tabs;
   
   public class TextSearchInputs
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_938:TextFieldManager;
      
      public function TextSearchInputs(param1:HabboNavigator, param2:IWindowContainer)
      {
         super();
         this._navigator = param1;
         var _loc3_:ITextFieldWindow = ITextFieldWindow(param2.findChildByName("search_str"));
         this.var_938 = new TextFieldManager(this._navigator,_loc3_,35,this.searchRooms,this._navigator.getText("navigator.search.info"));
         Util.setProc(param2,"search_but",this.onSearchButtonClick);
      }
      
      public function dispose() : void
      {
         if(this.var_938)
         {
            this.var_938.dispose();
            this.var_938 = null;
         }
         this._navigator = null;
      }
      
      private function onSearchButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.searchRooms();
      }
      
      private function searchRooms() : void
      {
         var _loc1_:String = this.var_938.getText();
         if(_loc1_ == "")
         {
            return;
         }
         this._navigator.mainViewCtrl.startSearch(Tabs.const_271,Tabs.const_466,_loc1_);
         this._navigator.trackNavigationDataPoint("Search","search",_loc1_);
      }
      
      public function get searchStr() : TextFieldManager
      {
         return this.var_938;
      }
   }
}
