package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_449:uint;
      
      private var var_1143:IUnknown;
      
      private var var_1397:String;
      
      private var var_1142:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_1142 = param1;
         var_1397 = getQualifiedClassName(var_1142);
         var_1143 = param2;
         var_449 = 0;
      }
      
      public function get iid() : IID
      {
         return var_1142;
      }
      
      public function get disposed() : Boolean
      {
         return var_1143 == null;
      }
      
      public function get references() : uint
      {
         return var_449;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_449) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1143;
      }
      
      public function get iis() : String
      {
         return var_1397;
      }
      
      public function reserve() : uint
      {
         return ++var_449;
      }
      
      public function dispose() : void
      {
         var_1142 = null;
         var_1397 = null;
         var_1143 = null;
         var_449 = 0;
      }
   }
}
