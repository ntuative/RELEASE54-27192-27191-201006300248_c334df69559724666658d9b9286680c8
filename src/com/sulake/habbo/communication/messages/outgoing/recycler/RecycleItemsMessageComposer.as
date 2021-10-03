package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_894:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_894 = new Array();
         var_894.push(param1.length);
         var_894 = var_894.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_894;
      }
   }
}
