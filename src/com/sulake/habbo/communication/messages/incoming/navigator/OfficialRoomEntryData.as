package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1232:int = 4;
      
      public static const const_534:int = 3;
      
      public static const const_578:int = 2;
      
      public static const const_1008:int = 1;
       
      
      private var var_2010:String;
      
      private var _disposed:Boolean;
      
      private var var_1905:int;
      
      private var var_2011:Boolean;
      
      private var var_972:String;
      
      private var var_911:PublicRoomData;
      
      private var var_2009:int;
      
      private var _index:int;
      
      private var var_2012:String;
      
      private var _type:int;
      
      private var var_1774:String;
      
      private var var_910:GuestRoomData;
      
      private var var_2008:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_2010 = param1.readString();
         var_2008 = param1.readString();
         var_2011 = param1.readInteger() == 1;
         var_2012 = param1.readString();
         var_972 = param1.readString();
         var_2009 = param1.readInteger();
         var_1905 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_1008)
         {
            var_1774 = param1.readString();
         }
         else if(_type == const_534)
         {
            var_911 = new PublicRoomData(param1);
         }
         else if(_type == const_578)
         {
            var_910 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_2009;
      }
      
      public function get popupCaption() : String
      {
         return var_2010;
      }
      
      public function get userCount() : int
      {
         return var_1905;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_2011;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1008)
         {
            return 0;
         }
         if(this.type == const_578)
         {
            return this.var_910.maxUserCount;
         }
         if(this.type == const_534)
         {
            return this.var_911.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_2008;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_910 != null)
         {
            this.var_910.dispose();
            this.var_910 = null;
         }
         if(this.var_911 != null)
         {
            this.var_911.dispose();
            this.var_911 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_910;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_2012;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_911;
      }
      
      public function get picRef() : String
      {
         return var_972;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1774;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
