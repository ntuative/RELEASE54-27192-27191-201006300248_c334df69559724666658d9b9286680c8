package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2244:String;
      
      private var var_905:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_2244 = param1;
         var_905 = param2;
      }
      
      public function get postureType() : String
      {
         return var_2244;
      }
      
      public function get parameter() : String
      {
         return var_905;
      }
   }
}
