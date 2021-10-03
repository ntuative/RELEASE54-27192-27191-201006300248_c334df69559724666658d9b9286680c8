package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_937:Array;
      
      private var var_1006:int;
      
      private var var_1468:String;
      
      private var _offerId:int;
      
      private var var_1005:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1468 = param1.readString();
         var_1006 = param1.readInteger();
         var_1005 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_937 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_937.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_937;
      }
      
      public function get priceInCredits() : int
      {
         return var_1006;
      }
      
      public function get localizationId() : String
      {
         return var_1468;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_1005;
      }
   }
}
