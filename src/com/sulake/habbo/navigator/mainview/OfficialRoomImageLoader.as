package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.display.BitmapData;
   import flash.net.URLRequest;
   
   public class OfficialRoomImageLoader implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_806:IBitmapWrapperWindow;
      
      private var var_689:String;
      
      private var var_972:String;
      
      private var _navigator:HabboNavigator;
      
      public function OfficialRoomImageLoader(param1:HabboNavigator, param2:String, param3:IBitmapWrapperWindow)
      {
         super();
         _navigator = param1;
         var_972 = param2;
         var_806 = param3;
         var _loc4_:String = _navigator.configuration.getKey("image.library.url");
         var_689 = _loc4_ + var_972;
         Logger.log("[OFFICIAL ROOM ICON IMAGE DOWNLOADER] : " + var_689);
      }
      
      private function onLoadError(param1:AssetLoaderEvent) : void
      {
         Logger.log("Error loading image: " + var_689 + ", " + param1);
         dispose();
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_806 = null;
         _navigator = null;
      }
      
      private function onImageReady(param1:AssetLoaderEvent) : void
      {
         if(_disposed)
         {
            return;
         }
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ == null)
         {
            Logger.log("Loading pic from url: " + var_689 + " failed. loaderStruct == null");
            return;
         }
         Logger.log("IMAGE READY: " + var_972 + ", " + _loc2_);
         setImage();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function startLoad() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.assets.hasAsset(var_972))
         {
            setImage();
         }
         else
         {
            _loc1_ = new URLRequest(var_689);
            _loc2_ = _navigator.assets.loadAssetFromFile(var_972,_loc1_,"image/gif");
            _loc2_.addEventListener(AssetLoaderEvent.ASSET_LOADER_EVENT_COMPLETE,onImageReady);
            _loc2_.addEventListener(AssetLoaderEvent.const_40,onLoadError);
         }
      }
      
      private function setImage() : void
      {
         var _loc1_:BitmapData = _navigator.getButtonImage(var_972,"");
         var_806.bitmap = _loc1_;
         var_806.width = _loc1_.width;
         var_806.height = _loc1_.height;
         var_806.visible = true;
         dispose();
      }
   }
}
