package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1052:String = "price_type_none";
      
      public static const const_407:String = "pricing_model_multi";
      
      public static const const_317:String = "price_type_credits";
      
      public static const const_422:String = "price_type_credits_and_pixels";
      
      public static const const_417:String = "pricing_model_bundle";
      
      public static const const_507:String = "pricing_model_single";
      
      public static const const_753:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1377:String = "pricing_model_unknown";
      
      public static const const_402:String = "price_type_pixels";
       
      
      private var var_2382:int;
      
      private var var_1006:int;
      
      private var _offerId:int;
      
      private var var_1005:int;
      
      private var var_473:String;
      
      private var var_684:String;
      
      private var var_469:ICatalogPage;
      
      private var var_472:IProductContainer;
      
      private var var_1468:String;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1468 = param1.localizationId;
         var_1006 = param1.priceInCredits;
         var_1005 = param1.priceInPixels;
         var_469 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_473;
      }
      
      public function get page() : ICatalogPage
      {
         return var_469;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_2382 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_472;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_1005;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1468 = "";
         var_1006 = 0;
         var_1005 = 0;
         var_469 = null;
         if(var_472 != null)
         {
            var_472.dispose();
            var_472 = null;
         }
      }
      
      public function get previewCallbackId() : int
      {
         return var_2382;
      }
      
      public function get priceInCredits() : int
      {
         return var_1006;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_473 = const_507;
            }
            else
            {
               var_473 = const_407;
            }
         }
         else if(param1.length > 1)
         {
            var_473 = const_417;
         }
         else
         {
            var_473 = const_1377;
         }
      }
      
      public function get priceType() : String
      {
         return var_684;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_473)
         {
            case const_507:
               var_472 = new SingleProductContainer(this,param1);
               break;
            case const_407:
               var_472 = new MultiProductContainer(this,param1);
               break;
            case const_417:
               var_472 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_473);
         }
      }
      
      public function get localizationId() : String
      {
         return var_1468;
      }
      
      private function analyzePriceType() : void
      {
         if(var_1006 > 0 && var_1005 > 0)
         {
            var_684 = const_422;
         }
         else if(var_1006 > 0)
         {
            var_684 = const_317;
         }
         else if(var_1005 > 0)
         {
            var_684 = const_402;
         }
         else
         {
            var_684 = const_1052;
         }
      }
   }
}
