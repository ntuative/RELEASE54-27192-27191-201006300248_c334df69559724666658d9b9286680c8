package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_452:int = -2.147483648E9;
      
      private var var_454:int = 2.147483647E9;
      
      private var var_453:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      private var var_455:int = -2.147483648E9;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         _target = param1;
      }
      
      public function get maxWidth() : int
      {
         return var_454;
      }
      
      public function get isEmpty() : Boolean
      {
         return var_455 == int.MIN_VALUE && var_454 == int.MAX_VALUE && var_452 == int.MIN_VALUE && var_453 == int.MAX_VALUE;
      }
      
      public function set maxWidth(param1:int) : void
      {
         var_454 = param1;
         if(var_454 < int.MAX_VALUE && true && _target.width > var_454)
         {
            _target.width = var_454;
         }
      }
      
      public function setEmpty() : void
      {
         var_455 = int.MIN_VALUE;
         var_454 = int.MAX_VALUE;
         var_452 = int.MIN_VALUE;
         var_453 = int.MAX_VALUE;
      }
      
      public function set maxHeight(param1:int) : void
      {
         var_453 = param1;
         if(var_453 < int.MAX_VALUE && true && _target.height > var_453)
         {
            _target.height = var_453;
         }
      }
      
      public function get minHeight() : int
      {
         return var_452;
      }
      
      public function get minWidth() : int
      {
         return var_455;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_455 = var_455;
         _loc2_.var_454 = var_454;
         _loc2_.var_452 = var_452;
         _loc2_.var_453 = var_453;
         return _loc2_;
      }
      
      public function set minWidth(param1:int) : void
      {
         var_455 = param1;
         if(var_455 > int.MIN_VALUE && true && _target.width < var_455)
         {
            _target.width = var_455;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         var_452 = param1;
         if(var_452 > int.MIN_VALUE && true && _target.height < var_452)
         {
            _target.height = var_452;
         }
      }
      
      public function get maxHeight() : int
      {
         return var_453;
      }
   }
}
