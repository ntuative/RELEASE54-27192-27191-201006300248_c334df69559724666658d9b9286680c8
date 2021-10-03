package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetAddedToInventoryParser implements IMessageParser
   {
       
      
      private var var_1191:PetData;
      
      private var var_1900:Boolean;
      
      public function PetAddedToInventoryParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_1191 = null;
         return true;
      }
      
      public function get purchased() : Boolean
      {
         return var_1900;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1191 = new PetData(param1);
         var_1900 = param1.readBoolean();
         return true;
      }
      
      public function get pet() : PetData
      {
         return var_1191;
      }
   }
}
