package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_2158:String;
      
      private var var_615:String;
      
      private var var_1550:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1550 = param1.readInteger();
         var_2158 = param1.readString();
         var_615 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_615;
      }
      
      public function get figureString() : String
      {
         return var_2158;
      }
      
      public function get slotId() : int
      {
         return var_1550;
      }
   }
}
