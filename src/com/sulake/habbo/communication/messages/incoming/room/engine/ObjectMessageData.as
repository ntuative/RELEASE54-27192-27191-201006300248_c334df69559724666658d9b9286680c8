package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_502:int = 0;
      
      private var _data:String = "";
      
      private var var_1661:int = -1;
      
      private var var_37:int = 0;
      
      private var _type:int = 0;
      
      private var var_613:int = 0;
      
      private var var_2530:String = "";
      
      private var var_2079:int = 0;
      
      private var _id:int = 0;
      
      private var var_221:Boolean = false;
      
      private var var_240:int = 0;
      
      private var var_2340:String = null;
      
      private var var_87:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_88:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_221)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_221)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_240;
      }
      
      public function get extra() : int
      {
         return var_1661;
      }
      
      public function get state() : int
      {
         return var_37;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_221)
         {
            var_240 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_221)
         {
            var_87 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_221)
         {
            var_1661 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_88;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_221)
         {
            var_37 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get expiryTime() : int
      {
         return var_2079;
      }
      
      public function get staticClass() : String
      {
         return var_2340;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_221)
         {
            var_2079 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_221)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_221)
         {
            var_2340 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_221 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_221)
         {
            var_502 = param1;
         }
      }
      
      public function set method_9(param1:int) : void
      {
         if(!var_221)
         {
            var_613 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_221)
         {
            var_88 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_502;
      }
      
      public function get x() : Number
      {
         return var_87;
      }
      
      public function get method_9() : int
      {
         return var_613;
      }
   }
}
