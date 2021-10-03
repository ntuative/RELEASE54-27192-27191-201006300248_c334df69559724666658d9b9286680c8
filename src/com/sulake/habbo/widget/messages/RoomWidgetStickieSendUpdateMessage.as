package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStickieSendUpdateMessage extends RoomWidgetMessage
   {
      
      public static const const_469:String = "RWSUM_STICKIE_SEND_UPDATE";
      
      public static const const_731:String = "RWSUM_STICKIE_SEND_DELETE";
       
      
      private var var_788:String;
      
      private var var_165:int;
      
      private var var_220:String;
      
      public function RoomWidgetStickieSendUpdateMessage(param1:String, param2:int, param3:String = "", param4:String = "")
      {
         super(param1);
         var_165 = param2;
         var_220 = param3;
         var_788 = param4;
      }
      
      public function get objectId() : int
      {
         return var_165;
      }
      
      public function get text() : String
      {
         return var_220;
      }
      
      public function get colorHex() : String
      {
         return var_788;
      }
   }
}
