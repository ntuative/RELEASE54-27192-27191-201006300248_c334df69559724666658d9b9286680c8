package com.sulake.habbo.communication.messages.parser.advertisement
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class InterstitialMessageParser implements IMessageParser
   {
       
      
      private var _imageUrl:String;
      
      private var var_1575:String;
      
      public function InterstitialMessageParser()
      {
         super();
      }
      
      public function get imageUrl() : String
      {
         return _imageUrl;
      }
      
      public function get clickUrl() : String
      {
         return var_1575;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _imageUrl = param1.readString();
         var_1575 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
   }
}
