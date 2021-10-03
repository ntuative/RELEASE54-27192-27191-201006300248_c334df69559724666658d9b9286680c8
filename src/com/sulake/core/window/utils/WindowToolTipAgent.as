package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IWindowToolTipAgentService
   {
       
      
      protected var var_342:Timer;
      
      protected var var_1022:String;
      
      protected var var_1021:uint;
      
      protected var var_1200:Point;
      
      protected var var_261:IToolTipWindow;
      
      protected var var_1201:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         var_1200 = new Point();
         var_1201 = new Point(20,20);
         var_1021 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(var_342 != null)
         {
            var_342.stop();
            var_342.removeEventListener(TimerEvent.TIMER,showToolTip);
            var_342 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,var_1200);
            if(var_261 != null && true)
            {
               var_261.x = param1 + var_1201.x;
               var_261.y = param2 + var_1201.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(var_342 != null)
         {
            var_342.reset();
         }
         if(_window && true)
         {
            if(var_261 == null || false)
            {
               var_261 = _window.context.create("undefined::ToolTip",var_1022,WindowType.const_339,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_261.x = _loc2_.x + var_1200.x + var_1201.x;
            var_261.y = _loc2_.y + var_1200.y + var_1201.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               var_1022 = IInteractiveWindow(param1).toolTipCaption;
               var_1021 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               var_1022 = param1.caption;
               var_1021 = 500;
            }
            _mouse.x = var_125.mouseX;
            _mouse.y = var_125.mouseY;
            getMousePositionRelativeTo(param1,_mouse,var_1200);
            if(var_1022 != null && var_1022 != "")
            {
               if(var_342 == null)
               {
                  var_342 = new Timer(var_1021,1);
                  var_342.addEventListener(TimerEvent.TIMER,showToolTip);
               }
               var_342.reset();
               var_342.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(var_261 != null && true)
         {
            var_261.destroy();
            var_261 = null;
         }
      }
   }
}
