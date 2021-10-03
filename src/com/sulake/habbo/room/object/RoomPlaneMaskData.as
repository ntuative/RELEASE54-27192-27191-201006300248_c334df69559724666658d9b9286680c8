package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_1830:Number = 0.0;
      
      private var var_1829:Number = 0.0;
      
      private var var_1831:Number = 0.0;
      
      private var var_1828:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1829 = param1;
         var_1831 = param2;
         var_1830 = param3;
         var_1828 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1829;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1830;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1831;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1828;
      }
   }
}
