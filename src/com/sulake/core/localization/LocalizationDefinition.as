package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1682:String;
      
      private var var_689:String;
      
      private var var_1684:String;
      
      private var var_1683:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1683 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1682 = _loc5_[0];
         var_1684 = _loc5_[1];
         _name = param2;
         var_689 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1682;
      }
      
      public function get languageCode() : String
      {
         return var_1683;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_689;
      }
      
      public function get encoding() : String
      {
         return var_1684;
      }
      
      public function get id() : String
      {
         return var_1683 + "_" + var_1682 + "." + var_1684;
      }
   }
}
