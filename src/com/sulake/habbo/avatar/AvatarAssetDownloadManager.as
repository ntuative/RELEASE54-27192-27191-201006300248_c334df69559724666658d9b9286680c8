package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.figure.FigurePart;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class AvatarAssetDownloadManager extends EventDispatcher
   {
       
      
      private var var_715:Dictionary;
      
      private const DOWNLOAD_TIMEOUT:int = 100;
      
      private const const_1453:int = 1;
      
      private var var_874:Array;
      
      private var var_726:Dictionary;
      
      private var var_1845:String;
      
      private var var_876:Dictionary;
      
      private var _assets:IAssetLibrary;
      
      private var var_1533:Boolean;
      
      private var var_607:Array;
      
      private var var_82:AvatarStructure;
      
      private var var_728:Array;
      
      private var var_1273:String;
      
      private var var_727:Timer;
      
      private var var_875:int = 3;
      
      public function AvatarAssetDownloadManager(param1:IAssetLibrary, param2:String, param3:String, param4:AvatarStructure)
      {
         super();
         var_876 = new Dictionary();
         _assets = param1;
         var_82 = param4;
         var_726 = new Dictionary();
         var_1845 = param3;
         var_1273 = param2;
         var_715 = new Dictionary();
         var_728 = [];
         var_607 = [];
         var_874 = [];
         var _loc5_:URLRequest = new URLRequest(param2);
         var _loc6_:AssetLoaderStruct = _assets.loadAssetFromFile("figuremap",_loc5_,"text/xml");
         _loc6_.addEventListener(AssetLoaderEvent.ASSET_LOADER_EVENT_COMPLETE,onConfigurationComplete);
         _loc6_.addEventListener(AssetLoaderEvent.const_40,onConfigurationError);
         var_727 = new Timer(DOWNLOAD_TIMEOUT,1);
         var_727.addEventListener(TimerEvent.TIMER_COMPLETE,onNextDownloadTimeout);
      }
      
      private function libraryComplete(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc2_:* = [];
         for(_loc3_ in var_726)
         {
            _loc7_ = true;
            _loc4_ = var_726[_loc3_];
            for each(_loc8_ in _loc4_)
            {
               if(!_loc8_.isReady)
               {
                  _loc7_ = false;
                  break;
               }
            }
            if(_loc7_)
            {
               _loc2_.push(_loc3_);
               _loc9_ = var_715[_loc3_];
               for each(_loc10_ in _loc9_)
               {
                  if(_loc10_ != null && !_loc10_.disposed)
                  {
                     _loc10_.avatarImageReady(_loc3_);
                  }
               }
               delete var_715[_loc3_];
            }
         }
         for each(_loc3_ in _loc2_)
         {
            delete var_726[_loc3_];
         }
         while(_loc6_ < var_874.length)
         {
            _loc5_ = var_874[_loc6_];
            if(_loc5_.libraryName == (param1.target as AvatarAssetDownloadLibrary).libraryName)
            {
               var_874.splice(_loc6_,1);
            }
            _loc6_++;
         }
         var_727.start();
      }
      
      public function loadFigureSetData(param1:AvatarFigureContainer, param2:IAvatarImageListener) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(!var_1533)
         {
            var_728.push([param1,param2]);
            return;
         }
         var _loc3_:String = param1.getFigureString();
         var _loc4_:Array = getLibsToDownload(param1);
         if(_loc4_.length > 0)
         {
            if(param2 && !param2.disposed)
            {
               _loc6_ = var_715[_loc3_];
               if(_loc6_ == null)
               {
                  _loc6_ = [];
               }
               _loc6_.push(param2);
               var_715[_loc3_] = _loc6_;
            }
            var_726[_loc3_] = _loc4_;
            for each(_loc5_ in _loc4_)
            {
               addToQueue(_loc5_);
            }
         }
         else if(param2 != null && !param2.disposed)
         {
            param2.avatarImageReady(_loc3_);
         }
      }
      
      private function onConfigurationError(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         --var_875;
         if(var_875 <= 0)
         {
            Logger.log("AVATAR ASSET ERROR: Could not download figuremap.xml.");
         }
         else
         {
            Logger.log("Could not download figuremap.xml. Retries left: " + var_875);
            if(var_1273.indexOf("?") > 0)
            {
               _loc2_ = var_1273 + "&retry=" + var_875;
            }
            else
            {
               _loc2_ = var_1273 + "?retry=" + var_875;
            }
            _loc3_ = new URLRequest(_loc2_);
            _loc4_ = _assets.loadAssetFromFile("figuremap",_loc3_,"text/xml");
            _loc4_.addEventListener(AssetLoaderEvent.ASSET_LOADER_EVENT_COMPLETE,onConfigurationComplete);
            _loc4_.addEventListener(AssetLoaderEvent.const_40,onConfigurationError);
         }
      }
      
      private function getLibsToDownload(param1:AvatarFigureContainer) : Array
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc2_:* = [];
         var _loc3_:IFigureData = var_82.figureData;
         for each(_loc4_ in param1.getPartTypeIds())
         {
            _loc5_ = _loc3_.getSetType(_loc4_);
            _loc6_ = param1.getPartSetId(_loc4_);
            _loc7_ = _loc5_.getPartSet(_loc6_);
            if(_loc7_)
            {
               for each(_loc8_ in _loc7_.parts)
               {
                  _loc9_ = _loc8_.type + ":" + _loc8_.id;
                  _loc10_ = var_876[_loc9_];
                  if(_loc10_ != null)
                  {
                     for each(_loc11_ in _loc10_)
                     {
                        if(_loc11_ != null)
                        {
                           if(!_loc11_.isReady)
                           {
                              if(_loc2_.indexOf(_loc11_) == -1)
                              {
                                 _loc2_.push(_loc11_);
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         return _loc2_;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_876 = null;
         _assets = null;
         var_726 = null;
         var_715 = null;
         var_82 = null;
         var_607 = null;
         var_728 = null;
         if(var_727)
         {
            var_727.stop();
            var_727 = null;
         }
      }
      
      public function isReady(param1:AvatarFigureContainer) : Boolean
      {
         if(!var_1533)
         {
            return false;
         }
         var _loc2_:Array = getLibsToDownload(param1);
         return _loc2_.length == 0;
      }
      
      private function generateMap(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         for each(_loc2_ in param1.lib)
         {
            _loc3_ = new AvatarAssetDownloadLibrary(_loc2_.@id,_loc2_.@revision,var_1845,_assets);
            _loc3_.addEventListener(Event.COMPLETE,libraryComplete);
            for each(_loc4_ in _loc2_.part)
            {
               _loc5_ = _loc4_.@type + ":" + _loc4_.@id;
               _loc6_ = var_876[_loc5_];
               if(_loc6_ == null)
               {
                  _loc6_ = [];
               }
               _loc6_.push(_loc3_);
               var_876[_loc5_] = _loc6_;
            }
         }
      }
      
      private function onNextDownloadTimeout(param1:Event = null) : void
      {
         processPending();
      }
      
      private function processPending() : void
      {
         var _loc1_:* = null;
         while(false && var_874.length < const_1453)
         {
            _loc1_ = var_607[0];
            _loc1_.startDownloading();
            var_874.push(var_607.shift());
         }
      }
      
      private function addToQueue(param1:AvatarAssetDownloadLibrary) : void
      {
         if(var_607.indexOf(param1) == -1 && !param1.isReady)
         {
            var_607.push(param1);
            processPending();
         }
      }
      
      private function onConfigurationComplete(param1:Event) : void
      {
         var data:XML = null;
         var initListener:Array = null;
         var event:Event = param1;
         var loaderStruct:AssetLoaderStruct = event.target as AssetLoaderStruct;
         if(loaderStruct == null)
         {
            return;
         }
         try
         {
            data = new XML(loaderStruct.assetLoader.content as String);
         }
         catch(e:Error)
         {
            Logger.log("[AvatarAssetDownloadManager] Error: " + e.message);
            return;
         }
         if(data == null)
         {
            Logger.log("[AvatarAssetDownloadManager] XML error: " + loaderStruct + " not valid XML");
            return;
         }
         if(data.toString() == "")
         {
            Logger.log("[AvatarAssetDownloadManager] XML error: " + loaderStruct + " is EMPTY!");
            return;
         }
         generateMap(data);
         var_1533 = true;
         for each(initListener in var_728)
         {
            loadFigureSetData(initListener[0],initListener[1]);
         }
         var_728 = [];
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
