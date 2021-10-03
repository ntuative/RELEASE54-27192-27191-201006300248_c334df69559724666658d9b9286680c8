package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1161:Array;
      
      private var var_2236:Boolean;
      
      private var var_1160:Array;
      
      private var var_2238:Boolean;
      
      private var var_2237:Boolean;
      
      private var var_2239:Boolean;
      
      private var var_167:Array;
      
      private var var_2234:Boolean;
      
      private var var_2235:Boolean;
      
      private var var_962:Array;
      
      private var var_2232:Boolean;
      
      private var var_2233:Boolean;
      
      public function ModeratorInitData(param1:IMessageDataWrapper)
      {
         super();
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_167 = [];
         var_1160 = [];
         var_1161 = [];
         var_962 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.parse(param1))
            {
               var_167.push(_loc2_.issueData);
            }
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1160.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_962.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_2234 = param1.readBoolean();
         var_2239 = param1.readBoolean();
         var_2238 = param1.readBoolean();
         var_2237 = param1.readBoolean();
         var_2233 = param1.readBoolean();
         var_2235 = param1.readBoolean();
         var_2236 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1161.push(param1.readString());
            _loc4_++;
         }
         var_2232 = param1.readBoolean();
      }
      
      public function get banPermission() : Boolean
      {
         return var_2233;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1160;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_2238;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_2236;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_2234;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_1160 = null;
         var_1161 = null;
         var_167 = null;
         for each(_loc1_ in var_962)
         {
            _loc1_.dispose();
         }
         var_962 = null;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return var_1161;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_2235;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_2237;
      }
      
      public function get offenceCategories() : Array
      {
         return var_962;
      }
      
      public function get issues() : Array
      {
         return var_167;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_2232;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_2239;
      }
   }
}
