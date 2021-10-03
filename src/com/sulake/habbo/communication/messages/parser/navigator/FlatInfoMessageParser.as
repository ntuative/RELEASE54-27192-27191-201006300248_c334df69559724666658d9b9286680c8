package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
   
   public class FlatInfoMessageParser implements IMessageParser
   {
       
      
      private var var_229:RoomSettingsFlatInfo;
      
      public function FlatInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_229 = null;
         return true;
      }
      
      public function get flatInfo() : RoomSettingsFlatInfo
      {
         return var_229;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_229 = new RoomSettingsFlatInfo();
         var_229.allowFurniMoving = param1.readInteger() == 1;
         var_229.doorMode = param1.readInteger();
         var_229.id = param1.readInteger();
         var_229.ownerName = param1.readString();
         var_229.type = param1.readString();
         var_229.name = param1.readString();
         var_229.description = param1.readString();
         var_229.showOwnerName = param1.readInteger() == 1;
         var_229.allowTrading = param1.readInteger() == 1;
         var_229.categoryAlertKey = param1.readInteger() == 1;
         return true;
      }
   }
}
