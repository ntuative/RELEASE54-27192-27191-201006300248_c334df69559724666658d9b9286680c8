package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_2054:int;
      
      private var var_2057:int = 0;
      
      private var var_2058:String;
      
      private var var_2055:int;
      
      private var var_2056:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_2054 = param1;
         var_2055 = param2;
         var_2056 = param3;
         var_2058 = param4;
      }
      
      public function get length() : int
      {
         return var_2055;
      }
      
      public function get name() : String
      {
         return var_2056;
      }
      
      public function get creator() : String
      {
         return var_2058;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_2057;
      }
      
      public function get id() : int
      {
         return var_2054;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_2057 = param1;
      }
   }
}
