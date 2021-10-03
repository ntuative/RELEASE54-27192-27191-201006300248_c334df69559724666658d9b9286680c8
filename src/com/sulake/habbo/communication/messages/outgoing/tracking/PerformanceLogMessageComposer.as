package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1058:int = 0;
      
      private var var_1460:int = 0;
      
      private var var_1841:String = "";
      
      private var var_1057:int = 0;
      
      private var var_2356:String = "";
      
      private var var_2354:int = 0;
      
      private var var_1531:String = "";
      
      private var var_2046:int = 0;
      
      private var var_2355:int = 0;
      
      private var var_1840:String = "";
      
      private var var_2353:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_2046 = param1;
         var_1840 = param2;
         var_1531 = param3;
         var_1841 = param4;
         var_2356 = param5;
         if(param6)
         {
            var_1460 = 1;
         }
         else
         {
            var_1460 = 0;
         }
         var_2354 = param7;
         var_2355 = param8;
         var_1057 = param9;
         var_2353 = param10;
         var_1058 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2046,var_1840,var_1531,var_1841,var_2356,var_1460,var_2354,var_2355,var_1057,var_2353,var_1058];
      }
      
      public function dispose() : void
      {
      }
   }
}
