package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1890:int;
      
      private var var_1892:int;
      
      private var var_1889:Boolean;
      
      private var var_1891:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1893:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1892 = param1;
         var_1890 = param2;
         var_1891 = param3;
         var_1893 = param4;
         var_1889 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1892,var_1890,var_1891,var_1893,int(var_1889)];
      }
      
      public function dispose() : void
      {
      }
   }
}
