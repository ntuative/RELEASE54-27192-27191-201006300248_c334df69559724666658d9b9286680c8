package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToWidth implements BinarySearchTest
   {
       
      
      private var var_454:int;
      
      private var var_176:String;
      
      private var var_220:ITextWindow;
      
      public function CutToWidth()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_176 = param1;
         var_220 = param2;
         var_454 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_220.text = var_176.substring(0,param1) + "...";
         return var_220.textWidth > var_454;
      }
   }
}
