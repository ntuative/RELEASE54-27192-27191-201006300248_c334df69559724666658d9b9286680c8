package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1803:int;
      
      private var var_417:String;
      
      private var var_1805:int;
      
      private var var_2112:int;
      
      private var var_1800:int;
      
      private var var_2111:int;
      
      private var _nutrition:int;
      
      private var var_1365:int;
      
      private var var_2108:int;
      
      private var var_2109:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1802:int;
      
      private var var_2110:int;
      
      public function PetInfoMessageParser()
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
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_2111;
      }
      
      public function flush() : Boolean
      {
         var_1365 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_2108;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_2109;
      }
      
      public function get maxNutrition() : int
      {
         return var_2110;
      }
      
      public function get figure() : String
      {
         return var_417;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_2112;
      }
      
      public function get petId() : int
      {
         return var_1365;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1365 = param1.readInteger();
         _name = param1.readString();
         var_1805 = param1.readInteger();
         var_2108 = param1.readInteger();
         var_1800 = param1.readInteger();
         var_2109 = param1.readInteger();
         _energy = param1.readInteger();
         var_2111 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_2110 = param1.readInteger();
         var_417 = param1.readString();
         var_2112 = param1.readInteger();
         var_1802 = param1.readInteger();
         var_1803 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1800;
      }
      
      public function get ownerId() : int
      {
         return var_1802;
      }
      
      public function get age() : int
      {
         return var_1803;
      }
   }
}
