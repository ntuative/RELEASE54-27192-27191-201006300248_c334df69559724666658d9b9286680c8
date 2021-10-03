package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_536:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1890:int;
      
      private var var_1892:int;
      
      private var var_2192:Boolean;
      
      private var var_1069:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_536);
         var_1892 = param1;
         var_1890 = param2;
         _color = param3;
         var_1069 = param4;
         var_2192 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1890;
      }
      
      public function get presetNumber() : int
      {
         return var_1892;
      }
      
      public function get brightness() : int
      {
         return var_1069;
      }
      
      public function get apply() : Boolean
      {
         return var_2192;
      }
   }
}
