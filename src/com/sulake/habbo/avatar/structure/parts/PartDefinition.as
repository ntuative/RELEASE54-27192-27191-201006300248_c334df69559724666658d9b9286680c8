package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1511:int = -1;
      
      private var var_1229:Boolean;
      
      private var var_1230:String;
      
      private var var_1764:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_1764 = String(param1["set-type"]);
         var_1230 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1229 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1511 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1230;
      }
      
      public function get staticId() : int
      {
         return var_1511;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1511 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1229;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1229 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1230 = param1;
      }
      
      public function get setType() : String
      {
         return var_1764;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
