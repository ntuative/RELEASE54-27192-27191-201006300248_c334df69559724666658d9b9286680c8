package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomChatlogData
   {
       
      
      private var var_807:String;
      
      private var var_1613:Array;
      
      private var var_1612:Boolean;
      
      private var _roomId:int;
      
      public function RoomChatlogData(param1:IMessageDataWrapper)
      {
         var_1613 = new Array();
         super();
         var_1612 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_807 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1613.push(new ChatlineData(param1));
            _loc3_++;
         }
         Logger.log("READ ROOMCHATLOGDATA: " + var_1612 + ", " + _roomId + ", " + var_807 + ", " + chatlog.length);
      }
      
      public function get isPublic() : Boolean
      {
         return var_1612;
      }
      
      public function get roomName() : String
      {
         return var_807;
      }
      
      public function get chatlog() : Array
      {
         return var_1613;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
