package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_353:Boolean;
      
      private var var_1413:int;
      
      private var var_1667:String;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         var_1413 = param1.readInteger();
         var_1667 = param1.readString();
         var_353 = param1.readBoolean();
      }
      
      public function get visible() : Boolean
      {
         return var_353;
      }
      
      public function get nodeName() : String
      {
         return var_1667;
      }
      
      public function get nodeId() : int
      {
         return var_1413;
      }
   }
}
