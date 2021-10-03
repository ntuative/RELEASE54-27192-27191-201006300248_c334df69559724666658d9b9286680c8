package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1161:int = 1;
      
      private static const const_1147:int = 3;
      
      private static const const_1160:int = 2;
      
      private static const const_1159:int = 15;
       
      
      private var var_959:int;
      
      private var var_243:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_243 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1160)
         {
            var_243 = new Array();
            var_243.push(const_1161);
            var_959 = const_1159;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_959 > 0)
         {
            --var_959;
         }
         if(var_959 == 0)
         {
            if(false)
            {
               super.setAnimation(var_243.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
