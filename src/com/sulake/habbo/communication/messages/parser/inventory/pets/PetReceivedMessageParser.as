package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1191:PetData;
      
      private var var_1709:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1709 = param1.readBoolean();
         var_1191 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1709 + ", " + var_1191.id + ", " + var_1191.name + ", " + pet.figure + ", " + var_1191.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1709;
      }
      
      public function get pet() : PetData
      {
         return var_1191;
      }
   }
}
