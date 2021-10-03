package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_2345:int;
      
      private var var_2346:String;
      
      private var var_1662:IActionDefinition;
      
      private var var_2342:Boolean;
      
      private var _color:IPartColor;
      
      private var var_2344:String;
      
      private var var_2341:String;
      
      private var var_1901:Boolean;
      
      private var var_2343:ColorTransform;
      
      private var var_1953:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_2346 = param1;
         var_2344 = param2;
         var_2345 = param3;
         _color = param4;
         _frames = param5;
         var_1662 = param6;
         var_1901 = param7;
         var_1953 = param8;
         var_2341 = param9;
         var_2342 = param10;
         var_2343 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1901;
      }
      
      public function get partType() : String
      {
         return var_2344;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_1953;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_2342;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_2345;
      }
      
      public function get flippedPartType() : String
      {
         return var_2341;
      }
      
      public function get bodyPartId() : String
      {
         return var_2346;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1662;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_2343;
      }
   }
}
