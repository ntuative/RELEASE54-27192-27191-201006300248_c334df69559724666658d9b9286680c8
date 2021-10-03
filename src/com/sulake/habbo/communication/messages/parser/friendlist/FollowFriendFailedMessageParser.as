package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FollowFriendFailedMessageParser implements IMessageParser
   {
       
      
      private var var_1213:int;
      
      public function FollowFriendFailedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1213 = param1.readInteger();
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1213;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
   }
}
