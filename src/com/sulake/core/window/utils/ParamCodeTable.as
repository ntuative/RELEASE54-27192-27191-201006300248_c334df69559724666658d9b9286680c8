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
         param1["null"] = const_112;
         param1["bound_to_parent_rect"] = const_87;
         param1["child_window"] = const_847;
         param1["embedded_controller"] = const_312;
         param1["resize_to_accommodate_children"] = const_62;
         param1["input_event_processor"] = const_45;
         param1["internal_event_handling"] = const_672;
         param1["mouse_dragging_target"] = const_223;
         param1["mouse_dragging_trigger"] = const_308;
         param1["mouse_scaling_target"] = const_269;
         param1["mouse_scaling_trigger"] = const_460;
         param1["horizontal_mouse_scaling_trigger"] = const_198;
         param1["vertical_mouse_scaling_trigger"] = const_229;
         param1["observe_parent_input_events"] = const_871;
         param1["optimize_region_to_layout_size"] = const_496;
         param1["parent_window"] = const_982;
         param1["relative_horizontal_scale_center"] = const_173;
         param1["relative_horizontal_scale_fixed"] = const_119;
         param1["relative_horizontal_scale_move"] = const_331;
         param1["relative_horizontal_scale_strech"] = const_272;
         param1["relative_scale_center"] = const_975;
         param1["relative_scale_fixed"] = const_553;
         param1["relative_scale_move"] = const_1042;
         param1["relative_scale_strech"] = const_833;
         param1["relative_vertical_scale_center"] = const_175;
         param1["relative_vertical_scale_fixed"] = const_120;
         param1["relative_vertical_scale_move"] = const_330;
         param1["relative_vertical_scale_strech"] = const_283;
         param1["on_resize_align_left"] = const_696;
         param1["on_resize_align_right"] = const_378;
         param1["on_resize_align_center"] = const_403;
         param1["on_resize_align_top"] = const_689;
         param1["on_resize_align_bottom"] = const_408;
         param1["on_resize_align_middle"] = const_468;
         param1["on_accommodate_align_left"] = const_980;
         param1["on_accommodate_align_right"] = const_486;
         param1["on_accommodate_align_center"] = const_614;
         param1["on_accommodate_align_top"] = const_881;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_604;
         param1["route_input_events_to_parent"] = const_484;
         param1["use_parent_graphic_context"] = const_30;
         param1["draggable_with_mouse"] = const_879;
         param1["scalable_with_mouse"] = const_1004;
         param1["reflect_horizontal_resize_to_parent"] = const_410;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_265;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
