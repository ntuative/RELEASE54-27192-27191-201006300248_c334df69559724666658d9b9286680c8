package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_239:String = "e";
      
      public static const const_77:String = "i";
      
      public static const const_79:String = "s";
       
      
      private var var_1117:String;
      
      private var var_1357:String;
      
      private var var_1354:int;
      
      private var var_2097:int;
      
      private var var_1116:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1357 = param1.readString();
         var_2097 = param1.readInteger();
         var_1117 = param1.readString();
         var_1116 = param1.readInteger();
         var_1354 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1116;
      }
      
      public function get productType() : String
      {
         return var_1357;
      }
      
      public function get expiration() : int
      {
         return var_1354;
      }
      
      public function get furniClassId() : int
      {
         return var_2097;
      }
      
      public function get extraParam() : String
      {
         return var_1117;
      }
   }
}
