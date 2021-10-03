package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class FramerateTracker
   {
       
      
      private var var_1267:int;
      
      private var var_354:Number;
      
      private var var_1655:int;
      
      private var var_958:int;
      
      private var var_2202:int;
      
      private var var_2203:Boolean;
      
      private var _reportIntervalMillis:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++var_958;
         var _loc3_:int = getTimer();
         if(var_958 == 1)
         {
            var_354 = param1;
            var_1267 = _loc3_;
         }
         else
         {
            _loc4_ = Number(var_958);
            var_354 = var_354 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(var_2203 && _loc3_ - var_1267 >= _reportIntervalMillis && var_1655 < var_2202)
         {
            _loc5_ = 1000 / var_354;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++var_1655;
            var_1267 = _loc3_;
            var_958 = 0;
         }
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         _reportIntervalMillis = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         var_2202 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         var_2203 = true;
      }
      
      public function dispose() : void
      {
      }
   }
}
