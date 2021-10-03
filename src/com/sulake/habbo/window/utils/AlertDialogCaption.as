package com.sulake.habbo.window.utils
{
   class AlertDialogCaption implements ICaption
   {
       
      
      private var var_353:Boolean;
      
      private var var_220:String;
      
      private var var_1305:String;
      
      function AlertDialogCaption(param1:String, param2:String, param3:Boolean)
      {
         super();
         var_220 = param1;
         var_1305 = param2;
         var_353 = param3;
      }
      
      public function get toolTip() : String
      {
         return var_1305;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_353 = param1;
      }
      
      public function get text() : String
      {
         return var_220;
      }
      
      public function get visible() : Boolean
      {
         return var_353;
      }
      
      public function set toolTip(param1:String) : void
      {
         var_1305 = param1;
      }
      
      public function set text(param1:String) : void
      {
         var_220 = param1;
      }
   }
}
