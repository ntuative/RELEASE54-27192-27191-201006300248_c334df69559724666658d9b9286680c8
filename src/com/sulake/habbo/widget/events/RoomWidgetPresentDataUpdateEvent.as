package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPresentDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_416:String = "RWPDUE_CONTENTS_CLUB";
      
      public static const const_399:String = "RWPDUE_CONTENTS_LANDSCAPE";
      
      public static const const_80:String = "RWPDUE_CONTENTS";
      
      public static const const_419:String = "RWPDUE_CONTENTS_WALLPAPER";
      
      public static const const_495:String = "RWPDUE_CONTENTS_FLOOR";
      
      public static const const_61:String = "RWPDUE_PACKAGEINFO";
       
      
      private var var_220:String;
      
      private var var_2153:BitmapData;
      
      private var var_165:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetPresentDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_165 = param2;
         var_220 = param3;
         _controller = param4;
         var_2153 = param5;
      }
      
      public function get iconBitmapData() : BitmapData
      {
         return var_2153;
      }
      
      public function get text() : String
      {
         return var_220;
      }
      
      public function get objectId() : int
      {
         return var_165;
      }
      
      public function get controller() : Boolean
      {
         return _controller;
      }
   }
}
