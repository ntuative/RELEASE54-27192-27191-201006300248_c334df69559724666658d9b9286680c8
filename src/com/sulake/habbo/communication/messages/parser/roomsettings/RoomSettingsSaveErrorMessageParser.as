package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1726:int = 9;
      
      public static const const_1615:int = 4;
      
      public static const const_1537:int = 1;
      
      public static const const_1329:int = 10;
      
      public static const const_1691:int = 2;
      
      public static const const_1442:int = 7;
      
      public static const const_1332:int = 11;
      
      public static const const_1556:int = 3;
      
      public static const const_1252:int = 8;
      
      public static const const_1208:int = 5;
      
      public static const const_1550:int = 6;
      
      public static const const_1223:int = 12;
       
      
      private var var_1763:String;
      
      private var _roomId:int;
      
      private var var_1213:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1763;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1213 = param1.readInteger();
         var_1763 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1213;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
