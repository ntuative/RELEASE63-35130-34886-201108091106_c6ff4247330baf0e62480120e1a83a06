package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenPetPackageMessage extends RoomWidgetMessage
   {
      
      public static const const_955:String = "RWOPPM_OPEN_PET_PACKAGE";
       
      
      private var var_234:int;
      
      private var _name:String;
      
      public function RoomWidgetOpenPetPackageMessage(param1:String, param2:int, param3:String)
      {
         super(param1);
         this.var_234 = param2;
         this._name = param3;
      }
      
      public function get objectId() : int
      {
         return this.var_234;
      }
      
      public function get name() : String
      {
         return this._name;
      }
   }
}
