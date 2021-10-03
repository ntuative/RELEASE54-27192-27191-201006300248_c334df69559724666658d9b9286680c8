package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var var_1853:Boolean;
      
      private var var_1849:Boolean;
      
      private var var_1848:Array;
      
      private var var_1852:Boolean;
      
      private var var_1314:String;
      
      private var var_1856:int;
      
      private var var_1850:Boolean;
      
      private var var_1851:int;
      
      private var var_1313:int;
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var _password:String;
      
      private var var_694:Array;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1849 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return var_1856;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1856 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         var_1850 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_694;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1852;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1848 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_694 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_1853;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1849;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function get categoryId() : int
      {
         return var_1313;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1852 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return var_1850;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1848;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1851 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_1853 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1851;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1313 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1314 = param1;
      }
      
      public function get description() : String
      {
         return var_1314;
      }
   }
}
