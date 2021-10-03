package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_125:DisplayObject;
      
      private var var_2479:uint;
      
      private var var_976:IWindowToolTipAgentService;
      
      private var var_980:IWindowMouseScalingService;
      
      private var var_244:IWindowContext;
      
      private var var_979:IWindowFocusManagerService;
      
      private var var_978:IWindowMouseListenerService;
      
      private var var_977:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2479 = 0;
         var_125 = param2;
         var_244 = param1;
         var_977 = new WindowMouseDragger(param2);
         var_980 = new WindowMouseScaler(param2);
         var_978 = new WindowMouseListener(param2);
         var_979 = new FocusManager(param2);
         var_976 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_980;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_979;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_976;
      }
      
      public function dispose() : void
      {
         if(var_977 != null)
         {
            var_977.dispose();
            var_977 = null;
         }
         if(var_980 != null)
         {
            var_980.dispose();
            var_980 = null;
         }
         if(var_978 != null)
         {
            var_978.dispose();
            var_978 = null;
         }
         if(var_979 != null)
         {
            var_979.dispose();
            var_979 = null;
         }
         if(var_976 != null)
         {
            var_976.dispose();
            var_976 = null;
         }
         var_244 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_978;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_977;
      }
   }
}
