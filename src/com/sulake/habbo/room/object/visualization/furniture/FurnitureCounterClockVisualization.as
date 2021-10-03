package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureCounterClockVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1090:String = "seconds_sprite";
      
      private static const const_1089:String = "ten_minutes_sprite";
      
      private static const const_1091:String = "ten_seconds_sprite";
      
      private static const const_1088:String = "minutes_sprite";
       
      
      public function FurnitureCounterClockVisualization()
      {
         super();
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         var _loc3_:String = getSpriteTag(param1,_direction,param2);
         var _loc4_:int = super.animationId;
         switch(_loc3_)
         {
            case const_1090:
               return _loc4_ % 60 % 10;
            case const_1091:
               return _loc4_ % 60 / 10;
            case const_1088:
               return _loc4_ / 60 % 10;
            case const_1089:
               return _loc4_ / 60 / 10 % 10;
            default:
               return super.getFrameNumber(param1,param2);
         }
      }
      
      override public function get animationId() : int
      {
         return 0;
      }
   }
}
