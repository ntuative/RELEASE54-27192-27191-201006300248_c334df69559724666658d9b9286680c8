package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_540:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_220:String;
      
      private var var_788:String;
      
      private var var_1649:String;
      
      private var var_165:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_165 = param2;
         var_1649 = param3;
         var_220 = param4;
         var_788 = param5;
         _controller = param6;
      }
      
      public function get objectType() : String
      {
         return var_1649;
      }
      
      public function get colorHex() : String
      {
         return var_788;
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
