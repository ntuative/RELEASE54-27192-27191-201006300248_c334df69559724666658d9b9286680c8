package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   
   public class BinaryFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_17:URLLoader;
      
      protected var _type:String;
      
      protected var var_689:String;
      
      public function BinaryFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_689 = param2 == null ? "" : param2.url;
         _type = param1;
         var_17 = new URLLoader();
         var_17.addEventListener(Event.COMPLETE,loadEventHandler);
         var_17.addEventListener(Event.UNLOAD,loadEventHandler);
         var_17.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_17.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_17.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_17.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return !!var_17 ? 0 : uint(0);
      }
      
      public function load(param1:URLRequest) : void
      {
         var_689 = param1.url;
         var_398 = 0;
         var_17.dataFormat = _type == "application/octet-stream" ? "null" : URLLoaderDataFormat.TEXT;
         var_17.load(param1);
      }
      
      public function get ready() : Boolean
      {
         return bytesTotal > 0 ? bytesTotal == bytesLoaded : false;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_17.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_17.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_17.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_17.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_17.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_17.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            try
            {
               var_17.close();
            }
            catch(e:Error)
            {
            }
            var_17 = null;
            _type = null;
            var_689 = null;
         }
      }
      
      public function get url() : String
      {
         return var_689;
      }
      
      public function get bytesLoaded() : uint
      {
         return !!var_17 ? 0 : uint(0);
      }
      
      public function get mimeType() : String
      {
         return _type;
      }
      
      public function get content() : Object
      {
         return !!var_17 ? var_17.data : null;
      }
      
      override protected function retry() : Boolean
      {
         if(!_disposed)
         {
            if(++var_398 < var_2499)
            {
               try
               {
                  var_17.close();
               }
               catch(e:Error)
               {
               }
               var_17.load(new URLRequest(var_689 + (var_689.indexOf("?") == -1 ? "?" : "&") + "retry=" + var_398));
               return true;
            }
         }
         return false;
      }
   }
}
