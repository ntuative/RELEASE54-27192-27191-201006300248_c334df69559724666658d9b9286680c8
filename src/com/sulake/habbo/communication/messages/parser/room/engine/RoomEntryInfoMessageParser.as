package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2326:int;
      
      private var var_462:Boolean;
      
      private var var_2325:Boolean;
      
      private var var_981:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2325 = param1.readBoolean();
         if(var_2325)
         {
            var_2326 = param1.readInteger();
            var_462 = param1.readBoolean();
         }
         else
         {
            var_981 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_981 != null)
         {
            var_981.dispose();
            var_981 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_2326;
      }
      
      public function get owner() : Boolean
      {
         return var_462;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_2325;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_981;
      }
   }
}
