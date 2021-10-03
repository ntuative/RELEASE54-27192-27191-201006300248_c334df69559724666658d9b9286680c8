package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_872:String = "inventory_badges";
      
      public static const const_1405:String = "inventory_clothes";
      
      public static const const_1212:String = "inventory_furniture";
      
      public static const const_679:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1010:String = "inventory_effects";
       
      
      private var var_1736:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_679);
         var_1736 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1736;
      }
   }
}
