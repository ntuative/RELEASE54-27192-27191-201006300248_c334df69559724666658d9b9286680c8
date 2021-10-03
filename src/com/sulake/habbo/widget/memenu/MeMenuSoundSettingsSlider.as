package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MeMenuSoundSettingsSlider
   {
       
      
      private var _sliderContainer:IWindowContainer;
      
      private var var_897:MeMenuSoundSettingsView;
      
      private var var_1078:Number = 1.0;
      
      private var var_623:BitmapData;
      
      private var var_622:BitmapData;
      
      private var var_1569:int;
      
      private var var_740:Number = 0.0;
      
      public function MeMenuSoundSettingsSlider(param1:MeMenuSoundSettingsView, param2:IWindowContainer, param3:IAssetLibrary, param4:Number = 0.0, param5:Number = 1.0)
      {
         super();
         var_897 = param1;
         _sliderContainer = param2;
         var_740 = param4;
         var_1078 = param5;
         storeAssets(param3);
         displaySlider();
      }
      
      private function getSliderPosition(param1:Number) : int
      {
         return int(var_1569 * (Number(param1 - var_740) / (var_1078 - var_740)));
      }
      
      private function displaySlider() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_sliderContainer == null)
         {
            return;
         }
         _loc2_ = _sliderContainer.findChildByName("slider_base") as IBitmapWrapperWindow;
         if(_loc2_ != null && var_623 != null)
         {
            _loc2_.bitmap = new BitmapData(var_623.width,var_623.height,true,16777215);
            _loc2_.bitmap.copyPixels(var_623,var_623.rect,new Point(0,0),null,null,true);
         }
         _loc1_ = _sliderContainer.findChildByName("slider_movement_area") as IWindowContainer;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.findChildByName("slider_button") as IBitmapWrapperWindow;
            if(_loc2_ != null && var_622 != null)
            {
               _loc2_.bitmap = new BitmapData(var_622.width,var_622.height,true,16777215);
               _loc2_.bitmap.copyPixels(var_622,var_622.rect,new Point(0,0),null,null,true);
               _loc2_.procedure = buttonProcedure;
               var_1569 = _loc1_.width - _loc2_.width;
            }
         }
      }
      
      private function storeAssets(param1:IAssetLibrary) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_base"));
         var_623 = BitmapData(_loc2_.content);
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_button"));
         var_622 = BitmapData(_loc2_.content);
      }
      
      public function set max(param1:Number) : void
      {
         var_1078 = param1;
         setValue(var_897.volume);
      }
      
      public function set min(param1:Number) : void
      {
         var_740 = param1;
         setValue(var_897.volume);
      }
      
      public function setValue(param1:Number) : void
      {
         if(_sliderContainer == null)
         {
            return;
         }
         var _loc2_:IWindow = _sliderContainer.findChildByName("slider_button");
         if(_loc2_ != null)
         {
            _loc2_.x = getSliderPosition(param1);
         }
      }
      
      private function buttonProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_453)
         {
            return;
         }
         var_897.saveVolume(getValue(param2.x),false);
      }
      
      private function getValue(param1:Number) : Number
      {
         return param1 / var_1569 * (var_1078 - var_740) + var_740;
      }
      
      public function dispose() : void
      {
         var_897 = null;
         _sliderContainer = null;
         var_623 = null;
         var_622 = null;
      }
   }
}
