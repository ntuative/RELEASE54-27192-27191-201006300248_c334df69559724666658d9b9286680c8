package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_671:RoomObjectLocationCacheItem = null;
      
      private var var_191:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         var_671 = new RoomObjectLocationCacheItem(param1);
         var_191 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return var_671;
      }
      
      public function dispose() : void
      {
         if(var_671 != null)
         {
            var_671.dispose();
            var_671 = null;
         }
         if(var_191 != null)
         {
            var_191.dispose();
            var_191 = null;
         }
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return var_191;
      }
   }
}
