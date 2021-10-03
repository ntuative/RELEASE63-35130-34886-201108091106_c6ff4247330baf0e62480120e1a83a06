package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_189;
         param1["bound_to_parent_rect"] = const_102;
         param1["child_window"] = const_1270;
         param1["embedded_controller"] = const_1396;
         param1["expand_to_accommodate_children"] = WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_29;
         param1["internal_event_handling"] = const_1035;
         param1["mouse_dragging_target"] = const_270;
         param1["mouse_dragging_trigger"] = const_453;
         param1["mouse_scaling_target"] = const_371;
         param1["mouse_scaling_trigger"] = const_653;
         param1["horizontal_mouse_scaling_trigger"] = const_299;
         param1["vertical_mouse_scaling_trigger"] = const_319;
         param1["observe_parent_input_events"] = const_1192;
         param1["parent_window"] = const_1329;
         param1["resize_to_accommodate_children"] = const_198;
         param1["relative_horizontal_scale_center"] = const_226;
         param1["relative_horizontal_scale_fixed"] = const_158;
         param1["relative_horizontal_scale_move"] = const_339;
         param1["relative_horizontal_scale_strech"] = const_427;
         param1["relative_scale_center"] = const_1335;
         param1["relative_scale_fixed"] = const_781;
         param1["relative_scale_move"] = const_1432;
         param1["relative_scale_strech"] = const_1418;
         param1["relative_vertical_scale_center"] = const_239;
         param1["relative_vertical_scale_fixed"] = const_176;
         param1["relative_vertical_scale_move"] = const_301;
         param1["relative_vertical_scale_strech"] = const_291;
         param1["on_resize_align_left"] = const_777;
         param1["on_resize_align_right"] = const_576;
         param1["on_resize_align_center"] = const_557;
         param1["on_resize_align_top"] = const_771;
         param1["on_resize_align_bottom"] = const_556;
         param1["on_resize_align_middle"] = const_622;
         param1["on_accommodate_align_left"] = const_1300;
         param1["on_accommodate_align_right"] = const_549;
         param1["on_accommodate_align_center"] = const_783;
         param1["on_accommodate_align_top"] = const_1280;
         param1["on_accommodate_align_bottom"] = const_530;
         param1["on_accommodate_align_middle"] = const_998;
         param1["route_input_events_to_parent"] = const_586;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_1259;
         param1["scalable_with_mouse"] = const_1318;
         param1["reflect_horizontal_resize_to_parent"] = const_537;
         param1["reflect_vertical_resize_to_parent"] = const_510;
         param1["reflect_resize_to_parent"] = const_380;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1219;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
