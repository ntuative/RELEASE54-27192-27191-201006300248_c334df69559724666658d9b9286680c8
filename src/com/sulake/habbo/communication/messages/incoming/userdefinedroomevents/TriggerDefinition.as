package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class TriggerDefinition extends Triggerable
   {
       
      
      private var var_218:int;
      
      public function TriggerDefinition(param1:IMessageDataWrapper)
      {
         super(param1);
         var_218 = param1.readInteger();
      }
      
      public function get triggerConf() : int
      {
         return var_218;
      }
   }
}
