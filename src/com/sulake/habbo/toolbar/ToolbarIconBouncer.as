package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2302:Number;
      
      private var var_671:Number = 0;
      
      private var var_2301:Number;
      
      private var var_670:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_2302 = param1;
         var_2301 = param2;
      }
      
      public function update() : void
      {
         var_670 += var_2301;
         var_671 += var_670;
         if(var_671 > 0)
         {
            var_671 = 0;
            var_670 = var_2302 * -1 * var_670;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_670 = param1;
         var_671 = 0;
      }
      
      public function get location() : Number
      {
         return var_671;
      }
   }
}
