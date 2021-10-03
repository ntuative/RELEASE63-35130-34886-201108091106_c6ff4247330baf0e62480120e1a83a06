package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_983:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1823:String = "inventory_effects";
      
      public static const const_1286:String = "inventory_badges";
      
      public static const const_1896:String = "inventory_clothes";
      
      public static const const_1900:String = "inventory_furniture";
       
      
      private var var_2823:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_983);
         this.var_2823 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2823;
      }
   }
}
