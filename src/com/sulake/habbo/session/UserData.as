package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_417:String = "";
      
      private var var_2279:String = "";
      
      private var var_2278:int = 0;
      
      private var var_2182:int = 0;
      
      private var _type:int = 0;
      
      private var var_2281:String = "";
      
      private var var_649:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_2180:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         var_2278 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         var_2281 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set figure(param1:String) : void
      {
         var_417 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         var_649 = param1;
      }
      
      public function get groupStatus() : int
      {
         return var_2278;
      }
      
      public function set webID(param1:int) : void
      {
         var_2180 = param1;
      }
      
      public function get groupID() : String
      {
         return var_2281;
      }
      
      public function set custom(param1:String) : void
      {
         var_2279 = param1;
      }
      
      public function get figure() : String
      {
         return var_417;
      }
      
      public function get sex() : String
      {
         return var_649;
      }
      
      public function get custom() : String
      {
         return var_2279;
      }
      
      public function get webID() : int
      {
         return var_2180;
      }
      
      public function set xp(param1:int) : void
      {
         var_2182 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get xp() : int
      {
         return var_2182;
      }
   }
}
