package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class DiceOffMessageComposer implements IMessageComposer
   {
       
      
      private var var_165:int;
      
      public function DiceOffMessageComposer(param1:int)
      {
         super();
         var_165 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_165];
      }
   }
}
