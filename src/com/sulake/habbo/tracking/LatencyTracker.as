package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
   import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LatencyTracker
   {
       
      
      private var var_162:Array;
      
      private var var_37:Boolean = false;
      
      private var var_1606:int = 0;
      
      private var var_1607:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_534:Map;
      
      private var var_2070:int = 0;
      
      private var var_1605:int = 0;
      
      private var var_150:IHabboConfigurationManager;
      
      private var var_1361:int = 0;
      
      private var _connection:IConnection;
      
      private var var_1608:int = 0;
      
      public function LatencyTracker()
      {
         super();
      }
      
      public function update(param1:uint) : void
      {
         if(!var_37)
         {
            return;
         }
         if(getTimer() - var_1606 > var_1607)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         var_1606 = getTimer();
         var_534.add(var_1361,var_1606);
         _connection.send(new LatencyPingRequestMessageComposer(var_1361));
         ++var_1361;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function init() : void
      {
         if(var_150 == null || _communication == null || _connection == null)
         {
            return;
         }
         var_1607 = int(var_150.getKey("latencytest.interval"));
         var_1608 = int(var_150.getKey("latencytest.report.index"));
         var_2070 = int(var_150.getKey("latencytest.report.delta"));
         _communication.addHabboConnectionMessageEvent(new LatencyPingResponseMessageEvent(onPingResponse));
         if(var_1607 < 1)
         {
            return;
         }
         var_534 = new Map();
         var_162 = new Array();
         var_37 = true;
      }
      
      private function onPingResponse(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(var_534 == null || var_162 == null)
         {
            return;
         }
         var _loc2_:LatencyPingResponseMessageParser = (param1 as LatencyPingResponseMessageEvent).getParser();
         var _loc3_:int = var_534.getValue(_loc2_.requestId);
         var_534.remove(_loc2_.requestId);
         var _loc4_:int = getTimer() - _loc3_;
         var_162.push(_loc4_);
         if(var_162.length == var_1608 && var_1608 > 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_162.length)
            {
               _loc5_ += var_162[_loc8_];
               _loc8_++;
            }
            _loc9_ = _loc5_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_162.length)
            {
               if(var_162[_loc8_] < _loc9_ * 2)
               {
                  _loc6_ += var_162[_loc8_];
                  _loc7_++;
               }
               _loc8_++;
            }
            if(_loc7_ == 0)
            {
               var_162 = [];
               return;
            }
            _loc10_ = _loc6_ / _loc7_;
            if(Math.abs(_loc9_ - var_1605) > var_2070 || var_1605 == 0)
            {
               var_1605 = _loc9_;
               _loc11_ = new LatencyPingReportMessageComposer(_loc9_,_loc10_,var_162.length);
               _connection.send(_loc11_);
            }
            var_162 = [];
         }
      }
      
      public function dispose() : void
      {
         var_37 = false;
         var_150 = null;
         _communication = null;
         _connection = null;
         if(var_534 != null)
         {
            var_534.dispose();
            var_534 = null;
         }
         var_162 = null;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_150 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
