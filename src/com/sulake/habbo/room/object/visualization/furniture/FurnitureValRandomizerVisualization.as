package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1148:int = 31;
      
      private static const const_1147:int = 32;
      
      private static const const_519:int = 30;
      
      private static const const_808:int = 20;
      
      private static const const_520:int = 10;
       
      
      private var var_599:Boolean = false;
      
      private var var_243:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_243 = new Array();
         super();
         super.setAnimation(const_519);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!var_599)
            {
               var_599 = true;
               var_243 = new Array();
               var_243.push(const_1148);
               var_243.push(const_1147);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_520)
         {
            if(var_599)
            {
               var_599 = false;
               var_243 = new Array();
               if(_direction == 2)
               {
                  var_243.push(const_808 + 5 - param1);
                  var_243.push(const_520 + 5 - param1);
               }
               else
               {
                  var_243.push(const_808 + param1);
                  var_243.push(const_520 + param1);
               }
               var_243.push(const_519);
               return;
            }
            super.setAnimation(const_519);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
