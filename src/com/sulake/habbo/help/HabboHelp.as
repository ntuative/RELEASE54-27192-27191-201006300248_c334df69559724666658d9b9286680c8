package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_2327:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_147:TutorialUI;
      
      private var var_813:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_63:HelpUI;
      
      private var var_812:IHabboConfigurationManager;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_675:HotelMergeUI;
      
      private var var_309:IHabboCommunicationManager;
      
      private var var_982:FaqIndex;
      
      private var var_1887:String = "";
      
      private var var_1185:IncomingMessages;
      
      private var var_1451:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1451 = new CallForHelpData();
         var_2327 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_982 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_63 != null)
         {
            var_63.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_63 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_63.toggleUI();
      }
      
      public function removeTutorialUI() : void
      {
         if(var_147 != null)
         {
            var_147.dispose();
            var_147 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_1887;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      override public function dispose() : void
      {
         if(var_63 != null)
         {
            var_63.dispose();
            var_63 = null;
         }
         if(var_147 != null)
         {
            var_147.dispose();
            var_147 = null;
         }
         if(var_675)
         {
            var_675.dispose();
            var_675 = null;
         }
         if(var_982 != null)
         {
            var_982.dispose();
            var_982 = null;
         }
         var_1185 = null;
         if(_toolbar)
         {
            _toolbar.release(new IIDHabboToolbar());
            _toolbar = null;
         }
         if(var_813)
         {
            var_813.release(new IIDHabboLocalizationManager());
            var_813 = null;
         }
         if(var_309)
         {
            var_309.release(new IIDHabboCommunicationManager());
            var_309 = null;
         }
         if(var_812)
         {
            var_812.release(new IIDHabboConfigurationManager());
            var_812 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_813;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_95:
               if(var_63 != null)
               {
                  var_63.setRoomSessionStatus(true);
               }
               if(var_147 != null)
               {
                  var_147.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_107:
               if(var_63 != null)
               {
                  var_63.setRoomSessionStatus(false);
               }
               if(var_147 != null)
               {
                  var_147.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_63 != null)
         {
            var_63.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_2327;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_63 != null)
         {
            var_63.showCallForHelpResult(param1);
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!var_675)
         {
            var_675 = new HotelMergeUI(this);
         }
         var_675.startNameChange();
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_147 == null && _assetLibrary != null && _windowManager != null)
         {
            var_147 = new TutorialUI(this);
         }
         return var_147 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_63 == null && _assetLibrary != null && _windowManager != null)
         {
            var_63 = new HelpUI(this,_assetLibrary,_windowManager,var_813,_toolbar);
         }
         return var_63 != null;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1451;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1451.reportedUserId = param1;
         var_1451.reportedUserName = param2;
         var_63.showUI(HabboHelpViewEnum.const_301);
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_1887 = param1;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(_toolbar != null)
         {
            _toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_131,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_813 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_147 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_147.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_309 = IHabboCommunicationManager(param2);
         var_1185 = new IncomingMessages(this,var_309);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_63 != null)
         {
            var_63.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(var_63 != null)
         {
            var_63.hideUI();
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_309 != null && param1 != null)
         {
            var_309.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_982;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_63 != null)
         {
            var_63.updateCallForGuideBotUI(false);
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _toolbar = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_812 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_147;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_82)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_53)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return var_675;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_95,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_107,onRoomSessionEvent);
         _toolbar.events.addEventListener(HabboToolbarEvent.const_82,onHabboToolbarEvent);
         _toolbar.events.addEventListener(HabboToolbarEvent.const_53,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_63 != null)
         {
            var_63.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_812 == null)
         {
            return param1;
         }
         return var_812.getKey(param1,param2,param3);
      }
   }
}
