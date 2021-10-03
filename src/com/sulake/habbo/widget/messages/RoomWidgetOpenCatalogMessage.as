package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_977:String = "RWOCM_CLUB_MAIN";
      
      public static const const_584:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1738:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_584);
         var_1738 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1738;
      }
   }
}
