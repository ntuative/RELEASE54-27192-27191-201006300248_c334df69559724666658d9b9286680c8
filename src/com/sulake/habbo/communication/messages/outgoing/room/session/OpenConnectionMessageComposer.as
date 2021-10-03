package com.sulake.habbo.communication.messages.outgoing.room.session
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenConnectionMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int;
      
      private var var_2117:int;
      
      private var var_2116:Boolean;
      
      public function OpenConnectionMessageComposer(param1:Boolean, param2:int, param3:int = 0)
      {
         super();
         _roomId = param2;
         var_2116 = param1;
         var_2117 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [int(var_2116),_roomId,var_2117];
      }
      
      public function dispose() : void
      {
      }
   }
}
