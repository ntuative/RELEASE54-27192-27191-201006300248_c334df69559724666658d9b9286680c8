package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2480:Boolean;
      
      private var var_2483:int;
      
      private var var_2482:Boolean;
      
      private var var_1712:String;
      
      private var var_1439:String;
      
      private var var_1897:int;
      
      private var var_2388:String;
      
      private var var_2481:String;
      
      private var var_2387:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1897 = param1.readInteger();
         this.var_1712 = param1.readString();
         this.var_2388 = param1.readString();
         this.var_2480 = param1.readBoolean();
         this.var_2482 = param1.readBoolean();
         param1.readString();
         this.var_2483 = param1.readInteger();
         this.var_2387 = param1.readString();
         this.var_2481 = param1.readString();
         this.var_1439 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1439;
      }
      
      public function get avatarName() : String
      {
         return this.var_1712;
      }
      
      public function get avatarId() : int
      {
         return this.var_1897;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2480;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2481;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2387;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2482;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2388;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2483;
      }
   }
}
