package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2375:Boolean = false;
      
      private var var_2374:int = 0;
      
      private var var_1694:int = 0;
      
      private var var_2376:int = 0;
      
      private var var_2332:Boolean = false;
      
      private var var_1519:int = 0;
      
      private var var_1693:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1519 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2374;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2375;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2375 = param1;
      }
      
      public function get isVIP() : Boolean
      {
         return var_2332;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2374 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1694 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1519;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_2332 = param1;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2376 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1694;
      }
      
      public function get pixelBalance() : int
      {
         return var_2376;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1693 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1693;
      }
   }
}
