package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1512:String;
      
      private var var_1972:int;
      
      private var var_1969:int;
      
      private var var_1970:int;
      
      private var var_1971:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_1972 = param1.readInteger();
         var_1970 = param1.readInteger();
         var_1969 = param1.readInteger();
         var_1971 = param1.readString();
         var_1512 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1512;
      }
      
      public function get hour() : int
      {
         return var_1972;
      }
      
      public function get minute() : int
      {
         return var_1970;
      }
      
      public function get chatterName() : String
      {
         return var_1971;
      }
      
      public function get chatterId() : int
      {
         return var_1969;
      }
   }
}
