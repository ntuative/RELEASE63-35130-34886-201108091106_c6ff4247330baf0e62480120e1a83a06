package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_365:int = 1;
      
      public static const const_236:int = 2;
      
      public static const const_262:int = 3;
      
      public static const const_355:int = 4;
      
      public static const const_271:int = 5;
      
      public static const const_457:int = 1;
      
      public static const const_861:int = 2;
      
      public static const const_919:int = 3;
      
      public static const const_825:int = 4;
      
      public static const const_257:int = 5;
      
      public static const const_1005:int = 6;
      
      public static const const_974:int = 7;
      
      public static const const_466:int = 8;
      
      public static const const_579:int = 9;
      
      public static const const_2177:int = 10;
      
      public static const const_1017:int = 11;
      
      public static const const_597:int = 12;
       
      
      private var var_505:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_505 = new Array();
         this.var_505.push(new Tab(this._navigator,const_365,const_597,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_603));
         this.var_505.push(new Tab(this._navigator,const_236,const_457,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_603));
         this.var_505.push(new Tab(this._navigator,const_355,const_1017,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1375));
         this.var_505.push(new Tab(this._navigator,const_262,const_257,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_603));
         this.var_505.push(new Tab(this._navigator,const_271,const_466,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_1295));
         this.setSelectedTab(const_365);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_355;
      }
      
      public function get tabs() : Array
      {
         return this.var_505;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_505)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_505)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_505)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
