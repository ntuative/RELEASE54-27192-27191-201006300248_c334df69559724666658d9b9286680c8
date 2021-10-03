package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_1175:Boolean;
      
      private var _name:String;
      
      private var var_2053:String;
      
      private var var_1176:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_2053 = String(param1.@link);
         var_1176 = Boolean(parseInt(param1.@fliph));
         var_1175 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_1176;
      }
      
      public function get flipV() : Boolean
      {
         return var_1175;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_2053;
      }
   }
}
