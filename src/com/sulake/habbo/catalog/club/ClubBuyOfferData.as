package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var var_1943:int;
      
      private var var_2061:Boolean = false;
      
      private var var_1944:int;
      
      private var var_1942:int;
      
      private var var_1941:int;
      
      private var var_1318:String;
      
      private var var_1409:int;
      
      private var _offerId:int;
      
      private var var_1946:int;
      
      private var var_1945:Boolean;
      
      private var var_1940:Boolean;
      
      private var var_469:ICatalogPage;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         _offerId = param1;
         var_1318 = param2;
         var_1409 = param3;
         var_1940 = param4;
         var_1945 = param5;
         var_1944 = param6;
         var_1941 = param7;
         var_1942 = param8;
         var_1943 = param9;
         var_1946 = param10;
      }
      
      public function get month() : int
      {
         return var_1943;
      }
      
      public function get page() : ICatalogPage
      {
         return var_469;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get vip() : Boolean
      {
         return var_1945;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         var_469 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get priceInPixels() : int
      {
         return 0;
      }
      
      public function get priceType() : String
      {
         return Offer.const_317;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1940;
      }
      
      public function get localizationId() : String
      {
         return var_1318;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1941;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return var_2061;
      }
      
      public function get day() : int
      {
         return var_1946;
      }
      
      public function get year() : int
      {
         return var_1942;
      }
      
      public function get price() : int
      {
         return var_1409;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         var_2061 = param1;
      }
      
      public function get periods() : int
      {
         return var_1944;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get priceInCredits() : int
      {
         return var_1409;
      }
      
      public function get productCode() : String
      {
         return var_1318;
      }
   }
}
