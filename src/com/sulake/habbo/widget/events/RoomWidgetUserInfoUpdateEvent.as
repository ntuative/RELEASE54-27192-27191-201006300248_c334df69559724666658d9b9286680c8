package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_222:String = "RWUIUE_PEER";
      
      public static const const_238:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1215:String = "BOT";
      
      public static const const_948:int = 2;
      
      public static const const_1231:int = 0;
      
      public static const const_845:int = 3;
       
      
      private var var_417:String = "";
      
      private var var_1440:String = "";
      
      private var var_2188:Boolean = false;
      
      private var var_2182:int = 0;
      
      private var var_2016:int = 0;
      
      private var var_2178:Boolean = false;
      
      private var var_1439:String = "";
      
      private var var_2185:Boolean = false;
      
      private var var_998:int = 0;
      
      private var var_2183:Boolean = true;
      
      private var var_1177:int = 0;
      
      private var var_2186:Boolean = false;
      
      private var var_1344:Boolean = false;
      
      private var var_2184:Boolean = false;
      
      private var var_2015:int = 0;
      
      private var var_2181:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_292:Array;
      
      private var var_1346:Boolean = false;
      
      private var _name:String = "";
      
      private var var_2180:int = 0;
      
      private var var_2187:Boolean = false;
      
      private var var_2179:int = 0;
      
      private var var_2017:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_292 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_2016;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_2016 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_2188;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_2183;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_2183 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_2185 = param1;
      }
      
      public function get motto() : String
      {
         return var_1440;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_2186 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1344;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1440 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_2187;
      }
      
      public function get groupBadgeId() : String
      {
         return var_2017;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1344 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_2181;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_2015 = param1;
      }
      
      public function get badges() : Array
      {
         return var_292;
      }
      
      public function get amIController() : Boolean
      {
         return var_2178;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_2178 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_2187 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_2179 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_2017 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1439 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_2185;
      }
      
      public function set figure(param1:String) : void
      {
         var_417 = param1;
      }
      
      public function get carryItem() : int
      {
         return var_2015;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1346;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_2186;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_998 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_2179;
      }
      
      public function get realName() : String
      {
         return var_1439;
      }
      
      public function get figure() : String
      {
         return var_417;
      }
      
      public function set webID(param1:int) : void
      {
         var_2180 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_292 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_2184 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_2181 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_998;
      }
      
      public function get webID() : int
      {
         return var_2180;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1177 = param1;
      }
      
      public function get xp() : int
      {
         return var_2182;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_2188 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1177;
      }
      
      public function get canTrade() : Boolean
      {
         return var_2184;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1346 = param1;
      }
      
      public function set xp(param1:int) : void
      {
         var_2182 = param1;
      }
   }
}
