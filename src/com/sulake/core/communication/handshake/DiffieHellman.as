package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1400:BigInteger;
      
      private var var_674:BigInteger;
      
      private var var_1638:BigInteger;
      
      private var var_1639:BigInteger;
      
      private var var_2156:BigInteger;
      
      private var var_2155:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1400 = param1;
         var_1638 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2156.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1639 = new BigInteger();
         var_1639.fromRadix(param1,param2);
         var_2156 = var_1639.modPow(var_674,var_1400);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_2155.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1400.toString() + ",generator: " + var_1638.toString() + ",secret: " + param1);
         var_674 = new BigInteger();
         var_674.fromRadix(param1,param2);
         var_2155 = var_1638.modPow(var_674,var_1400);
         return true;
      }
   }
}
