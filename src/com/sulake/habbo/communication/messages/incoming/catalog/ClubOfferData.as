package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1943:int;
      
      private var var_1409:int;
      
      private var var_1944:int;
      
      private var _offerId:int;
      
      private var var_1942:int;
      
      private var var_1946:int;
      
      private var var_1945:Boolean;
      
      private var var_1941:int;
      
      private var var_1940:Boolean;
      
      private var var_1318:String;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1318 = param1.readString();
         var_1409 = param1.readInteger();
         var_1940 = param1.readBoolean();
         var_1945 = param1.readBoolean();
         var_1944 = param1.readInteger();
         var_1941 = param1.readInteger();
         var_1942 = param1.readInteger();
         var_1943 = param1.readInteger();
         var_1946 = param1.readInteger();
      }
      
      public function get year() : int
      {
         return var_1942;
      }
      
      public function get month() : int
      {
         return var_1943;
      }
      
      public function get price() : int
      {
         return var_1409;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get periods() : int
      {
         return var_1944;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1941;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1940;
      }
      
      public function get day() : int
      {
         return var_1946;
      }
      
      public function get vip() : Boolean
      {
         return var_1945;
      }
      
      public function get productCode() : String
      {
         return var_1318;
      }
   }
}
