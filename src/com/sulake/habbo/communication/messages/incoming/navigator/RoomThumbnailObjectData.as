package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1710:int;
      
      private var var_1711:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1710;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1710 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1710 = this.var_1710;
         _loc1_.var_1711 = this.var_1711;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1711 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1711;
      }
   }
}
