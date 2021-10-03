package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1227:String = "WN_CREATED";
      
      public static const const_1058:String = "WN_DISABLE";
      
      public static const const_923:String = "WN_DEACTIVATED";
      
      public static const const_861:String = "WN_OPENED";
      
      public static const const_968:String = "WN_CLOSED";
      
      public static const const_1059:String = "WN_DESTROY";
      
      public static const const_1514:String = "WN_ARRANGED";
      
      public static const const_497:String = "WN_PARENT_RESIZED";
      
      public static const const_963:String = "WN_ENABLE";
      
      public static const const_1060:String = "WN_RELOCATE";
      
      public static const const_929:String = "WN_FOCUS";
      
      public static const const_1039:String = "WN_PARENT_RELOCATED";
      
      public static const const_420:String = "WN_PARAM_UPDATED";
      
      public static const const_590:String = "WN_PARENT_ACTIVATED";
      
      public static const const_156:String = "WN_RESIZED";
      
      public static const const_933:String = "WN_CLOSE";
      
      public static const const_1000:String = "WN_PARENT_REMOVED";
      
      public static const const_252:String = "WN_CHILD_RELOCATED";
      
      public static const const_726:String = "WN_ENABLED";
      
      public static const const_264:String = "WN_CHILD_RESIZED";
      
      public static const const_848:String = "WN_MINIMIZED";
      
      public static const const_601:String = "WN_DISABLED";
      
      public static const const_208:String = "WN_CHILD_ACTIVATED";
      
      public static const const_451:String = "WN_STATE_UPDATED";
      
      public static const const_597:String = "WN_UNSELECTED";
      
      public static const const_411:String = "WN_STYLE_UPDATED";
      
      public static const const_1715:String = "WN_UPDATE";
      
      public static const const_444:String = "WN_PARENT_ADDED";
      
      public static const const_565:String = "WN_RESIZE";
      
      public static const const_677:String = "WN_CHILD_REMOVED";
      
      public static const const_1574:String = "";
      
      public static const const_900:String = "WN_RESTORED";
      
      public static const const_310:String = "WN_SELECTED";
      
      public static const const_855:String = "WN_MINIMIZE";
      
      public static const const_911:String = "WN_FOCUSED";
      
      public static const const_1360:String = "WN_LOCK";
      
      public static const const_345:String = "WN_CHILD_ADDED";
      
      public static const const_1018:String = "WN_UNFOCUSED";
      
      public static const const_388:String = "WN_RELOCATED";
      
      public static const const_1040:String = "WN_DEACTIVATE";
      
      public static const const_1188:String = "WN_CRETAE";
      
      public static const const_876:String = "WN_RESTORE";
      
      public static const const_334:String = "WN_ACTVATED";
      
      public static const const_1363:String = "WN_LOCKED";
      
      public static const const_428:String = "WN_SELECT";
      
      public static const const_949:String = "WN_MAXIMIZE";
      
      public static const const_991:String = "WN_OPEN";
      
      public static const const_663:String = "WN_UNSELECT";
      
      public static const const_1507:String = "WN_ARRANGE";
      
      public static const const_1375:String = "WN_UNLOCKED";
      
      public static const const_1625:String = "WN_UPDATED";
      
      public static const const_1021:String = "WN_ACTIVATE";
      
      public static const const_1203:String = "WN_UNLOCK";
      
      public static const const_973:String = "WN_MAXIMIZED";
      
      public static const const_1037:String = "WN_DESTROYED";
      
      public static const const_954:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1727,cancelable);
      }
   }
}
