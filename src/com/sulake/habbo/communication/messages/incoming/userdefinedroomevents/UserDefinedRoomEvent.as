package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class UserDefinedRoomEvent implements IDisposable
   {
       
      
      private var var_1150:Array;
      
      private var _disposed:Boolean;
      
      private var var_2160:int;
      
      private var _id:int;
      
      private var var_226:Array;
      
      public function UserDefinedRoomEvent(param1:IMessageDataWrapper)
      {
         var_226 = new Array();
         var_1150 = new Array();
         super();
         _id = param1.readInteger();
         var_2160 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1150.push(new TriggerDefinition(param1));
            _loc3_++;
         }
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_226.push(new ActionDefinition(param1));
            _loc3_++;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get triggers() : Array
      {
         return var_1150;
      }
      
      public function get propagation() : int
      {
         return var_2160;
      }
      
      public function get actions() : Array
      {
         return var_226;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_226 = null;
         var_1150 = null;
      }
   }
}
