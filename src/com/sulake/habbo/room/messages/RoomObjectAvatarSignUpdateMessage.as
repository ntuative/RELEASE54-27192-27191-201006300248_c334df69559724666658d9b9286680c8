package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarSignUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2039:int;
      
      public function RoomObjectAvatarSignUpdateMessage(param1:int)
      {
         super();
         var_2039 = param1;
      }
      
      public function get signType() : int
      {
         return var_2039;
      }
   }
}
