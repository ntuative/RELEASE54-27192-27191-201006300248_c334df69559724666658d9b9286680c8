package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1666:String;
      
      private var var_1515:String;
      
      private var var_1163:String;
      
      private var var_409:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1666 = String(param1.@align);
         var_1163 = String(param1.@base);
         var_1515 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_409 = Number(_loc2_);
            if(var_409 > 1)
            {
               var_409 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1666;
      }
      
      public function get ink() : String
      {
         return var_1515;
      }
      
      public function get base() : String
      {
         return var_1163;
      }
      
      public function get isBlended() : Boolean
      {
         return var_409 != 1;
      }
      
      public function get blend() : Number
      {
         return var_409;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
