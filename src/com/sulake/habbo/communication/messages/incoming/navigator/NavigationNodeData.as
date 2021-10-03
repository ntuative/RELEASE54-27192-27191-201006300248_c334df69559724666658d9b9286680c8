package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1413:int;
      
      private var var_1667:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1413 = param1;
         var_1667 = param2;
         Logger.log("READ NODE: " + var_1413 + ", " + var_1667);
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
