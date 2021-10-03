package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LookToMessageComposer implements IMessageComposer
   {
       
      
      private var var_1881:int;
      
      private var var_1882:int;
      
      public function LookToMessageComposer(param1:int, param2:int)
      {
         super();
         var_1881 = param1;
         var_1882 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_1881,var_1882];
      }
   }
}
