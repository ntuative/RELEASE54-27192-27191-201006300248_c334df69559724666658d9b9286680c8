package com.sulake.habbo.avatar.cache
{
   import com.sulake.core.utils.Map;
   import flash.utils.getTimer;
   
   public class AvatarImageActionCache
   {
       
      
      private var var_1978:int;
      
      private var var_126:Map;
      
      public function AvatarImageActionCache()
      {
         super();
         var_126 = new Map();
         setLastAccessTime(getTimer());
      }
      
      public function setLastAccessTime(param1:int) : void
      {
         var_1978 = param1;
      }
      
      private function method_2(param1:String) : void
      {
      }
      
      public function getLastAccessTime() : int
      {
         return var_1978;
      }
      
      public function getDirectionCache(param1:int) : AvatarImageDirectionCache
      {
         var _loc2_:String = param1.toString();
         return var_126.getValue(_loc2_) as AvatarImageDirectionCache;
      }
      
      public function updateDirectionCache(param1:int, param2:AvatarImageDirectionCache) : void
      {
         var _loc3_:String = param1.toString();
         var_126.add(_loc3_,param2);
      }
      
      public function dispose() : void
      {
         method_2("[dispose]");
         if(var_126 == null)
         {
            return;
         }
         var_126.dispose();
      }
   }
}
