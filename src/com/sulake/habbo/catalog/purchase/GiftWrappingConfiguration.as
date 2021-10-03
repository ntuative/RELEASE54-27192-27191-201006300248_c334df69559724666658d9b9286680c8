package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_642:Array;
      
      private var var_1409:int;
      
      private var var_1603:Array;
      
      private var var_643:Array;
      
      private var var_1288:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1288 = _loc2_.isWrappingEnabled;
         var_1409 = _loc2_.wrappingPrice;
         var_1603 = _loc2_.stuffTypes;
         var_643 = _loc2_.boxTypes;
         var_642 = _loc2_.ribbonTypes;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_642;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1603;
      }
      
      public function get price() : int
      {
         return var_1409;
      }
      
      public function get boxTypes() : Array
      {
         return var_643;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1288;
      }
   }
}
