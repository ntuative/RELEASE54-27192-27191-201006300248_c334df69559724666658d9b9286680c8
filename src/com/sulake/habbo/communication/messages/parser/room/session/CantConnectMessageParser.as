package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1505:int = 2;
      
      public static const const_1300:int = 4;
      
      public static const const_1351:int = 1;
      
      public static const const_1234:int = 3;
       
      
      private var var_1094:int = 0;
      
      private var var_905:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_1094;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1094 = param1.readInteger();
         if(var_1094 == 3)
         {
            var_905 = param1.readString();
         }
         else
         {
            var_905 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1094 = 0;
         var_905 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_905;
      }
   }
}
