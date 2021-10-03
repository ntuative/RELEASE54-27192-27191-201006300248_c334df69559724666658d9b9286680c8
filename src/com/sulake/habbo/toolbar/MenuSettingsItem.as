package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2250:Array;
      
      private var var_2212:String;
      
      private var var_2249:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_2212 = param1;
         var_2250 = param2;
         var_2249 = param3;
      }
      
      public function get menuId() : String
      {
         return var_2212;
      }
      
      public function get yieldList() : Array
      {
         return var_2250;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_2249;
      }
   }
}
