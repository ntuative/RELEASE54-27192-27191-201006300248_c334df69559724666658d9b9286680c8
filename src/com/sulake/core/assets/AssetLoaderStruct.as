package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_794:IAssetLoader;
      
      private var var_1410:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1410 = param1;
         var_794 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_794;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_794 != null)
            {
               if(true)
               {
                  var_794.dispose();
                  var_794 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1410;
      }
   }
}
