package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_595:int = -1;
      
      public static const const_880:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_2022:int = -1;
      
      private var var_87:int = 0;
      
      private var var_1316:int = 1;
      
      private var var_913:int = 1;
      
      private var var_2020:Boolean = false;
      
      private var var_2021:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_87 = param2;
         _y = param3;
         var_2020 = param5;
         if(param4 < 0)
         {
            param4 = const_595;
         }
         var_913 = param4;
         var_1316 = param4;
         if(param6 >= 0)
         {
            var_2022 = param6;
            var_2021 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_913 > 0 && param1 > var_913)
         {
            param1 = var_913;
         }
         var_1316 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_913;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_2021;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_913 < 0)
         {
            return const_595;
         }
         return var_1316;
      }
      
      public function get activeSequence() : int
      {
         return var_2022;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_2020;
      }
      
      public function get x() : int
      {
         return var_87;
      }
   }
}
