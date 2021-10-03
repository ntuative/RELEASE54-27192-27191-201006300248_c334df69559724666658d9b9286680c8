package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1445:int;
      
      private var var_1122:String;
      
      private var var_752:Array;
      
      private var var_1152:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_752.slice();
      }
      
      public function flush() : Boolean
      {
         var_1122 = "";
         var_1152 = [];
         var_752 = [];
         var_1445 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1445;
      }
      
      public function get question() : String
      {
         return var_1122;
      }
      
      public function get choices() : Array
      {
         return var_1152.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1122 = param1.readString();
         var_1152 = [];
         var_752 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_1152.push(param1.readString());
            var_752.push(param1.readInteger());
            _loc3_++;
         }
         var_1445 = param1.readInteger();
         return true;
      }
   }
}
