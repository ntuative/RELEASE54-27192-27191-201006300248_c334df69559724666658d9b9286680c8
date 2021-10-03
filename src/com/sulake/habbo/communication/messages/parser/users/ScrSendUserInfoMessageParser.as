package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1433:int = 2;
      
      public static const const_1525:int = 1;
       
      
      private var var_2394:int;
      
      private var var_2391:int;
      
      private var var_2332:Boolean;
      
      private var var_2392:int;
      
      private var var_1467:String;
      
      private var var_2393:Boolean;
      
      private var var_2334:int;
      
      private var var_2390:int;
      
      private var var_2331:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_2391;
      }
      
      public function get isVIP() : Boolean
      {
         return var_2332;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_2390;
      }
      
      public function get memberPeriods() : int
      {
         return var_2392;
      }
      
      public function get productName() : String
      {
         return var_1467;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_2393;
      }
      
      public function get responseType() : int
      {
         return var_2394;
      }
      
      public function get pastClubDays() : int
      {
         return var_2331;
      }
      
      public function get pastVipDays() : int
      {
         return var_2334;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1467 = param1.readString();
         var_2391 = param1.readInteger();
         var_2392 = param1.readInteger();
         var_2390 = param1.readInteger();
         var_2394 = param1.readInteger();
         var_2393 = param1.readBoolean();
         var_2332 = param1.readBoolean();
         var_2331 = param1.readInteger();
         var_2334 = param1.readInteger();
         return true;
      }
   }
}
