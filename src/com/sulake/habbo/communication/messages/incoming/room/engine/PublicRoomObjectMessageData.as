package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class PublicRoomObjectMessageData
   {
       
      
      private var var_613:int = 0;
      
      private var var_88:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_221:Boolean = false;
      
      private var var_240:int = 0;
      
      private var _type:String = "";
      
      private var _name:String = "";
      
      private var var_87:Number = 0;
      
      private var var_502:int = 0;
      
      public function PublicRoomObjectMessageData()
      {
         super();
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_221)
         {
            var_88 = param1;
         }
      }
      
      public function get method_9() : int
      {
         return var_613;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get dir() : int
      {
         return var_240;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         if(!var_221)
         {
            _name = param1;
         }
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_221)
         {
            var_240 = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_221)
         {
            _y = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_221 = true;
      }
      
      public function get z() : Number
      {
         return var_88;
      }
      
      public function set method_9(param1:int) : void
      {
         if(!var_221)
         {
            var_613 = param1;
         }
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_221)
         {
            var_502 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_221)
         {
            var_87 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_87;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function set type(param1:String) : void
      {
         if(!var_221)
         {
            _type = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_502;
      }
   }
}
