package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2310:String;
      
      private var var_1403:String;
      
      private var var_2311:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_2311 = param1;
         var_1403 = param2;
         var_2310 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2311,var_1403,var_2310];
      }
      
      public function dispose() : void
      {
      }
   }
}
