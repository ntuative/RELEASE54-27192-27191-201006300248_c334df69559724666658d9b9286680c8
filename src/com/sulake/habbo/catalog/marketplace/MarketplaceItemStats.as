package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1647:Array;
      
      private var var_1741:int;
      
      private var var_2177:int;
      
      private var var_2176:int;
      
      private var var_2174:int;
      
      private var _dayOffsets:Array;
      
      private var var_2175:int;
      
      private var var_1648:Array;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrices(param1:Array) : void
      {
         var_1647 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_2177;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1648 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1741 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_2176;
      }
      
      public function get furniCategoryId() : int
      {
         return var_2174;
      }
      
      public function get offerCount() : int
      {
         return var_2175;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_2175 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1648;
      }
      
      public function get averagePrice() : int
      {
         return var_1741;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_2174 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_2176 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_2177 = param1;
      }
   }
}
