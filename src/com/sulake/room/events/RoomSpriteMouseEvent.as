package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1960:Boolean = false;
      
      private var var_1959:Boolean = false;
      
      private var var_1790:String = "";
      
      private var _type:String = "";
      
      private var var_1964:Boolean = false;
      
      private var var_1961:Number = 0;
      
      private var var_1958:Number = 0;
      
      private var var_1966:Number = 0;
      
      private var var_1965:String = "";
      
      private var var_1962:Number = 0;
      
      private var var_1963:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_1965 = param2;
         var_1790 = param3;
         var_1958 = param4;
         var_1966 = param5;
         var_1961 = param6;
         var_1962 = param7;
         var_1963 = param8;
         var_1959 = param9;
         var_1964 = param10;
         var_1960 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1963;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1960;
      }
      
      public function get localX() : Number
      {
         return var_1961;
      }
      
      public function get localY() : Number
      {
         return var_1962;
      }
      
      public function get canvasId() : String
      {
         return var_1965;
      }
      
      public function get altKey() : Boolean
      {
         return var_1959;
      }
      
      public function get spriteTag() : String
      {
         return var_1790;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_1958;
      }
      
      public function get screenY() : Number
      {
         return var_1966;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1964;
      }
   }
}
