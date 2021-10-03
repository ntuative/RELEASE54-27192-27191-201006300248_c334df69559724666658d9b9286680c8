package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_235:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2068:Boolean = false;
      
      private var var_2066:int = 0;
      
      private var var_2069:int = 0;
      
      private var var_1903:int;
      
      private var var_2067:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_235,param6,param7);
         var_2067 = param1;
         var_2069 = param2;
         var_2066 = param3;
         var_2068 = param4;
         var_1903 = param5;
      }
      
      public function get clubLevel() : int
      {
         return var_1903;
      }
      
      public function get pastPeriods() : int
      {
         return var_2066;
      }
      
      public function get periodsLeft() : int
      {
         return var_2069;
      }
      
      public function get daysLeft() : int
      {
         return var_2067;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2068;
      }
   }
}
