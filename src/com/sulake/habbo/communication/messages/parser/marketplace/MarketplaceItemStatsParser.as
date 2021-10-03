package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1647:Array;
      
      private var var_1741:int;
      
      private var var_2177:int;
      
      private var var_2174:int;
      
      private var var_2176:int;
      
      private var _dayOffsets:Array;
      
      private var var_2175:int;
      
      private var var_1648:Array;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1647;
      }
      
      public function get furniTypeId() : int
      {
         return var_2177;
      }
      
      public function get historyLength() : int
      {
         return var_2176;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return var_2174;
      }
      
      public function get offerCount() : int
      {
         return var_2175;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1648;
      }
      
      public function get averagePrice() : int
      {
         return var_1741;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1741 = param1.readInteger();
         var_2175 = param1.readInteger();
         var_2176 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _dayOffsets = [];
         var_1647 = [];
         var_1648 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _dayOffsets.push(param1.readInteger());
            var_1647.push(param1.readInteger());
            var_1648.push(param1.readInteger());
            _loc3_++;
         }
         var_2174 = param1.readInteger();
         var_2177 = param1.readInteger();
         return true;
      }
   }
}
