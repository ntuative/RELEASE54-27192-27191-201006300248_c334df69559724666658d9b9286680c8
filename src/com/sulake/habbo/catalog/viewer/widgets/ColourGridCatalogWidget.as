package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   
   public class ColourGridCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var _colourGrid:IItemGridWindow;
      
      private var var_316:IWindowContainer;
      
      private var var_1242:XML;
      
      private var var_716:BitmapData;
      
      private var var_1241:Array;
      
      private var var_902:BitmapData;
      
      private var var_747:BitmapData;
      
      public function ColourGridCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function select(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         Logger.log("[ColourGridCatalogWidget] Select: " + param1);
         if(var_316 != null)
         {
            _loc2_ = var_316.getChildByName("chosen");
            if(_loc2_ != null)
            {
               _loc2_.visible = false;
            }
         }
         var_316 = param1;
         if(var_316 != null)
         {
            _loc2_ = var_316.getChildByName("chosen");
         }
         if(_loc2_ != null)
         {
            _loc2_.visible = true;
         }
      }
      
      override public function init() : void
      {
         super.init();
         _colourGrid = _window.findChildByName("colourGrid") as IItemGridWindow;
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("color_chooser_cell") as XmlAsset;
         var_1242 = _loc1_.content as XML;
         events.addEventListener(WidgetEvent.CWE_COLOUR_ARRAY,onAvailableColours);
      }
      
      private function populateColourGrid() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = 0;
         Logger.log("[ColourGridCatalogWidget] Display colors: undefined");
         _colourGrid.destroyGridItems();
         var_316 = null;
         for each(_loc1_ in var_1241)
         {
            _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1242) as IWindowContainer;
            _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onClick);
            _loc2_.background = true;
            _loc2_.color = 4294967295;
            _loc2_.width = var_716.width;
            _loc2_.height = var_716.height;
            _colourGrid.addGridItem(_loc2_);
            _loc3_ = _loc2_.findChildByTag("BG_BORDER") as IBitmapWrapperWindow;
            if(_loc3_ != null)
            {
               _loc3_.bitmap = new BitmapData(var_716.width,var_716.height,true,0);
               _loc3_.bitmap.copyPixels(var_716,var_716.rect,new Point(0,0));
            }
            _loc4_ = _loc2_.findChildByTag("COLOR_IMAGE") as IBitmapWrapperWindow;
            if(_loc4_ != null)
            {
               _loc4_.bitmap = new BitmapData(var_902.width,var_902.height,true,0);
               _loc6_ = 255;
               _loc7_ = 255;
               _loc8_ = 255;
               if(_loc1_ > 0)
               {
                  _loc14_ = uint(uint(_loc1_));
                  _loc6_ = uint(_loc14_ >> 16 & 255);
                  _loc7_ = uint(_loc14_ >> 8 & 255);
                  _loc8_ = uint(_loc14_ >> 0 & 255);
               }
               _loc9_ = _loc6_ / 255 * 1;
               _loc10_ = _loc7_ / 255 * 1;
               _loc11_ = _loc8_ / 255 * 1;
               _loc12_ = new ColorTransform(_loc9_,_loc10_,_loc11_);
               _loc13_ = var_902.clone();
               _loc13_.colorTransform(_loc13_.rect,_loc12_);
               _loc4_.bitmap.copyPixels(_loc13_,_loc13_.rect,new Point(0,0));
            }
            _loc5_ = _loc2_.findChildByTag("COLOR_CHOSEN") as IBitmapWrapperWindow;
            if(_loc5_ != null)
            {
               _loc5_.bitmap = new BitmapData(var_747.width,var_747.height,true,16777215);
               _loc5_.bitmap.copyPixels(var_747,var_747.rect,new Point(0,0),null,null,true);
               _loc5_.visible = false;
            }
         }
      }
      
      private function onAvailableColours(param1:CatalogWidgetColoursEvent) : void
      {
         var_1241 = param1.colours;
         var _loc2_:BitmapDataAsset = page.viewer.catalog.assets.getAssetByName(param1.backgroundAssetName) as BitmapDataAsset;
         var_716 = _loc2_.content as BitmapData;
         var _loc3_:BitmapDataAsset = page.viewer.catalog.assets.getAssetByName(param1.colourAssetName) as BitmapDataAsset;
         var_902 = _loc3_.content as BitmapData;
         var _loc4_:BitmapDataAsset = page.viewer.catalog.assets.getAssetByName(param1.method_18) as BitmapDataAsset;
         var_747 = _loc4_.content as BitmapData;
         populateColourGrid();
         select(_colourGrid.getGridItemAt(0) as IWindowContainer);
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         select(param1.target as IWindowContainer);
         var _loc2_:int = _colourGrid.getGridItemIndex(param1.target as IWindow);
         var _loc3_:int = 0;
         if(_loc2_ >= 0)
         {
            _loc3_ = 0;
         }
         events.dispatchEvent(new CatalogWidgetColourIndexEvent(_loc2_));
      }
      
      override public function dispose() : void
      {
         _colourGrid.destroyGridItems();
         _colourGrid.dispose();
         _colourGrid = null;
         var_1242 = null;
         var_316 = null;
         super.dispose();
      }
   }
}
