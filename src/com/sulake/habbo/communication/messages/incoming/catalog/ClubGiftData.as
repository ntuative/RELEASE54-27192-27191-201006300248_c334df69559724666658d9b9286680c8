package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_1976:Boolean;
      
      private var var_1975:int;
      
      private var _offerId:int;
      
      private var var_1902:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1976 = param1.readBoolean();
         var_1975 = param1.readInteger();
         var_1902 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1902;
      }
      
      public function get isVip() : Boolean
      {
         return var_1976;
      }
      
      public function get daysRequired() : int
      {
         return var_1975;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
   }
}
