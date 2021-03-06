package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class PopupCtrl
   {
       
      
      private var var_388:Timer;
      
      private var _navigator:HabboNavigator;
      
      private var _popupIndentLeft:int;
      
      private var var_1984:int;
      
      private var var_335:Timer;
      
      private var var_1275:String;
      
      private var var_52:IWindowContainer;
      
      public function PopupCtrl(param1:HabboNavigator, param2:int, param3:int, param4:String)
      {
         var_388 = new Timer(500,1);
         var_335 = new Timer(100,1);
         super();
         _navigator = param1;
         var_1275 = param4;
         var_1984 = param2;
         _popupIndentLeft = param3;
         var_388.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_335.addEventListener(TimerEvent.TIMER,onHideTimer);
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         if(var_52 != null)
         {
            var_52.visible = false;
         }
      }
      
      public function hideInstantly() : void
      {
         if(var_52 != null)
         {
            var_52.visible = false;
         }
         this.var_388.reset();
         this.var_335.reset();
      }
      
      private function onPopup(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 as WindowMouseEvent == null)
         {
            return;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            this.var_335.reset();
         }
         else if(param1.type == WindowMouseEvent.const_27)
         {
            if(!Util.containsMouse(var_52))
            {
               this.closePopup();
            }
         }
      }
      
      public function closePopup() : void
      {
         var_335.reset();
         var_388.reset();
         var_335.start();
      }
      
      public function get navigator() : HabboNavigator
      {
         return _navigator;
      }
      
      public function method_4(param1:IWindowContainer) : void
      {
      }
      
      public function dispose() : void
      {
         _navigator = null;
         if(var_388)
         {
            var_388.removeEventListener(TimerEvent.TIMER,onDisplayTimer);
            var_388.reset();
            var_388 = null;
         }
         if(var_335)
         {
            var_335.removeEventListener(TimerEvent.TIMER,onHideTimer);
            var_335.reset();
            var_335 = null;
         }
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         this.var_52.visible = true;
         this.var_52.activate();
      }
      
      public function showPopup(param1:IWindow) : void
      {
         if(var_52 == null)
         {
            var_52 = IWindowContainer(_navigator.getXmlWindow(var_1275));
            var_52.visible = false;
            var_52.setParamFlag(HabboWindowParam.const_37,true);
            var_52.procedure = onPopup;
         }
         Util.hideChildren(var_52);
         method_4(var_52);
         var_52.height = Util.getLowestPoint(var_52) + 5;
         var _loc2_:Point = new Point();
         param1.getGlobalPosition(_loc2_);
         var_52.x = _loc2_.x + var_1984 + param1.width;
         var_52.y = _loc2_.y - 0 + param1.height * 0.5;
         var _loc3_:Point = new Point();
         var_52.getGlobalPosition(_loc3_);
         if(_loc3_.x + var_52.width > var_52.desktop.width)
         {
            var_52.x = 0 + _loc2_.x + _popupIndentLeft;
            refreshPopupArrows(var_52,false);
         }
         else
         {
            refreshPopupArrows(var_52,true);
         }
         if(true)
         {
            var_388.reset();
            var_388.start();
         }
         var_335.reset();
         var_52.activate();
      }
      
      public function get visible() : Boolean
      {
         return this.var_52 != null && this.var_52.visible;
      }
      
      private function refreshPopupArrow(param1:IWindowContainer, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:String = "popup_arrow_" + (!!param2 ? "left" : "right");
         var _loc5_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName(_loc4_));
         if(!param3)
         {
            if(_loc5_ != null)
            {
               _loc5_.visible = false;
            }
         }
         else
         {
            if(_loc5_ == null)
            {
               _loc5_ = _navigator.getButton(_loc4_,_loc4_,null);
               _loc5_.setParamFlag(HabboWindowParam.const_71,false);
               param1.addChild(_loc5_);
            }
            _loc5_.visible = true;
            _loc5_.y = param1.height * 0.5 - _loc5_.height * 0.5;
            _loc5_.x = !!param2 ? int(1 - _loc5_.width) : int(param1.width - 1);
         }
      }
      
      private function refreshPopupArrows(param1:IWindowContainer, param2:Boolean) : void
      {
         refreshPopupArrow(param1,true,param2);
         refreshPopupArrow(param1,false,!param2);
      }
   }
}
