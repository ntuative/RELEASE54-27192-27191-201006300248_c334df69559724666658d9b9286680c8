package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_748:int = 2;
      
      public static const const_893:int = 6;
      
      public static const const_653:int = 1;
      
      public static const const_636:int = 3;
      
      public static const const_952:int = 4;
      
      public static const const_684:int = 5;
       
      
      private var var_2173:String;
      
      private var var_1114:int;
      
      private var var_2074:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1114 = param2;
         var_2074 = param3;
         var_2173 = param4;
      }
      
      public function get time() : String
      {
         return var_2173;
      }
      
      public function get senderId() : int
      {
         return var_1114;
      }
      
      public function get messageText() : String
      {
         return var_2074;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
