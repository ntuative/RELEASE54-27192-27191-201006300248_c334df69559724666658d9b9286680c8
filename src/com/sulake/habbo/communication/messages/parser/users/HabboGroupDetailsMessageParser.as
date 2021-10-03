package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboGroupDetailsMessageParser implements IMessageParser
   {
       
      
      private var var_807:String = "";
      
      private var _name:String = "";
      
      private var _roomId:int = -1;
      
      private var var_1177:int = -1;
      
      private var var_1314:String = "";
      
      public function HabboGroupDetailsMessageParser()
      {
         super();
      }
      
      public function get groupId() : int
      {
         return var_1177;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1177 = param1.readInteger();
         if(var_1177 != -1)
         {
            _name = param1.readString();
            var_1314 = param1.readString();
            _roomId = param1.readInteger();
            var_807 = param1.readString();
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1177 = -1;
         _name = "";
         var_1314 = "";
         _roomId = -1;
         var_807 = "";
         return true;
      }
      
      public function get roomName() : String
      {
         return var_807;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get description() : String
      {
         return var_1314;
      }
   }
}
