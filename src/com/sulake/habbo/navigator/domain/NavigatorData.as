package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.UserDefinedRoomEvents;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1468:int = 10;
       
      
      private var var_1932:Boolean;
      
      private var var_1933:int;
      
      private var var_1298:int;
      
      private var var_1934:Boolean;
      
      private var var_1080:Array;
      
      private var var_898:Dictionary;
      
      private var var_1079:Array;
      
      private var var_2450:int;
      
      private var var_1927:int;
      
      private var var_1931:UserDefinedRoomEvents;
      
      private var var_1570:int;
      
      private var var_1930:int;
      
      private var var_1897:int;
      
      private var var_624:PublicRoomShortData;
      
      private var var_419:RoomEventData;
      
      private var var_134:MsgWithRequestId;
      
      private var var_1928:Boolean;
      
      private var var_1926:Array;
      
      private var _navigator:HabboNavigator;
      
      private var var_1929:Boolean;
      
      private var var_203:GuestRoomData;
      
      private var var_741:Boolean;
      
      private var var_625:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_1080 = new Array();
         var_1079 = new Array();
         var_898 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_134 != null && var_134 as PopularRoomTagsData != null;
      }
      
      public function get eventMod() : Boolean
      {
         return var_1929;
      }
      
      public function startLoading() : void
      {
         this.var_741 = true;
      }
      
      public function get createdFlatId() : int
      {
         return var_1933;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_1929 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_419 != null)
         {
            var_419.dispose();
         }
         var_419 = param1;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function get homeRoomId() : int
      {
         return var_1570;
      }
      
      public function get stuffStates() : Array
      {
         return var_1926;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_134 != null && var_134 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_134 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_203;
      }
      
      public function get allCategories() : Array
      {
         return var_1080;
      }
      
      public function onRoomExit() : void
      {
         if(var_419 != null)
         {
            var_419.dispose();
            var_419 = null;
         }
         if(var_624 != null)
         {
            var_624.dispose();
            var_624 = null;
         }
         if(var_203 != null)
         {
            var_203.dispose();
            var_203 = null;
         }
         var_625 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_134 = param1;
         var_741 = false;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_203 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1570 == _loc1_;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_134 = param1;
         var_741 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_624 = null;
         var_203 = null;
         var_625 = false;
         if(param1.guestRoom)
         {
            var_625 = param1.owner;
         }
         else
         {
            var_624 = param1.publicSpace;
            var_419 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return var_625;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2450 = param1.limit;
         this.var_1298 = param1.favouriteRoomIds.length;
         this.var_898 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_898[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_134 as PopularRoomTagsData;
      }
      
      public function get settingsReceived() : Boolean
      {
         return var_1932;
      }
      
      public function set stuffStates(param1:Array) : void
      {
         var_1926 = param1;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_624;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_134 = param1;
         var_741 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1897 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_203 != null && var_625;
      }
      
      public function get userDefinedRoomEvents() : UserDefinedRoomEvents
      {
         return var_1931;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_1934;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_1080 = param1;
         var_1079 = new Array();
         for each(_loc2_ in var_1080)
         {
            if(_loc2_.visible)
            {
               var_1079.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_1927;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_1930;
      }
      
      public function get visibleCategories() : Array
      {
         return var_1079;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_134 == null)
         {
            return;
         }
         var_134.dispose();
         var_134 = null;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         var_1932 = param1;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_419;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_898[param1] = !!param2 ? "yes" : null;
         var_1298 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_134 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1897;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_134 != null && var_134 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_1934 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_1927 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1928 = param1;
      }
      
      public function set userDefinedRoomEvents(param1:UserDefinedRoomEvents) : void
      {
         var_1931 = param1;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_741;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         var_1570 = param1;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1298 >= var_2450;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_203 != null)
         {
            var_203.dispose();
         }
         var_203 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_1930 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1928;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_203 != null && !var_625;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_1933 = param1;
      }
   }
}
