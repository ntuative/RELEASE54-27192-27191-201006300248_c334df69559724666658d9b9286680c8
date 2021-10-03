package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1189:int;
      
      private var var_1470:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1189 = param1;
         var_1470 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1189;
      }
      
      public function get itemName() : String
      {
         return var_1470;
      }
   }
}
