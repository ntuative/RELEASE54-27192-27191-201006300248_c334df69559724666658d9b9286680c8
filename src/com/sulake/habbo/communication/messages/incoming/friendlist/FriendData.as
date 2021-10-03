package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_417:String;
      
      private var var_1438:String;
      
      private var var_1440:String;
      
      private var var_1313:int;
      
      private var var_615:int;
      
      private var var_1439:String;
      
      private var _name:String;
      
      private var var_1315:Boolean;
      
      private var var_823:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_615 = param1.readInteger();
         this.var_823 = param1.readBoolean();
         this.var_1315 = param1.readBoolean();
         this.var_417 = param1.readString();
         this.var_1313 = param1.readInteger();
         this.var_1440 = param1.readString();
         this.var_1438 = param1.readString();
         this.var_1439 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_615;
      }
      
      public function get realName() : String
      {
         return var_1439;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1440;
      }
      
      public function get categoryId() : int
      {
         return var_1313;
      }
      
      public function get online() : Boolean
      {
         return var_823;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1315;
      }
      
      public function get lastAccess() : String
      {
         return var_1438;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_417;
      }
   }
}
