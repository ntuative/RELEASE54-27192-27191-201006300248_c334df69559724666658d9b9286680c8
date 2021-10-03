package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1894:int;
      
      private var var_2080:Boolean;
      
      private var var_2054:int;
      
      private var var_1487:String;
      
      private var var_2082:Boolean = false;
      
      private var var_2079:int;
      
      private var var_482:int;
      
      private var var_1189:String;
      
      private var var_1550:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1295:int;
      
      private var var_2083:Boolean;
      
      private var var_2081:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1894 = param1;
         var_1189 = param2;
         _objId = param3;
         var_1295 = param4;
         var_1487 = param5;
         var_2080 = param6;
         var_2083 = param7;
         var_2079 = param8;
         var_1550 = param9;
         var_2054 = param10;
         var_482 = -1;
      }
      
      public function get songId() : int
      {
         return var_2054;
      }
      
      public function get iconCallbackId() : int
      {
         return var_482;
      }
      
      public function get expiryTime() : int
      {
         return var_2079;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_2081 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2082 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_482 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2083;
      }
      
      public function get slotId() : String
      {
         return var_1550;
      }
      
      public function get classId() : int
      {
         return var_1295;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2080;
      }
      
      public function get stuffData() : String
      {
         return var_1487;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1894;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2082;
      }
      
      public function get prevCallbackId() : int
      {
         return var_2081;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1189;
      }
   }
}
