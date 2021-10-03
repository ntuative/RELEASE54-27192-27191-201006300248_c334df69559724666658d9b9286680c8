package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1167:int = 80;
       
      
      private var var_572:Map;
      
      private var var_807:String = "";
      
      private var var_1447:Array;
      
      public function UserRegistry()
      {
         var_572 = new Map();
         var_1447 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_572.getValue(var_1447.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_807;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_572.getValue(param1) != null)
         {
            var_572.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_807);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_807 == "")
         {
            var_1447.push(param1);
         }
         var_572.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_572;
      }
      
      public function unregisterRoom() : void
      {
         var_807 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_572.length > const_1167)
         {
            _loc1_ = var_572.getKey(0);
            var_572.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_807 = param1;
         if(var_807 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
