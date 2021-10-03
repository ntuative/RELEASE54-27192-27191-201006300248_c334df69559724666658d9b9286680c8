package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1805:int;
      
      private var var_2112:int;
      
      private var var_1800:int;
      
      private var var_1797:int;
      
      private var _nutrition:int;
      
      private var var_1365:int;
      
      private var var_1801:int;
      
      private var var_1799:int;
      
      private var _energy:int;
      
      private var var_1803:int;
      
      private var var_1807:int;
      
      private var _ownerName:String;
      
      private var var_1802:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1805;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_2112 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1805 = param1;
      }
      
      public function get petId() : int
      {
         return var_1365;
      }
      
      public function get experienceMax() : int
      {
         return var_1799;
      }
      
      public function get nutritionMax() : int
      {
         return var_1797;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1801 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1802;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1365 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1807;
      }
      
      public function get respect() : int
      {
         return var_2112;
      }
      
      public function get levelMax() : int
      {
         return var_1801;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1799 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1800 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1797 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1802 = param1;
      }
      
      public function get experience() : int
      {
         return var_1800;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1807 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1803 = param1;
      }
      
      public function get age() : int
      {
         return var_1803;
      }
   }
}
