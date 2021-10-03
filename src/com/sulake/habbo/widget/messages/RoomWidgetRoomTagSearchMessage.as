package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_678:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1774:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_678);
         var_1774 = param1;
      }
      
      public function get tag() : String
      {
         return var_1774;
      }
   }
}
