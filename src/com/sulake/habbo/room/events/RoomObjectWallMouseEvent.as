package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectWallMouseEvent extends RoomObjectMouseEvent
   {
       
      
      private var _direction:Number;
      
      private var var_1582:Vector3d = null;
      
      private var var_1583:Vector3d = null;
      
      private var var_1581:Vector3d = null;
      
      private var var_87:Number;
      
      private var _y:Number;
      
      public function RoomObjectWallMouseEvent(param1:String, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:IVector3d, param7:Number, param8:Number, param9:Number, param10:Boolean = false, param11:Boolean = false)
      {
         super(param1,param2,param3,param10,param11);
         var_1581 = new Vector3d();
         var_1581.assign(param4);
         var_1583 = new Vector3d();
         var_1583.assign(param5);
         var_1582 = new Vector3d();
         var_1582.assign(param6);
         var_87 = param7;
         _y = param8;
         _direction = param9;
      }
      
      public function get direction() : Number
      {
         return _direction;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get wallHeight() : IVector3d
      {
         return var_1582;
      }
      
      public function get x() : Number
      {
         return var_87;
      }
      
      public function get wallWidth() : IVector3d
      {
         return var_1583;
      }
      
      public function get method_15() : IVector3d
      {
         return var_1581;
      }
   }
}
