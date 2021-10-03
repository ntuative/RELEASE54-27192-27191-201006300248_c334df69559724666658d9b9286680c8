package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionErrorMessageEvent extends RoomSessionEvent
   {
      
      public static const const_166:String = "RSEME_MAX_PETS";
      
      public static const const_661:String = "RSEME_PETS_FORBIDDEN_IN_FLAT";
      
      public static const const_200:String = "RSEME_KICKED";
      
      public static const const_607:String = "RSEME_PETS_FORBIDDEN_IN_HOTEL";
      
      public static const const_191:String = "RSEME_MAX_STICKIES";
      
      public static const const_838:String = "RSEME_DOOR_OTHER_DELETED";
      
      public static const const_761:String = "RSEME_NO_FREE_TILES_FOR_PET";
      
      public static const const_227:String = "RSEME_GUIDE_EXISTS";
      
      public static const const_192:String = "RSEME_MAX_SOUND";
      
      public static const const_203:String = "RSEME_MAX_FURNITURE";
      
      public static const const_196:String = "RSEME_GUIDE_BUSY";
      
      public static const const_193:String = "RSEME_INVALID_ITEM_LOC";
      
      public static const const_216:String = "RSEME_MAX_QUEUE";
      
      public static const const_674:String = "RSEME_CANT_SET_NOT_OWNER";
      
      public static const const_587:String = "RSEME_SELECTED_TILE_NOT_FREE_FOR_PET";
      
      public static const const_1015:String = "RSEME_DOOR_NOT_INSTALLED";
      
      public static const const_243:String = "RSEME_CANT_TRADE_STUFF";
       
      
      private var _message:String;
      
      public function RoomSessionErrorMessageEvent(param1:String, param2:IRoomSession, param3:String = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param4,param5);
         _message = param3;
      }
      
      public function get message() : String
      {
         return _message;
      }
   }
}
