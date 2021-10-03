package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1487:String;
      
      private var var_1189:String;
      
      private var var_2121:Boolean;
      
      private var var_1661:int;
      
      private var var_1894:int;
      
      private var var_2122:Boolean;
      
      private var var_1550:String = "";
      
      private var var_2080:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1295:int;
      
      private var var_2083:Boolean;
      
      private var var_2054:int = -1;
      
      private var var_2079:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1894 = param1;
         var_1189 = param2;
         _objId = param3;
         var_1295 = param4;
         _category = param5;
         var_1487 = param6;
         var_2121 = param7;
         var_2080 = param8;
         var_2083 = param9;
         var_2122 = param10;
         var_2079 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1550;
      }
      
      public function get extra() : int
      {
         return var_1661;
      }
      
      public function get classId() : int
      {
         return var_1295;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2122;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2121;
      }
      
      public function get stripId() : int
      {
         return var_1894;
      }
      
      public function get stuffData() : String
      {
         return var_1487;
      }
      
      public function get songId() : int
      {
         return var_2054;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1550 = param1;
         var_1661 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1189;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_2079;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2083;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2080;
      }
   }
}
