package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2193:XML;
      
      private var var_1652:ITextWindow;
      
      private var var_1651:ITextWindow;
      
      private var var_2194:XML;
      
      private var var_956:IWindowContainer;
      
      private var var_2470:ITextWindow;
      
      private var var_2197:String = "";
      
      private var var_2533:IButtonWindow;
      
      private var var_2196:XML;
      
      private var var_1653:ITextWindow;
      
      private var var_2195:XML;
      
      private var var_957:IButtonWindow;
      
      private var var_79:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_317:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2194) as IWindowContainer;
               break;
            case Offer.const_402:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2195) as IWindowContainer;
               break;
            case Offer.const_422:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2193) as IWindowContainer;
               break;
            case Offer.const_753:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2196) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_956 != null)
            {
               _window.removeChild(var_956);
               var_956.dispose();
            }
            var_956 = _loc2_;
            _window.addChild(_loc2_);
            var_956.x = 0;
            var_956.y = 0;
         }
         var_1653 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1651 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1652 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2470 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_957 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_957 != null)
         {
            var_957.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_957.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_79 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_79,page,var_2197);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_2194 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_2195 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_2193 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_2196 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_1045,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_2197 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_79 = param1.offer;
         attachStub(var_79.priceType);
         if(var_1653 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_79.priceInCredits));
            var_1653.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1651 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_79.priceInPixels));
            var_1651.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1652 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_79.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_79.priceInPixels));
            var_1652.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_957 != null)
         {
            var_957.enable();
         }
      }
   }
}
