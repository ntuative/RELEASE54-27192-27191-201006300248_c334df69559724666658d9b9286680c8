package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_1056:String = "select_outfit";
       
      
      private var var_2211:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_1056);
         var_2211 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_2211;
      }
   }
}
