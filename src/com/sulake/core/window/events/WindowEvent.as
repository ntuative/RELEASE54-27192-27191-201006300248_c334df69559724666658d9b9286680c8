package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_256:String = "WE_CHILD_RESIZED";
      
      public static const const_1395:String = "WE_CLOSE";
      
      public static const const_1224:String = "WE_DESTROY";
      
      public static const const_126:String = "WE_CHANGE";
      
      public static const const_1202:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1580:String = "WE_PARENT_RESIZE";
      
      public static const const_93:String = "WE_UPDATE";
      
      public static const const_1278:String = "WE_MAXIMIZE";
      
      public static const const_426:String = "WE_DESTROYED";
      
      public static const const_860:String = "WE_UNSELECT";
      
      public static const const_1321:String = "WE_MAXIMIZED";
      
      public static const const_1658:String = "WE_UNLOCKED";
      
      public static const const_447:String = "WE_CHILD_REMOVED";
      
      public static const const_164:String = "WE_OK";
      
      public static const const_42:String = "WE_RESIZED";
      
      public static const const_1218:String = "WE_ACTIVATE";
      
      public static const const_271:String = "WE_ENABLED";
      
      public static const const_448:String = "WE_CHILD_RELOCATED";
      
      public static const const_1371:String = "WE_CREATE";
      
      public static const const_551:String = "WE_SELECT";
      
      public static const const_165:String = "";
      
      public static const const_1654:String = "WE_LOCKED";
      
      public static const const_1524:String = "WE_PARENT_RELOCATE";
      
      public static const const_1581:String = "WE_CHILD_REMOVE";
      
      public static const const_1510:String = "WE_CHILD_RELOCATE";
      
      public static const const_1518:String = "WE_LOCK";
      
      public static const const_225:String = "WE_FOCUSED";
      
      public static const const_751:String = "WE_UNSELECTED";
      
      public static const const_910:String = "WE_DEACTIVATED";
      
      public static const const_1287:String = "WE_MINIMIZED";
      
      public static const const_1649:String = "WE_ARRANGED";
      
      public static const const_1546:String = "WE_UNLOCK";
      
      public static const const_1511:String = "WE_ATTACH";
      
      public static const const_1415:String = "WE_OPEN";
      
      public static const const_1248:String = "WE_RESTORE";
      
      public static const const_1642:String = "WE_PARENT_RELOCATED";
      
      public static const const_1226:String = "WE_RELOCATE";
      
      public static const const_1571:String = "WE_CHILD_RESIZE";
      
      public static const const_1532:String = "WE_ARRANGE";
      
      public static const const_1416:String = "WE_OPENED";
      
      public static const const_1228:String = "WE_CLOSED";
      
      public static const const_1624:String = "WE_DETACHED";
      
      public static const const_1591:String = "WE_UPDATED";
      
      public static const const_1310:String = "WE_UNFOCUSED";
      
      public static const const_453:String = "WE_RELOCATED";
      
      public static const const_1373:String = "WE_DEACTIVATE";
      
      public static const const_221:String = "WE_DISABLED";
      
      public static const const_583:String = "WE_CANCEL";
      
      public static const const_639:String = "WE_ENABLE";
      
      public static const const_1390:String = "WE_ACTIVATED";
      
      public static const const_1320:String = "WE_FOCUS";
      
      public static const const_1620:String = "WE_DETACH";
      
      public static const const_1378:String = "WE_RESTORED";
      
      public static const const_1358:String = "WE_UNFOCUS";
      
      public static const const_54:String = "WE_SELECTED";
      
      public static const const_1424:String = "WE_PARENT_RESIZED";
      
      public static const const_1420:String = "WE_CREATED";
      
      public static const const_1577:String = "WE_ATTACHED";
      
      public static const const_1316:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1727:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1492:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1727 = param3;
         var_1492 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1492;
      }
      
      public function get related() : IWindow
      {
         return var_1727;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1492 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
