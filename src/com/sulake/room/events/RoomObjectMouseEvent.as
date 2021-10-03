package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1656:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1564:String = "ROE_MOUSE_ENTER";
      
      public static const const_432:String = "ROE_MOUSE_MOVE";
      
      public static const const_1630:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_215:String = "ROE_MOUSE_CLICK";
      
      public static const const_479:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1964:Boolean;
      
      private var var_1960:Boolean;
      
      private var var_1959:Boolean;
      
      private var var_1963:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1959 = param4;
         var_1963 = param5;
         var_1964 = param6;
         var_1960 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1960;
      }
      
      public function get altKey() : Boolean
      {
         return var_1959;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1963;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1964;
      }
   }
}
