package com.sulake.habbo.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.utils.INotify;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboAlertDialogFlag;
   
   public class AlertDialog implements IAlertDialog, INotify
   {
      
      private static const const_1126:String = "_alert_button_list";
      
      private static const const_791:String = "_alert_button_cancel";
      
      private static const const_755:String = "_alert_button_ok";
      
      private static const const_1402:String = "_alert_text_summary";
      
      private static var var_698:uint = 0;
      
      private static const const_792:String = "_alert_button_custom";
       
      
      protected var _disposed:Boolean = false;
      
      protected var _window:IFrameWindow;
      
      protected var _title:String = "";
      
      protected var var_196:Function = null;
      
      protected var var_1292:String = "";
      
      public function AlertDialog(param1:IHabboWindowManager, param2:XML, param3:String, param4:String, param5:uint, param6:Function)
      {
         var _loc8_:* = null;
         super();
         ++var_698;
         _window = param1.buildFromXML(param2,2) as IFrameWindow;
         if(param5 == HabboAlertDialogFlag.const_34)
         {
            param5 = 0 | 0 | 0;
         }
         var _loc7_:IItemListWindow = _window.findChildByName(const_1126) as IItemListWindow;
         if(_loc7_)
         {
            if(!(param5 & 0))
            {
               _loc8_ = _loc7_.getListItemByName(const_755);
               _loc8_.dispose();
            }
            if(!(param5 & 0))
            {
               _loc8_ = _loc7_.getListItemByName(const_791);
               _loc8_.dispose();
            }
            if(!(param5 & 0))
            {
               _loc8_ = _loc7_.getListItemByName(const_792);
               _loc8_.dispose();
            }
         }
         _window.procedure = dialogEventProc;
         _window.center();
         this.title = param3;
         this.summary = param4;
         this.callback = param6;
      }
      
      public function set callback(param1:Function) : void
      {
         var_196 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1292 = param1;
         if(_window)
         {
            ITextWindow(_window.findChildByTag("DESCRIPTION")).text = var_1292;
         }
      }
      
      public function setButtonCaption(param1:int, param2:ICaption) : void
      {
      }
      
      public function get callback() : Function
      {
         return var_196;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(_window && true)
            {
               _window.dispose();
               _window = null;
            }
            var_196 = null;
            _disposed = true;
         }
      }
      
      protected function dialogEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "_alert_button_ok":
                  if(var_196 != null)
                  {
                     var_196(this,new WindowEvent(WindowEvent.const_164,null,null));
                  }
                  break;
               case "header_button_close":
                  if(var_196 != null)
                  {
                     var_196(this,new WindowEvent(WindowEvent.const_583,null,null));
                  }
            }
         }
      }
      
      public function getButtonCaption(param1:int) : ICaption
      {
         var _loc2_:* = null;
         if(!_disposed)
         {
            switch(param1)
            {
               case HabboAlertDialogFlag.const_755:
                  _loc2_ = _window.findChildByName(const_755) as IInteractiveWindow;
                  break;
               case HabboAlertDialogFlag.const_791:
                  _loc2_ = _window.findChildByName(const_791) as IInteractiveWindow;
                  break;
               case HabboAlertDialogFlag.const_792:
                  _loc2_ = _window.findChildByName(const_792) as IInteractiveWindow;
            }
         }
         return !!_loc2_ ? new AlertDialogCaption(_loc2_.caption,_loc2_.toolTipCaption,_loc2_.visible) : null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get summary() : String
      {
         return var_1292;
      }
      
      public function set title(param1:String) : void
      {
         _title = param1;
         if(_window)
         {
            _window.caption = _title;
         }
      }
      
      public function get title() : String
      {
         return _title;
      }
   }
}
