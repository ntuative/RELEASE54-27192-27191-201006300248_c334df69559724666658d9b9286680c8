package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1875:int;
      
      private var var_1874:int;
      
      private var var_1872:int;
      
      private var _userName:String;
      
      private var var_1873:int;
      
      private var var_1871:int;
      
      private var var_1870:int;
      
      private var _userId:int;
      
      private var var_823:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1871 = param1.readInteger();
         var_1873 = param1.readInteger();
         var_823 = param1.readBoolean();
         var_1872 = param1.readInteger();
         var_1874 = param1.readInteger();
         var_1875 = param1.readInteger();
         var_1870 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1870;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_823;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1873;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1874;
      }
      
      public function get cautionCount() : int
      {
         return var_1875;
      }
      
      public function get cfhCount() : int
      {
         return var_1872;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1871;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
