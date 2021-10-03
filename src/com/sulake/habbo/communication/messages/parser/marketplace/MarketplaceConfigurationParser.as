package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1948:int;
      
      private var var_1664:int;
      
      private var var_1950:int;
      
      private var var_1947:int;
      
      private var var_1951:int;
      
      private var var_1665:int;
      
      private var var_1949:int;
      
      private var var_1288:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1948;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1664;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1949;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1947;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1951;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1665;
      }
      
      public function get commission() : int
      {
         return var_1950;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1288 = param1.readBoolean();
         var_1950 = param1.readInteger();
         var_1664 = param1.readInteger();
         var_1665 = param1.readInteger();
         var_1947 = param1.readInteger();
         var_1948 = param1.readInteger();
         var_1951 = param1.readInteger();
         var_1949 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1288;
      }
   }
}
