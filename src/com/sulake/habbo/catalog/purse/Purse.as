package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_2330:int = 0;
      
      private var var_1694:int = 0;
      
      private var var_2332:Boolean = false;
      
      private var var_2333:int = 0;
      
      private var var_2334:int = 0;
      
      private var var_1693:int = 0;
      
      private var var_2331:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get clubDays() : int
      {
         return var_1694;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1694 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_2332 = param1;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         var_2331 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return var_1694 > 0 || var_1693 > 0;
      }
      
      public function get credits() : int
      {
         return var_2333;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         var_2334 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1693;
      }
      
      public function get isVIP() : Boolean
      {
         return var_2332;
      }
      
      public function get pastClubDays() : int
      {
         return var_2331;
      }
      
      public function get pastVipDays() : int
      {
         return var_2334;
      }
      
      public function set pixels(param1:int) : void
      {
         var_2330 = param1;
      }
      
      public function get pixels() : int
      {
         return var_2330;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1693 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_2333 = param1;
      }
   }
}
