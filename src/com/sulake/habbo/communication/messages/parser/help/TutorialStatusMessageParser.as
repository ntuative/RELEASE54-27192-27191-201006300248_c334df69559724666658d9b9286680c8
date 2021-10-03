package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1188:Boolean;
      
      private var var_1186:Boolean;
      
      private var var_1187:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1188;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1186;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1187 = param1.readBoolean();
         var_1186 = param1.readBoolean();
         var_1188 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1187;
      }
      
      public function flush() : Boolean
      {
         var_1187 = false;
         var_1186 = false;
         var_1188 = false;
         return true;
      }
   }
}
