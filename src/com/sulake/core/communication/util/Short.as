package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_834:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_834 = new ByteArray();
         var_834.writeShort(param1);
         var_834.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_834.position = 0;
         if(false)
         {
            _loc1_ = var_834.readShort();
            var_834.position = 0;
         }
         return _loc1_;
      }
   }
}
