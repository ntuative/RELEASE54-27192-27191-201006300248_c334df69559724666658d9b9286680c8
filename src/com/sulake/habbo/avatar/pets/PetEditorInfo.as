package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_2359:Boolean;
      
      private var var_1902:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_2359 = Boolean(parseInt(param1.@club));
         var_1902 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_2359;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1902;
      }
   }
}
