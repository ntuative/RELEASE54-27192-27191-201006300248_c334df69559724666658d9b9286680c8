package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1241:Array;
      
      private var var_2269:String;
      
      private var var_2270:String;
      
      private var var_2268:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         var_1241 = param1;
         var_2269 = param2;
         var_2270 = param3;
         var_2268 = param4;
      }
      
      public function get colours() : Array
      {
         return var_1241;
      }
      
      public function get backgroundAssetName() : String
      {
         return var_2269;
      }
      
      public function get colourAssetName() : String
      {
         return var_2270;
      }
      
      public function get method_18() : String
      {
         return var_2268;
      }
   }
}
