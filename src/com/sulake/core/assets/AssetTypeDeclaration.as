package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1981:Class;
      
      private var var_1982:Class;
      
      private var var_1980:String;
      
      private var var_1306:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_1980 = param1;
         var_1982 = param2;
         var_1981 = param3;
         if(rest == null)
         {
            var_1306 = new Array();
         }
         else
         {
            var_1306 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_1981;
      }
      
      public function get assetClass() : Class
      {
         return var_1982;
      }
      
      public function get mimeType() : String
      {
         return var_1980;
      }
      
      public function get fileTypes() : Array
      {
         return var_1306;
      }
   }
}
