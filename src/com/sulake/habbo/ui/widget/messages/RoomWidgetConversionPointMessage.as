package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetConversionPointMessage extends RoomWidgetMessage
   {
      
      public static const const_810:String = "RWCPM_CONVERSION_POINT";
       
      
      private var _category:String;
      
      private var var_2896:String;
      
      private var _action:String;
      
      private var var_2897:String;
      
      private var var_2898:int;
      
      public function RoomWidgetConversionPointMessage(param1:String, param2:String, param3:String, param4:String, param5:String = "", param6:int = 0)
      {
         super(param1);
         this._category = param2;
         this.var_2896 = param3;
         this._action = param4;
         this.var_2897 = !!param5 ? param5 : "";
         this.var_2898 = !!param6 ? int(param6) : 0;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get pointType() : String
      {
         return this.var_2896;
      }
      
      public function get action() : String
      {
         return this._action;
      }
      
      public function get extraString() : String
      {
         return this.var_2897;
      }
      
      public function get extraInt() : int
      {
         return this.var_2898;
      }
   }
}
