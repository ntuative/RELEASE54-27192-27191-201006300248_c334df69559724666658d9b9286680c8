package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_425:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_413:int = 0;
      
      public static const const_884:int = 2;
      
      public static const const_1011:int = 1;
      
      public static const const_721:Boolean = false;
      
      public static const const_660:String = "";
      
      public static const const_483:int = 0;
      
      public static const const_493:int = 0;
      
      public static const const_380:int = 0;
       
      
      private var var_2065:int = 0;
      
      private var var_1774:String = "";
      
      private var var_1515:int = 0;
      
      private var var_2063:int = 0;
      
      private var var_2062:Number = 0;
      
      private var var_1773:int = 255;
      
      private var var_2064:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_2065;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1515 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_2062;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_2063 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_2065 = param1;
      }
      
      public function get tag() : String
      {
         return var_1774;
      }
      
      public function get alpha() : int
      {
         return var_1773;
      }
      
      public function get ink() : int
      {
         return var_1515;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_2062 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_2063;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_2064 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_2064;
      }
      
      public function set tag(param1:String) : void
      {
         var_1774 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1773 = param1;
      }
   }
}
