package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      private static const const_1096:int = 100;
      
      private static const const_1093:int = 200;
      
      private static const const_1094:int = 180;
      
      public static const const_1057:int = 1;
      
      public static const const_440:int = 2;
      
      private static const const_1095:int = 250;
      
      private static const const_783:int = 5;
       
      
      private var var_612:BitmapData;
      
      private var var_313:Timer;
      
      private var var_12:IWindowContainer;
      
      private var var_735:BitmapData;
      
      private var var_314:Timer;
      
      private var var_73:IWindowContainer;
      
      private var var_1544:int = 2;
      
      private var _assets:IAssetLibrary;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         var_314 = new Timer(const_1095,1);
         var_313 = new Timer(const_1096,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         var_73 = param1;
         var_73.visible = false;
         _assets = param2;
         var_314.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_313.addEventListener(TimerEvent.TIMER,onHideTimer);
         var _loc3_:BitmapDataAsset = _assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_735 = _loc3_.content as BitmapData;
         }
         _loc3_ = _assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_612 = _loc3_.content as BitmapData;
         }
      }
      
      public function hide() : void
      {
         var_73.visible = false;
         var_313.reset();
         var_314.reset();
         if(var_12 != null)
         {
            var_12.removeChild(var_73);
         }
      }
      
      public function hideDelayed() : void
      {
         var_313.reset();
         var_314.reset();
         var_313.start();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         hide();
      }
      
      public function dispose() : void
      {
         if(var_314 != null)
         {
            var_314.removeEventListener(TimerEvent.TIMER,onDisplayTimer);
            var_314.stop();
            var_314 = null;
         }
         if(var_313 != null)
         {
            var_313.removeEventListener(TimerEvent.TIMER,onHideTimer);
            var_313.stop();
            var_313 = null;
         }
         _assets = null;
         var_73 = null;
         var_12 = null;
         var_612 = null;
         var_735 = null;
      }
      
      public function showDelayed() : void
      {
         var_313.reset();
         var_314.reset();
         var_314.start();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         show();
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(var_73 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(var_12 != null)
         {
            var_12.removeChild(var_73);
         }
         var_12 = param1;
         var_1544 = param4;
         var _loc5_:ITextWindow = ITextWindow(var_73.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = var_73.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1094,param3.width),Math.min(const_1093,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (0 - _loc6_.width) / 2;
            var_73.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(var_73 == null || false)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(var_73.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_1057:
               _loc2_.bitmap = var_735.clone();
               _loc2_.width = var_735.width;
               _loc2_.height = var_735.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = -1;
               break;
            case const_440:
               _loc2_.bitmap = var_612.clone();
               _loc2_.width = var_612.width;
               _loc2_.height = var_612.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = 1;
         }
         _loc2_.invalidate();
      }
      
      public function show() : void
      {
         var_313.reset();
         var_314.reset();
         if(var_12 == null)
         {
            return;
         }
         var_73.visible = true;
         var_12.addChild(var_73);
         refreshArrow(var_1544);
         switch(var_1544)
         {
            case const_1057:
               var_73.x = 0 - const_783;
               break;
            case const_440:
               var_73.x = var_12.width + const_783;
         }
         var_73.y = (0 - 0) / 2;
      }
   }
}
