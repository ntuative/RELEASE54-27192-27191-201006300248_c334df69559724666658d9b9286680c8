package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2223:int;
      
      private var var_2296:String;
      
      private var var_1789:int;
      
      private var _disposed:Boolean;
      
      private var var_2297:int;
      
      private var var_1792:String;
      
      private var var_1413:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1792 = param1.readString();
         var_2223 = param1.readInteger();
         var_1789 = param1.readInteger();
         var_2296 = param1.readString();
         var_2297 = param1.readInteger();
         var_1413 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_2297;
      }
      
      public function get worldId() : int
      {
         return var_1789;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_1792;
      }
      
      public function get unitPort() : int
      {
         return var_2223;
      }
      
      public function get castLibs() : String
      {
         return var_2296;
      }
      
      public function get nodeId() : int
      {
         return var_1413;
      }
   }
}
