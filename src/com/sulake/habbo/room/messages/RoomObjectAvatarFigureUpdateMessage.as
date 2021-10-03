package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1907:String;
      
      private var var_417:String;
      
      private var var_615:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         var_417 = param1;
         var_615 = param2;
         var_1907 = param3;
      }
      
      public function get race() : String
      {
         return var_1907;
      }
      
      public function get figure() : String
      {
         return var_417;
      }
      
      public function get gender() : String
      {
         return var_615;
      }
   }
}
