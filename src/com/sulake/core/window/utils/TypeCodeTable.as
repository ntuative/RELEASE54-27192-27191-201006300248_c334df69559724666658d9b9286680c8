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
         param1["background"] = const_580;
         param1["bitmap"] = const_767;
         param1["border"] = const_558;
         param1["border_notify"] = const_1438;
         param1["button"] = const_458;
         param1["button_thick"] = const_652;
         param1["button_icon"] = const_1430;
         param1["button_group_left"] = const_622;
         param1["button_group_center"] = const_542;
         param1["button_group_right"] = const_688;
         param1["canvas"] = const_736;
         param1["checkbox"] = const_585;
         param1["closebutton"] = const_1043;
         param1["container"] = const_343;
         param1["container_button"] = const_695;
         param1["display_object_wrapper"] = const_717;
         param1["dropmenu"] = const_431;
         param1["dropmenu_item"] = const_423;
         param1["frame"] = const_316;
         param1["frame_notify"] = const_1246;
         param1["header"] = const_734;
         param1["icon"] = const_898;
         param1["itemgrid"] = const_993;
         param1["itemgrid_horizontal"] = const_394;
         param1["itemgrid_vertical"] = const_650;
         param1["itemlist"] = const_1014;
         param1["itemlist_horizontal"] = const_326;
         param1["itemlist_vertical"] = const_302;
         param1["maximizebox"] = const_1259;
         param1["menu"] = WINDOW_TYPE_MENU;
         param1["menu_item"] = const_1254;
         param1["submenu"] = const_974;
         param1["minimizebox"] = const_1283;
         param1["notify"] = const_1357;
         param1["null"] = const_714;
         param1["password"] = const_576;
         param1["radiobutton"] = const_762;
         param1["region"] = const_384;
         param1["restorebox"] = const_1266;
         param1["scaler"] = const_548;
         param1["scaler_horizontal"] = const_1290;
         param1["scaler_vertical"] = const_1385;
         param1["scrollbar_horizontal"] = const_374;
         param1["scrollbar_vertical"] = const_572;
         param1["scrollbar_slider_button_up"] = const_899;
         param1["scrollbar_slider_button_down"] = const_944;
         param1["scrollbar_slider_button_left"] = const_976;
         param1["scrollbar_slider_button_right"] = const_1041;
         param1["scrollbar_slider_bar_horizontal"] = const_1038;
         param1["scrollbar_slider_bar_vertical"] = const_896;
         param1["scrollbar_slider_track_horizontal"] = const_841;
         param1["scrollbar_slider_track_vertical"] = const_912;
         param1["scrollable_itemlist"] = const_1222;
         param1["scrollable_itemlist_vertical"] = const_433;
         param1["scrollable_itemlist_horizontal"] = const_1009;
         param1["selector"] = const_715;
         param1["selector_list"] = const_669;
         param1["submenu"] = const_974;
         param1["tab_button"] = const_582;
         param1["tab_container_button"] = const_850;
         param1["tab_context"] = WINDOW_TYPE_TAB_CONTEXT;
         param1["tab_content"] = const_839;
         param1["tab_selector"] = const_683;
         param1["text"] = const_737;
         param1["input"] = const_699;
         param1["toolbar"] = const_1413;
         param1["tooltip"] = const_339;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
