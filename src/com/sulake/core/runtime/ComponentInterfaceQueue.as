package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1367:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_936:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1367 = param1;
         var_936 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_936;
      }
      
      public function get identifier() : IID
      {
         return var_1367;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1367 = null;
            while(false)
            {
               var_936.pop();
            }
            var_936 = null;
         }
      }
   }
}
