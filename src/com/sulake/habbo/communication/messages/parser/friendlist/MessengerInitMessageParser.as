package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2487:int;
      
      private var var_2486:int;
      
      private var var_93:Array;
      
      private var var_246:Array;
      
      private var var_2485:int;
      
      private var var_2489:int;
      
      private var var_2484:int;
      
      private var var_2488:int;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_93 = new Array();
         this.var_246 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2487;
      }
      
      public function get friends() : Array
      {
         return this.var_246;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2485;
      }
      
      public function get categories() : Array
      {
         return this.var_93;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2486;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2488;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2488 = param1.readInteger();
         this.var_2485 = param1.readInteger();
         this.var_2487 = param1.readInteger();
         this.var_2484 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_93.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_246.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2486 = param1.readInteger();
         this.var_2489 = param1.readInteger();
         return true;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2484;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2489;
      }
   }
}
