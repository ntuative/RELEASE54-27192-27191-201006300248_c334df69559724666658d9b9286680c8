package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class Triggerable
   {
       
      
      private var var_1406:String;
      
      private var var_1635:String;
      
      private var var_2285:int;
      
      private var var_2284:int;
      
      private var var_332:int;
      
      public function Triggerable(param1:IMessageDataWrapper)
      {
         super();
         var_332 = param1.readInteger();
         var_1406 = param1.readString();
         var_1635 = param1.readString();
         var_2284 = param1.readInteger();
         var_2285 = param1.readInteger();
      }
      
      public function get params() : String
      {
         return var_1635;
      }
      
      public function get cooldownPeriod() : int
      {
         return var_2285;
      }
      
      public function get performCount() : int
      {
         return var_2284;
      }
      
      public function get stuffId() : int
      {
         return var_332;
      }
      
      public function get stuffName() : String
      {
         return var_1406;
      }
   }
}
