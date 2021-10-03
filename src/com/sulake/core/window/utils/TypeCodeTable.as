package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_779;
         param1["badge"] = const_854;
         param1["bitmap"] = const_405;
         param1["border"] = const_759;
         param1["border_notify"] = const_1924;
         param1["bubble"] = const_808;
         param1["bubble_pointer_up"] = const_1298;
         param1["bubble_pointer_right"] = const_1231;
         param1["bubble_pointer_down"] = const_1281;
         param1["bubble_pointer_left"] = const_1250;
         param1["button"] = const_501;
         param1["button_thick"] = const_925;
         param1["button_icon"] = const_2059;
         param1["button_group_left"] = const_921;
         param1["button_group_center"] = const_852;
         param1["button_group_right"] = const_999;
         param1["canvas"] = const_834;
         param1["checkbox"] = const_966;
         param1["closebutton"] = const_1246;
         param1["container"] = const_464;
         param1["container_button"] = const_898;
         param1["display_object_wrapper"] = const_965;
         param1["dropmenu"] = const_564;
         param1["dropmenu_item"] = const_662;
         param1["frame"] = const_431;
         param1["frame_notify"] = const_1827;
         param1["header"] = const_887;
         param1["html"] = const_1315;
         param1["icon"] = const_1414;
         param1["itemgrid"] = const_1209;
         param1["itemgrid_horizontal"] = const_611;
         param1["itemgrid_vertical"] = const_793;
         param1["itemlist"] = WINDOW_TYPE_ITEMLIST;
         param1["itemlist_horizontal"] = const_446;
         param1["itemlist_vertical"] = const_413;
         param1["label"] = const_874;
         param1["maximizebox"] = const_1862;
         param1["menu"] = const_1977;
         param1["menu_item"] = const_2023;
         param1["submenu"] = const_1353;
         param1["minimizebox"] = const_1912;
         param1["notify"] = const_1976;
         param1["null"] = const_743;
         param1["password"] = const_878;
         param1["radiobutton"] = const_900;
         param1["region"] = const_358;
         param1["restorebox"] = const_1820;
         param1["scaler"] = const_598;
         param1["scaler_horizontal"] = const_1919;
         param1["scaler_vertical"] = const_2028;
         param1["scrollbar_horizontal"] = const_559;
         param1["scrollbar_vertical"] = const_994;
         param1["scrollbar_slider_button_up"] = const_1333;
         param1["scrollbar_slider_button_down"] = const_1351;
         param1["scrollbar_slider_button_left"] = const_1271;
         param1["scrollbar_slider_button_right"] = const_1195;
         param1["scrollbar_slider_bar_horizontal"] = const_1308;
         param1["scrollbar_slider_bar_vertical"] = const_1347;
         param1["scrollbar_slider_track_horizontal"] = const_1201;
         param1["scrollbar_slider_track_vertical"] = const_1416;
         param1["scrollable_itemlist"] = const_2019;
         param1["scrollable_itemlist_vertical"] = const_640;
         param1["scrollable_itemlist_horizontal"] = const_1371;
         param1["selector"] = const_1028;
         param1["selector_list"] = const_1008;
         param1["submenu"] = const_1353;
         param1["tab_button"] = const_986;
         param1["tab_container_button"] = const_1205;
         param1["tab_context"] = const_454;
         param1["tab_content"] = const_1269;
         param1["tab_selector"] = const_762;
         param1["text"] = const_896;
         param1["input"] = const_820;
         param1["toolbar"] = const_1949;
         param1["tooltip"] = const_409;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
