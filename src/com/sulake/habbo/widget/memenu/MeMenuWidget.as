package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_682:String = "me_menu_sound_settings";
      
      public static const const_719:String = "me_menu_settings_view";
      
      public static const const_101:String = "me_menu_top_view";
      
      public static const const_1191:String = "me_menu_rooms_view";
      
      public static const const_981:String = "me_menu_dance_moves_view";
      
      public static const const_279:String = "me_menu_my_clothes_view";
      
      public static const const_709:String = "me_menu_effects_view";
       
      
      private var var_1814:Boolean = false;
      
      private var var_402:Boolean = false;
      
      private var var_1520:int = 0;
      
      private var var_68:IEventDispatcher;
      
      private var var_1519:int = 0;
      
      private var var_1812:int = 0;
      
      private var var_1813:Boolean = false;
      
      private var var_270:Boolean = false;
      
      private var var_1815:int = 0;
      
      private var var_1811:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_603:Boolean = false;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1249:int = 0;
      
      private var var_1816:Boolean = false;
      
      private var var_1052:Point;
      
      private var var_35:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param5;
         var_1052 = new Point(0,0);
         var_68 = param4;
         if(param5 != null && false)
         {
            var_1816 = param5.getKey("client.news.embed.enabled","false") == "true";
         }
         changeView(const_101);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_757,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_589,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_642,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_768,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_315,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_562,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_594,onHideAvatarEditor);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_242,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_235,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_625,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_238,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_353,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_109,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_467,onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_158,onCreditBalance);
         super.registerUpdateEvents(param1);
      }
      
      private function onHideAvatarEditor(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_35 != null && var_35.window.name == const_279)
         {
            changeView(const_101);
         }
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!var_402)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_603;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_270)
         {
            return;
         }
         if(var_35.window.name == const_682)
         {
            (var_35 as MeMenuSoundSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1249 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1519 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",var_1519.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_270 && var_35.window.name == const_279))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_647);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_757,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_589,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_642,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_768,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_315,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_242,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_235,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_625,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_562,onHideAvatarEditor);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_594,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_238,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_353,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_467,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_109,onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_158,onCreditBalance);
      }
      
      override public function dispose() : void
      {
         hide();
         var_68 = null;
         if(var_35 != null)
         {
            var_35.dispose();
            var_35 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_1814;
      }
      
      public function get creditBalance() : int
      {
         return var_1519;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1811 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_467:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_270 + " view: " + var_35.window.name);
               if(var_270 != true || var_35.window.name != const_101)
               {
                  return;
               }
               (var_35 as MeMenuMainView).setIconAssets("clothes_icon",const_101,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_109:
               hide();
         }
      }
      
      public function get isDancing() : Boolean
      {
         return var_1813;
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1811 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_1812;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_603 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_603 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = param1.daysLeft != var_1249;
         var_1249 = param1.daysLeft;
         var_1812 = param1.periodsLeft;
         var_1815 = param1.pastPeriods;
         var_1814 = param1.allowClubDances;
         _loc2_ = Boolean(_loc2_ || param1.clubLevel != var_1520);
         var_1520 = param1.clubLevel;
         if(_loc2_)
         {
            if(var_35 != null)
            {
               changeView(var_35.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_1813 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_35 != null && var_35.window.name != const_279)
         {
            hide();
         }
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1251,HabboWindowStyle.const_1035,HabboWindowParam.const_34,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_603 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_603 = true;
            }
         }
         if(var_35 != null && var_35.window.name == const_709)
         {
            (var_35 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_1815;
      }
      
      public function get habboClubDays() : int
      {
         return var_1249;
      }
      
      public function updateSize() : void
      {
         if(var_35 != null)
         {
            var_1052.x = var_35.window.width + 10;
            var_1052.y = var_35.window.height;
            var_35.window.x = 5;
            var_35.window.y = 0;
            _mainContainer.width = var_1052.x;
            _mainContainer.height = var_1052.y;
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_270 = !var_270;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_270 = false;
               break;
            default:
               return;
         }
         if(var_270)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_727);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_35 != null)
         {
            _mainContainer.removeChild(var_35.window);
            var_35.dispose();
            var_35 = null;
         }
         var_270 = false;
         var_68.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_35 != null && var_35.window.name == const_279)
         {
            changeView(const_101);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return var_1816;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case const_101:
               _loc2_ = new MeMenuMainView();
               var_68.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_709:
               _loc2_ = new MeMenuEffectsView();
               var_68.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_981:
               _loc2_ = new MeMenuDanceView();
               var_68.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_279:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1191:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_719:
               _loc2_ = new MeMenuSettingsMenuView();
               break;
            case const_682:
               _loc2_ = new MeMenuSoundSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_35 != null)
            {
               _mainContainer.removeChild(var_35.window);
               var_35.dispose();
               var_35 = null;
            }
            var_35 = _loc2_;
            var_35.init(this,param1);
         }
         updateSize();
      }
      
      public function get habboClubLevel() : int
      {
         return var_1520;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function show() : void
      {
         if(!_mainContainer || true)
         {
            return;
         }
         changeView(const_101);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_707);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_270 = true;
      }
   }
}
