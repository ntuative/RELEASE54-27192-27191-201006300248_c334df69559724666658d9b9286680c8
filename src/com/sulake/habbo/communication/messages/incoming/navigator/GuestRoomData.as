package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1905:int;
      
      private var var_2273:String;
      
      private var var_2275:int;
      
      private var var_2274:int;
      
      private var var_711:Boolean;
      
      private var var_1852:Boolean;
      
      private var var_461:int;
      
      private var var_1314:String;
      
      private var var_1851:int;
      
      private var var_1313:int;
      
      private var _ownerName:String;
      
      private var var_807:String;
      
      private var var_2276:int;
      
      private var var_2272:RoomThumbnailData;
      
      private var var_2246:Boolean;
      
      private var var_694:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_694 = new Array();
         super();
         var_461 = param1.readInteger();
         var_711 = param1.readBoolean();
         var_807 = param1.readString();
         _ownerName = param1.readString();
         var_1851 = param1.readInteger();
         var_1905 = param1.readInteger();
         var_2276 = param1.readInteger();
         var_1314 = param1.readString();
         var_2275 = param1.readInteger();
         var_2246 = param1.readBoolean();
         var_2274 = param1.readInteger();
         var_1313 = param1.readInteger();
         var_2273 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_694.push(_loc4_);
            _loc3_++;
         }
         var_2272 = new RoomThumbnailData(param1);
         var_1852 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2276;
      }
      
      public function get roomName() : String
      {
         return var_807;
      }
      
      public function get userCount() : int
      {
         return var_1905;
      }
      
      public function get score() : int
      {
         return var_2274;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2273;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_2246;
      }
      
      public function get tags() : Array
      {
         return var_694;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1852;
      }
      
      public function get event() : Boolean
      {
         return var_711;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_694 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1313;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2275;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2272;
      }
      
      public function get doorMode() : int
      {
         return var_1851;
      }
      
      public function get flatId() : int
      {
         return var_461;
      }
      
      public function get description() : String
      {
         return var_1314;
      }
   }
}
