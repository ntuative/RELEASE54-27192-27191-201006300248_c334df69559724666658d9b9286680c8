package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_417:String;
      
      private var var_1805:int;
      
      private var var_1983:String;
      
      private var var_1108:int;
      
      private var var_1365:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1365;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1365 = param1.readInteger();
         var_1983 = param1.readString();
         var_1805 = param1.readInteger();
         var_417 = param1.readString();
         var_1108 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_1983;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_417;
      }
      
      public function get petType() : int
      {
         return var_1108;
      }
      
      public function get level() : int
      {
         return var_1805;
      }
   }
}
