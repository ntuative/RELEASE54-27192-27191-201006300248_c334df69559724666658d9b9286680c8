package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1268:String = "F";
      
      public static const const_913:String = "M";
       
      
      private var var_87:Number = 0;
      
      private var var_417:String = "";
      
      private var var_2280:int = 0;
      
      private var var_2279:String = "";
      
      private var var_2278:int = 0;
      
      private var var_2182:int = 0;
      
      private var var_2281:String = "";
      
      private var var_649:String = "";
      
      private var _id:int = 0;
      
      private var var_221:Boolean = false;
      
      private var var_240:int = 0;
      
      private var var_2277:String = "";
      
      private var _name:String = "";
      
      private var var_2180:int = 0;
      
      private var _y:Number = 0;
      
      private var var_88:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_88;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_240;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_221)
         {
            var_240 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_221)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2280;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_221)
         {
            var_2278 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2277;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_221)
         {
            var_2281 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_221)
         {
            var_2277 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_221)
         {
            var_2182 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_221)
         {
            var_417 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_221)
         {
            var_2280 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_221)
         {
            var_649 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_2278;
      }
      
      public function get groupID() : String
      {
         return var_2281;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_221)
         {
            var_2180 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_221)
         {
            var_2279 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_221 = true;
      }
      
      public function get sex() : String
      {
         return var_649;
      }
      
      public function get figure() : String
      {
         return var_417;
      }
      
      public function get webID() : int
      {
         return var_2180;
      }
      
      public function get custom() : String
      {
         return var_2279;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_221)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_221)
         {
            var_88 = param1;
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
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_2182;
      }
   }
}
