package com.sulake.habbo.ui
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IHabboAvatarEditorDataSaver;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.events.AvatarEditorClosedEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryEffectsEvent;
   import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.session.IUserData;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.session.events.SessionCreditBalanceEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetAvatarEditorMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetClothingChangeMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetDanceMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetEffectsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetSettingsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetNavigateToRoomMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenCatalogMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenInventoryMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectEffectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSetToolbarIconMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetShowOwnRoomsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetStopEffectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetStoreSettingsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetWaveMessage;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class MeMenuWidgetHandler implements IRoomWidgetHandler, IHabboAvatarEditorDataSaver, IAvatarImageListener
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var _isDisposed:Boolean = false;
      
      private var var_14:IHabboInventory;
      
      private var _catalog:IHabboCatalog;
      
      private var var_1418:String;
      
      private var _toolbar:IHabboToolbar;
      
      public function MeMenuWidgetHandler()
      {
         super();
         Logger.log("[MeMenuWidgetHandler]");
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:Boolean = false;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         if(!param1)
         {
            return null;
         }
         switch(param1.type)
         {
            case RoomWidgetRequestWidgetMessage.const_647:
               if(_container != null && false && _container.toolbar.events != null)
               {
                  _loc7_ = new HabboToolbarEvent(HabboToolbarEvent.const_53);
                  _loc7_.iconId = HabboToolbarIconEnum.MEMENU;
                  _container.toolbar.events.dispatchEvent(_loc7_);
               }
               break;
            case RoomWidgetWaveMessage.const_758:
               if(_container != null && false)
               {
                  _container.roomSession.sendWaveMessage();
               }
               break;
            case RoomWidgetDanceMessage.const_635:
               if(_container != null && false)
               {
                  _loc8_ = param1 as RoomWidgetDanceMessage;
                  if(_loc8_ != null)
                  {
                     _container.roomSession.sendDanceMessage(_loc8_.style);
                  }
               }
               break;
            case RoomWidgetGetEffectsMessage.const_556:
               if(var_14 != null)
               {
                  _loc9_ = var_14.getAvatarEffects();
                  _container.events.dispatchEvent(new RoomWidgetUpdateEffectsUpdateEvent(_loc9_));
               }
               break;
            case RoomWidgetSelectEffectMessage.const_541:
               if(var_14 != null)
               {
                  _loc10_ = param1 as RoomWidgetSelectEffectMessage;
                  var_14.setEffectSelected(_loc10_.effectType);
               }
               break;
            case RoomWidgetSelectEffectMessage.const_711:
               if(var_14 != null)
               {
                  _loc11_ = param1 as RoomWidgetSelectEffectMessage;
                  var_14.setEffectDeselected(_loc11_.effectType);
               }
               break;
            case RoomWidgetOpenCatalogMessage.const_584:
               _loc2_ = param1 as RoomWidgetOpenCatalogMessage;
               if(_catalog != null && _loc2_.pageKey == RoomWidgetOpenCatalogMessage.const_977)
               {
                  _catalog.openCatalogPage(CatalogPageName.const_245,true);
               }
               break;
            case RoomWidgetOpenInventoryMessage.const_679:
               _loc3_ = param1 as RoomWidgetOpenInventoryMessage;
               if(var_14 != null)
               {
                  Logger.log("MeMenuWidgetHandler open inventory: " + _loc3_.inventoryType);
                  switch(_loc3_.inventoryType)
                  {
                     case RoomWidgetOpenInventoryMessage.const_1010:
                        _catalog.openCatalogPage(CatalogPageName.const_1353,true);
                        break;
                     case RoomWidgetOpenInventoryMessage.const_872:
                        var_14.toggleInventoryPage(InventoryCategory.const_253);
                        break;
                     case RoomWidgetOpenInventoryMessage.const_1212:
                        var_14.toggleInventoryPage(InventoryCategory.const_76);
                        break;
                     case RoomWidgetOpenInventoryMessage.const_1405:
                        break;
                     default:
                        Logger.log("MeMenuWidgetHandler: unknown inventory type: " + _loc3_.inventoryType);
                  }
               }
               break;
            case RoomWidgetSelectEffectMessage.const_658:
            case RoomWidgetStopEffectMessage.const_537:
               Logger.log("STOP ALL EFFECTS");
               if(var_14 != null)
               {
                  var_14.deselectAllEffects();
               }
               break;
            case RoomWidgetSetToolbarIconMessage.const_904:
               _loc4_ = param1 as RoomWidgetSetToolbarIconMessage;
               switch(_loc4_.widgetType)
               {
                  case RoomWidgetSetToolbarIconMessage.const_1213:
                     break;
                  default:
                     Logger.log("MeMenuWidgetHandler: unknown icon widget type: " + _loc4_.widgetType);
               }
               break;
            case RoomWidgetNavigateToRoomMessage.const_866:
               Logger.log("MeMenuWidgetHandler: GO HOME");
               if(_container != null)
               {
                  _container.navigator.goToHomeRoom();
               }
               break;
            case RoomWidgetShowOwnRoomsMessage.const_549:
               if(_container != null)
               {
                  _container.navigator.showOwnRooms();
               }
               break;
            case RoomWidgetToolbarMessage.const_707:
               _loc5_ = param1 as RoomWidgetToolbarMessage;
               if(!_loc5_ || !_container || true)
               {
                  return null;
               }
               if(_toolbar)
               {
                  _toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.MEMENU,_loc5_.window));
                  if(var_14 != null)
                  {
                     _loc12_ = false;
                     if(_container != null && false)
                     {
                        _loc12_ = _container.sessionDataManager.hasUserRight("fuse_use_club_dance");
                     }
                     _container.events.dispatchEvent(new RoomWidgetHabboClubUpdateEvent(var_14.clubDays,var_14.clubPeriods,var_14.clubPastPeriods,_loc12_,var_14.clubLevel));
                  }
                  if(_catalog != null && _catalog.getPurse() != null)
                  {
                     _container.events.dispatchEvent(new RoomWidgetCreditBalanceUpdateEvent(_catalog.getPurse().credits));
                  }
               }
               if(true || !_container.roomSession.userDataManager)
               {
                  return null;
               }
               if(false)
               {
                  _loc13_ = _container.sessionDataManager != null ? int(_container.sessionDataManager.userId) : -1;
                  _loc14_ = _container.roomSession.userDataManager.getUserData(_loc13_);
                  if(!_loc14_)
                  {
                     return null;
                  }
                  _loc15_ = 0;
                  _loc16_ = 0;
                  _container.roomEngine.selectAvatar(_loc15_,_loc16_,_loc14_.id,true);
               }
               break;
            case RoomWidgetToolbarMessage.const_727:
               _loc6_ = param1 as RoomWidgetToolbarMessage;
               if(!_loc6_)
               {
                  return null;
               }
               if(_toolbar && false)
               {
                  _toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_449,HabboToolbarIconEnum.MEMENU,_loc6_.window));
               }
               break;
            case RoomWidgetAvatarEditorMessage.const_346:
               Logger.log("MeMenuWidgetHandler: Open avatar editor...");
               if(_container)
               {
                  _loc17_ = param1 as RoomWidgetAvatarEditorMessage;
                  _loc18_ = _loc17_.context;
                  _container.avatarEditor.openEditor(_loc18_,this);
                  _loc19_ = _container.sessionDataManager.figure;
                  _loc20_ = _container.sessionDataManager.gender;
                  _loc21_ = 0;
                  if(_container.sessionDataManager.hasUserRight("fuse_use_club_outfits"))
                  {
                     _loc21_ = 0;
                  }
                  if(_container.sessionDataManager.hasUserRight("fuse_use_vip_outfits"))
                  {
                     _loc21_ = 0;
                  }
                  _container.avatarEditor.loadAvatarInEditor(_loc19_,_loc20_,_loc21_);
                  if(false && _container.habboHelp.events)
                  {
                     _container.habboHelp.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_379));
                  }
               }
               break;
            case RoomWidgetGetSettingsMessage.const_691:
               _container.events.dispatchEvent(new RoomWidgetSettingsUpdateEvent(RoomWidgetSettingsUpdateEvent.const_353,_container.soundManager.volume));
               break;
            case RoomWidgetStoreSettingsMessage.const_543:
               _container.soundManager.volume = (param1 as RoomWidgetStoreSettingsMessage).volume;
               _container.events.dispatchEvent(new RoomWidgetSettingsUpdateEvent(RoomWidgetSettingsUpdateEvent.const_353,_container.soundManager.volume));
               break;
            case RoomWidgetStoreSettingsMessage.const_744:
               _container.soundManager.previewVolume = (param1 as RoomWidgetStoreSettingsMessage).volume;
               _container.events.dispatchEvent(new RoomWidgetSettingsUpdateEvent(RoomWidgetSettingsUpdateEvent.const_353,_container.soundManager.volume));
               break;
            case RoomWidgetAvatarEditorMessage.const_720:
               if(false && _container.habboHelp.events)
               {
                  _container.habboHelp.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_415));
               }
               break;
            case RoomWidgetClothingChangeMessage.const_341:
               _container.events.dispatchEvent(new RoomWidgetAvatarEditorUpdateEvent(RoomWidgetAvatarEditorUpdateEvent.const_594));
               break;
            default:
               Logger.log("Unhandled message in MeMenuWidgetHandler: " + param1.type);
         }
         return null;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var_1418 = "";
         setMeMenuToolbarIcon();
      }
      
      public function saveFigure(param1:String, param2:String) : void
      {
         if(_container == null)
         {
            return;
         }
         _container.roomSession.sendUpdateFigureData(param1,param2);
         _container.avatarEditor.close();
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_436;
      }
      
      private function onAvatarEffectsChanged(param1:Event = null) : void
      {
         var _loc2_:* = null;
         if(_container == null)
         {
            return;
         }
         Logger.log("[MeMenuWidgetHandler] Received Avatar Effects Have Changed Event...\t");
         if(var_14 != null)
         {
            _loc2_ = var_14.getAvatarEffects();
            _container.events.dispatchEvent(new RoomWidgetUpdateEffectsUpdateEvent(_loc2_));
         }
      }
      
      private function onCreditBalance(param1:SessionCreditBalanceEvent) : void
      {
         if(param1 == null || _container == null || true)
         {
            return;
         }
         _container.events.dispatchEvent(new RoomWidgetCreditBalanceUpdateEvent(param1.credits));
      }
      
      public function update() : void
      {
         if(_container)
         {
            _container.events.dispatchEvent(new RoomWidgetFrameUpdateEvent());
         }
      }
      
      private function onFigureUpdate(param1:HabboSessionFigureUpdatedEvent) : void
      {
         if(_container == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         var _loc2_:* = param1.userId == _container.sessionDataManager.userId;
         if(_loc2_)
         {
            setMeMenuToolbarIcon();
         }
         if(_container != null && false)
         {
         }
      }
      
      private function onHelpTutorialEvent(param1:HabboHelpTutorialEvent) : void
      {
         if(_container == null)
         {
            return;
         }
         switch(param1.type)
         {
            case HabboHelpTutorialEvent.const_109:
               _container.events.dispatchEvent(new RoomWidgetTutorialEvent(RoomWidgetTutorialEvent.const_109));
               break;
            case HabboHelpTutorialEvent.const_480:
               _container.events.dispatchEvent(new RoomWidgetTutorialEvent(RoomWidgetTutorialEvent.const_467));
         }
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      private function onHabboClubSubscriptionChanged(param1:Event = null) : void
      {
         var _loc2_:Boolean = false;
         if(var_14 != null)
         {
            _loc2_ = false;
            if(_container != null && false)
            {
               _loc2_ = _container.sessionDataManager.hasUserRight("fuse_use_club_dance");
            }
            _container.events.dispatchEvent(new RoomWidgetHabboClubUpdateEvent(var_14.clubDays,var_14.clubPeriods,var_14.clubPastPeriods,_loc2_,var_14.clubLevel));
         }
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         if(_container != null)
         {
            if(false)
            {
               _container.sessionDataManager.events.removeEventListener(HabboSessionFigureUpdatedEvent.const_690,onFigureUpdate);
            }
            if(false)
            {
               _container.avatarEditor.events.removeEventListener(AvatarEditorClosedEvent.AVATAREDITOR_CLOSED,onAvatarEditorClosed);
            }
            if(false)
            {
               _container.habboHelp.events.removeEventListener(HabboHelpTutorialEvent.const_480,onHelpTutorialEvent);
               _container.habboHelp.events.removeEventListener(HabboHelpTutorialEvent.const_109,onHelpTutorialEvent);
            }
            _container = null;
         }
         _container = param1;
         if(_container != null && false)
         {
            _container.sessionDataManager.events.addEventListener(HabboSessionFigureUpdatedEvent.const_690,onFigureUpdate);
            _container.sessionDataManager.events.addEventListener(SessionCreditBalanceEvent.const_158,onCreditBalance);
         }
         var_14 = _container.inventory;
         if(var_14 != null)
         {
            (var_14 as Component).events.addEventListener(HabboInventoryEffectsEvent.const_950,onAvatarEffectsChanged);
            (var_14 as Component).events.addEventListener(HabboInventoryHabboClubEvent.const_943,onHabboClubSubscriptionChanged);
         }
         _toolbar = _container.toolbar;
         if(_toolbar)
         {
            _toolbar.events.addEventListener(HabboToolbarEvent.const_82,onHabboToolbarEvent);
            _toolbar.events.addEventListener(HabboToolbarEvent.const_53,onHabboToolbarEvent);
            setMeMenuToolbarIcon();
         }
         if(false)
         {
            _container.avatarEditor.events.addEventListener(AvatarEditorClosedEvent.AVATAREDITOR_CLOSED,onAvatarEditorClosed);
         }
         if(false)
         {
            _container.habboHelp.events.addEventListener(HabboHelpTutorialEvent.const_480,onHelpTutorialEvent);
            _container.habboHelp.events.addEventListener(HabboHelpTutorialEvent.const_109,onHelpTutorialEvent);
         }
         _catalog = _container.catalog;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetWaveMessage.const_758);
         _loc1_.push(RoomWidgetDanceMessage.const_635);
         _loc1_.push(RoomWidgetGetEffectsMessage.const_556);
         _loc1_.push(RoomWidgetSelectEffectMessage.const_541);
         _loc1_.push(RoomWidgetSelectEffectMessage.const_711);
         _loc1_.push(RoomWidgetSelectEffectMessage.const_658);
         _loc1_.push(RoomWidgetOpenInventoryMessage.const_679);
         _loc1_.push(RoomWidgetOpenCatalogMessage.const_584);
         _loc1_.push(RoomWidgetStopEffectMessage.const_537);
         _loc1_.push(RoomWidgetNavigateToRoomMessage.const_1199);
         _loc1_.push(RoomWidgetNavigateToRoomMessage.const_866);
         _loc1_.push(RoomWidgetToolbarMessage.const_707);
         _loc1_.push(RoomWidgetToolbarMessage.const_727);
         _loc1_.push(RoomWidgetAvatarEditorMessage.const_346);
         _loc1_.push(RoomWidgetAvatarEditorMessage.const_1210);
         _loc1_.push(RoomWidgetSelectOutfitMessage.const_1056);
         _loc1_.push(RoomWidgetShowOwnRoomsMessage.const_549);
         _loc1_.push(RoomWidgetRequestWidgetMessage.const_647);
         _loc1_.push(RoomWidgetGetSettingsMessage.const_691);
         _loc1_.push(RoomWidgetStoreSettingsMessage.const_1419);
         _loc1_.push(RoomWidgetStoreSettingsMessage.const_543);
         _loc1_.push(RoomWidgetStoreSettingsMessage.const_744);
         _loc1_.push(RoomWidgetAvatarEditorMessage.const_720);
         _loc1_.push(RoomWidgetClothingChangeMessage.const_341);
         return _loc1_;
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function dispose() : void
      {
         _isDisposed = true;
         _container = null;
         var_14 = null;
         _toolbar = null;
         _catalog = null;
      }
      
      private function onAvatarEditorClosed(param1:Event = null) : void
      {
         if(_container == null)
         {
            return;
         }
         Logger.log("[MeMenuWidgetHandler] Received Avatar Editor Closed Event...");
         _container.events.dispatchEvent(new RoomWidgetAvatarEditorUpdateEvent(RoomWidgetAvatarEditorUpdateEvent.const_562));
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_82)
         {
            setMeMenuToolbarIcon();
         }
         if(_container == null)
         {
            return;
         }
         if(param1.type == HabboToolbarEvent.const_53)
         {
            switch(param1.iconId)
            {
               case HabboToolbarIconEnum.MEMENU:
                  _container.events.dispatchEvent(new RoomWidgetToolbarClickedUpdateEvent(RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU));
                  break;
               case HabboToolbarIconEnum.ROOMINFO:
                  _container.events.dispatchEvent(new RoomWidgetToolbarClickedUpdateEvent(RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO));
            }
         }
      }
      
      private function setMeMenuToolbarIcon() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(false)
         {
            _loc3_ = _container.sessionDataManager.figure;
            if(_loc3_ != var_1418)
            {
               _loc4_ = _container.sessionDataManager.gender;
               _loc5_ = _container.avatarRenderManager.createAvatarImage(_loc3_,AvatarScaleType.const_49,_loc4_,this);
               if(_loc5_ != null)
               {
                  _loc5_.setDirection(AvatarSetType.const_39,3);
                  _loc1_ = _loc5_.getCroppedImage(AvatarSetType.const_39);
                  _loc5_.dispose();
               }
               var_1418 = _loc3_;
            }
         }
         var _loc2_:Component = _container.roomWidgetFactory as Component;
         if(_loc2_ != null)
         {
            if(_loc1_ == null)
            {
               _loc7_ = _loc2_.assets.getAssetByName("memenu_toolbar_icon") as BitmapDataAsset;
               _loc6_ = _loc7_.content as BitmapData;
            }
            else
            {
               _loc6_ = _loc1_;
            }
            Logger.log("MeMenuWidgetHandler: set toolbar icon: " + _toolbar + " " + _loc6_);
            if(_toolbar != null && _loc6_ != null)
            {
               _loc8_ = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_1007,HabboToolbarIconEnum.MEMENU);
               _loc8_.bitmapData = _loc6_;
               _toolbar.events.dispatchEvent(_loc8_);
            }
         }
      }
   }
}
