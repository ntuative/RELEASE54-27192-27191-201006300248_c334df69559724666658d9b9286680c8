package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1189:String;
      
      private var var_2125:int;
      
      private var var_2254:int;
      
      private var var_1661:int;
      
      private var var_2255:int;
      
      private var _category:int;
      
      private var var_2535:int;
      
      private var var_2260:int;
      
      private var var_2258:int;
      
      private var var_2259:int;
      
      private var var_2256:int;
      
      private var var_2257:Boolean;
      
      private var var_1487:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_2125 = param1;
         var_1189 = param2;
         var_2254 = param3;
         var_2259 = param4;
         _category = param5;
         var_1487 = param6;
         var_1661 = param7;
         var_2258 = param8;
         var_2260 = param9;
         var_2256 = param10;
         var_2255 = param11;
         var_2257 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_2259;
      }
      
      public function get extra() : int
      {
         return var_1661;
      }
      
      public function get stuffData() : String
      {
         return var_1487;
      }
      
      public function get groupable() : Boolean
      {
         return var_2257;
      }
      
      public function get creationMonth() : int
      {
         return var_2256;
      }
      
      public function get roomItemID() : int
      {
         return var_2254;
      }
      
      public function get itemType() : String
      {
         return var_1189;
      }
      
      public function get itemID() : int
      {
         return var_2125;
      }
      
      public function get songID() : int
      {
         return var_1661;
      }
      
      public function get timeToExpiration() : int
      {
         return var_2258;
      }
      
      public function get creationYear() : int
      {
         return var_2255;
      }
      
      public function get creationDay() : int
      {
         return var_2260;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
