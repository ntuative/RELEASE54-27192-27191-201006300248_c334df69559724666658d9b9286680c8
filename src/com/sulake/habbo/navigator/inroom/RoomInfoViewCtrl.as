package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.GetEventsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.navigator.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_756:IWindowContainer;
      
      private var var_1106:ITextWindow;
      
      private var var_179:RoomSettingsCtrl;
      
      private var var_1322:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_206:Timer;
      
      private var var_2028:IWindowContainer;
      
      private var var_1320:ITextWindow;
      
      private var var_371:IWindowContainer;
      
      private var var_2029:ITextWindow;
      
      private var var_917:IWindowContainer;
      
      private var var_207:UserDefinedRoomEventsCtrl;
      
      private var var_1589:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_807:ITextWindow;
      
      private var var_1593:IWindowContainer;
      
      private var var_1324:IWindowContainer;
      
      private var var_918:ITextWindow;
      
      private var var_1105:ITextFieldWindow;
      
      private var var_277:IWindowContainer;
      
      private var var_916:ITextWindow;
      
      private var var_1590:IButtonWindow;
      
      private var var_1104:ITextWindow;
      
      private var var_2454:int;
      
      private var var_1323:IContainerButtonWindow;
      
      private var var_915:IWindowContainer;
      
      private var var_1326:ITextWindow;
      
      private var var_1321:IContainerButtonWindow;
      
      private var var_1592:ITextWindow;
      
      private var var_993:TagRenderer;
      
      private var var_1591:IButtonWindow;
      
      private var var_1750:ITextWindow;
      
      private var var_320:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_757:ITextWindow;
      
      private var var_233:RoomThumbnailCtrl;
      
      private var var_1325:IContainerButtonWindow;
      
      private var var_2027:IWindowContainer;
      
      private var var_278:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_320 = new RoomEventViewCtrl(_navigator);
         var_179 = new RoomSettingsCtrl(_navigator,this,true);
         var_233 = new RoomThumbnailCtrl(_navigator);
         var_207 = new UserDefinedRoomEventsCtrl(_navigator);
         var_993 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_179);
         var_206 = new Timer(6000,1);
         var_206.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_179.active = true;
         this.var_320.active = false;
         this.var_233.active = false;
         this.var_207.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1589.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1591.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1593.visible = Util.hasVisibleChildren(var_1593);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false || false)
         {
            return;
         }
         var_807.text = param1.roomName;
         var_807.height = NaN;
         _ownerName.text = param1.ownerName;
         var_918.text = param1.description;
         var_993.refreshTags(var_371,param1.tags);
         var_918.visible = false;
         if(param1.description != "")
         {
            var_918.height = NaN;
            var_918.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_371,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_371,"thumb_down",_loc3_,onThumbDown,0);
         var_2029.visible = _loc3_;
         var_916.visible = !_loc3_;
         var_1592.visible = !_loc3_;
         var_1592.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_371,"home",param2,null,0);
         _navigator.refreshButton(var_371,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.method_3(var_371,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_807.y,0);
         var_371.visible = true;
         var_371.height = Util.getLowestPoint(var_371);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function startUserDefinedRoomEventsEdit() : void
      {
         this.var_206.reset();
         this.var_179.active = false;
         this.var_320.active = false;
         this.var_233.active = false;
         this.var_207.active = true;
         _navigator.send(new GetEventsMessageComposer());
      }
      
      public function dispose() : void
      {
         if(var_206)
         {
            var_206.removeEventListener(TimerEvent.TIMER,hideInfo);
            var_206.reset();
            var_206 = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_449,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false || false)
         {
            return;
         }
         var_1590.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1322.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1325.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1323.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1321.visible = _navigator.data.canEditRoomSettings && param1;
         var_1324.visible = Util.hasVisibleChildren(var_1324);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_206.reset();
         this.var_320.active = false;
         this.var_179.active = false;
         this.var_233.active = false;
         this.var_207.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_206.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_206.reset();
         this.var_320.active = false;
         this.var_179.active = false;
         this.var_233.active = false;
         this.var_207.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_449,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_277);
         var_277.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == _navigator.data.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_179.refresh(var_277);
         this.var_233.refresh(var_277);
         this.var_207.refresh(var_277);
         Util.method_3(var_277,["room_details","room_buttons"],0,2);
         var_277.height = Util.getLowestPoint(var_277);
         var_277.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1105.setSelection(0,var_1105.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_278);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_320.refresh(var_278);
         if(Util.hasVisibleChildren(var_278) && !(this.var_233.active || this.var_207.active))
         {
            Util.method_3(var_278,["event_details","event_buttons"],0,2);
            var_278.height = Util.getLowestPoint(var_278);
            var_278.visible = true;
         }
         else
         {
            var_278.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_206.reset();
         this.var_320.active = true;
         this.var_179.active = false;
         this.var_233.active = false;
         this.var_207.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_206.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false || false)
         {
            return;
         }
         var_1106.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1106.height = NaN;
         var_1320.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1320.height = NaN;
         Util.method_3(var_756,["public_space_name","public_space_desc"],var_1106.y,0);
         var_756.visible = true;
         var_756.height = Math.max(86,Util.getLowestPoint(var_756));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function get userDefinedRoomEventsCtrl() : UserDefinedRoomEventsCtrl
      {
         return var_207;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         if(_loc1_ && true && true && true && true)
         {
            var_915.visible = true;
            var_1105.text = this.getEmbedData();
         }
         else
         {
            var_915.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_206.reset();
         this.var_179.load(param1);
         this.var_179.active = true;
         this.var_320.active = false;
         this.var_233.active = false;
         this.var_207.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_206.reset();
         this.var_179.active = false;
         this.var_320.active = false;
         this.var_233.active = true;
         this.var_207.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_71,false);
         _window.setParamFlag(HabboWindowParam.const_1270,true);
         _window.visible = false;
         var_277 = IWindowContainer(find("room_info"));
         var_371 = IWindowContainer(find("room_details"));
         var_756 = IWindowContainer(find("public_space_details"));
         var_2027 = IWindowContainer(find("owner_name_cont"));
         var_2028 = IWindowContainer(find("rating_cont"));
         var_1324 = IWindowContainer(find("room_buttons"));
         var_807 = ITextWindow(find("room_name"));
         var_1106 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_918 = ITextWindow(find("room_desc"));
         var_1320 = ITextWindow(find("public_space_desc"));
         var_1104 = ITextWindow(find("owner_caption"));
         var_916 = ITextWindow(find("rating_caption"));
         var_2029 = ITextWindow(find("rate_caption"));
         var_1592 = ITextWindow(find("rating_txt"));
         var_278 = IWindowContainer(find("event_info"));
         var_917 = IWindowContainer(find("event_details"));
         var_1593 = IWindowContainer(find("event_buttons"));
         var_1750 = ITextWindow(find("event_name"));
         var_757 = ITextWindow(find("event_desc"));
         var_1322 = IContainerButtonWindow(find("add_favourite_button"));
         var_1325 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1323 = IContainerButtonWindow(find("make_home_button"));
         var_1321 = IContainerButtonWindow(find("unmake_home_button"));
         var_1590 = IButtonWindow(find("room_settings_button"));
         var_1589 = IButtonWindow(find("create_event_button"));
         var_1591 = IButtonWindow(find("edit_event_button"));
         var_915 = IWindowContainer(find("embed_info"));
         var_1326 = ITextWindow(find("embed_info_txt"));
         var_1105 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1322,onAddFavouriteClick);
         Util.setProcDirectly(var_1325,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1590,onRoomSettingsClick);
         Util.setProcDirectly(var_1323,onMakeHomeClick);
         Util.setProcDirectly(var_1321,onUnmakeHomeClick);
         Util.setProcDirectly(var_1589,onEventSettingsClick);
         Util.setProcDirectly(var_1591,onEventSettingsClick);
         Util.setProcDirectly(var_1105,onEmbedSrcClick);
         _navigator.refreshButton(var_1322,"favourite",true,null,0);
         _navigator.refreshButton(var_1325,"favourite",true,null,0);
         _navigator.refreshButton(var_1323,"home",true,null,0);
         _navigator.refreshButton(var_1321,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_277,onHover);
         Util.setProcDirectly(var_278,onHover);
         var_1104.width = var_1104.textWidth;
         Util.moveChildrenToRow(var_2027,["owner_caption","owner_name"],var_1104.x,var_1104.y,3);
         var_916.width = var_916.textWidth;
         Util.moveChildrenToRow(var_2028,["rating_caption","rating_txt"],var_916.x,var_916.y,3);
         var_1326.height = NaN;
         Util.method_3(var_915,["embed_info_txt","embed_src_txt"],var_1326.y,2);
         var_915.height = Util.getLowestPoint(var_915) + 5;
         var_2454 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1750.text = param1.eventName;
         var_757.text = param1.eventDescription;
         var_993.refreshTags(var_917,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_757.visible = false;
         if(param1.eventDescription != "")
         {
            var_757.height = NaN;
            var_757.y = Util.getLowestPoint(var_917) + 2;
            var_757.visible = true;
         }
         var_917.visible = true;
         var_917.height = Util.getLowestPoint(var_917);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.method_3(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_956,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
