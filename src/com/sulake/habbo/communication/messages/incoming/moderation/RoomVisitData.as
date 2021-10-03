package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_807:String;
      
      private var var_2309:int;
      
      private var var_1612:Boolean;
      
      private var _roomId:int;
      
      private var var_2308:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1612 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_807 = param1.readString();
         var_2308 = param1.readInteger();
         var_2309 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1612;
      }
      
      public function get roomName() : String
      {
         return var_807;
      }
      
      public function get enterMinute() : int
      {
         return var_2309;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_2308;
      }
   }
}
