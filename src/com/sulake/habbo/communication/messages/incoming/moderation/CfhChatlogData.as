package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_2076:int;
      
      private var var_1109:int;
      
      private var var_2075:int;
      
      private var var_1611:int;
      
      private var var_118:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1611 = param1.readInteger();
         var_2075 = param1.readInteger();
         var_1109 = param1.readInteger();
         var_2076 = param1.readInteger();
         var_118 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1611);
      }
      
      public function get chatRecordId() : int
      {
         return var_2076;
      }
      
      public function get reportedUserId() : int
      {
         return var_1109;
      }
      
      public function get callerUserId() : int
      {
         return var_2075;
      }
      
      public function get callId() : int
      {
         return var_1611;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_118;
      }
   }
}
