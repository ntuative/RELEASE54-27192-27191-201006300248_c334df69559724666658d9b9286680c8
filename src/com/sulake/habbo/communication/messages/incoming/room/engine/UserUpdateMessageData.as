package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_88:Number = 0;
      
      private var var_240:int = 0;
      
      private var var_1809:int = 0;
      
      private var var_2369:Number = 0;
      
      private var var_2370:Number = 0;
      
      private var var_2367:Number = 0;
      
      private var var_2371:Number = 0;
      
      private var var_2368:Boolean = false;
      
      private var var_87:Number = 0;
      
      private var _id:int = 0;
      
      private var var_226:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_226 = [];
         super();
         _id = param1;
         var_87 = param2;
         _y = param3;
         var_88 = param4;
         var_2371 = param5;
         var_240 = param6;
         var_1809 = param7;
         var_2369 = param8;
         var_2370 = param9;
         var_2367 = param10;
         var_2368 = param11;
         var_226 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_88;
      }
      
      public function get dir() : int
      {
         return var_240;
      }
      
      public function get localZ() : Number
      {
         return var_2371;
      }
      
      public function get isMoving() : Boolean
      {
         return var_2368;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1809;
      }
      
      public function get targetX() : Number
      {
         return var_2369;
      }
      
      public function get targetY() : Number
      {
         return var_2370;
      }
      
      public function get targetZ() : Number
      {
         return var_2367;
      }
      
      public function get x() : Number
      {
         return var_87;
      }
      
      public function get actions() : Array
      {
         return var_226.slice();
      }
   }
}
