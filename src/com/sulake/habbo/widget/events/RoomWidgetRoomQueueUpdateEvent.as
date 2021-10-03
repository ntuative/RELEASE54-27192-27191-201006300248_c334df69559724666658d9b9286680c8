package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_400:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_352:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_909:int;
      
      private var var_270:Boolean;
      
      private var var_1791:Boolean;
      
      private var var_1572:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_909 = param2;
         var_1791 = param3;
         var_270 = param4;
         var_1572 = param5;
      }
      
      public function get position() : int
      {
         return var_909;
      }
      
      public function get isActive() : Boolean
      {
         return var_270;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1572;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_1791;
      }
   }
}
