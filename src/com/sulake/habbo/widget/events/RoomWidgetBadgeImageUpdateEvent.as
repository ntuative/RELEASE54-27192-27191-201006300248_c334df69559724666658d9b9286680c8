package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_596:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_1925:BitmapData;
      
      private var var_1924:String;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_596,param3,param4);
         var_1924 = param1;
         var_1925 = param2;
      }
      
      public function get badgeImage() : BitmapData
      {
         return var_1925;
      }
      
      public function get badgeID() : String
      {
         return var_1924;
      }
   }
}
