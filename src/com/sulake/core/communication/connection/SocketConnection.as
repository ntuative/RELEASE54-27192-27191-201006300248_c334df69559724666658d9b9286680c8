package com.sulake.core.communication.connection
{
   import com.sulake.core.communication.ICoreCommunicationManager;
   import com.sulake.core.communication.encryption.IEncryption;
   import com.sulake.core.communication.messages.IMessageClassManager;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IMessageConfiguration;
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.communication.messages.MessageClassManager;
   import com.sulake.core.communication.messages.MessageDataWrapper;
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.ErrorReportStorage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.Socket;
   import flash.system.Security;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class SocketConnection extends EventDispatcher implements IConnection, IDisposable
   {
      
      public static const const_1302:int = 10000;
       
      
      private var _disposed:Boolean = false;
      
      private var var_1452:Boolean = false;
      
      private var var_77:Socket;
      
      private var var_984:IEncryption;
      
      private var var_814:int;
      
      private var var_298:ByteArray;
      
      private var _id:String;
      
      private var var_309:ICoreCommunicationManager;
      
      private var var_390:Timer;
      
      private var var_389:IConnectionStateListener;
      
      private var var_676:IProtocol;
      
      private var var_983:IMessageClassManager;
      
      public function SocketConnection(param1:String, param2:ICoreCommunicationManager, param3:IConnectionStateListener)
      {
         super();
         _id = param1;
         var_309 = param2;
         var_298 = new ByteArray();
         var_983 = new MessageClassManager();
         var_77 = new Socket();
         var_390 = new Timer(const_1302,1);
         var_390.addEventListener(TimerEvent.TIMER,onTimeOutTimer);
         var_77.addEventListener(Event.CONNECT,onConnect);
         var_77.addEventListener(Event.COMPLETE,onComplete);
         var_77.addEventListener(Event.CLOSE,onClose);
         var_77.addEventListener(ProgressEvent.SOCKET_DATA,onRead);
         var_77.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
         var_77.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_389 = param3;
      }
      
      private function onTimeOutTimer(param1:TimerEvent) : void
      {
         var_390.stop();
         logConnection("[SocketConnection] TimeOut Error");
         ErrorReportStorage.addDebugData("ConnectionTimer","TimeOut in " + (getTimer() - var_814));
         var _loc2_:IOErrorEvent = new IOErrorEvent(IOErrorEvent.IO_ERROR);
         _loc2_.text = "Socket Timeout (undefined ms). Possible Firewall.";
         dispatchEvent(_loc2_);
      }
      
      public function setEncryption(param1:IEncryption) : void
      {
         var_984 = param1;
      }
      
      public function get connected() : Boolean
      {
         return var_77.connected;
      }
      
      private function onConnect(param1:Event) : void
      {
         logConnection("[SocketConnection] Connected");
         var_390.stop();
         var_1452 = true;
         ErrorReportStorage.addDebugData("ConnectionTimer","Connected in " + (getTimer() - var_814));
         dispatchEvent(param1);
      }
      
      public function send(param1:IMessageComposer, param2:int = -1) : Boolean
      {
         if(this.disposed)
         {
            return false;
         }
         var _loc3_:ByteArray = new ByteArray();
         var _loc4_:int = this.var_983.getMessageComposerID(param1);
         if(_loc4_ < 0)
         {
            logConnection("Could not find registered message composer for " + param1);
            return false;
         }
         var _loc5_:ByteArray = var_676.encoder.encode(_loc4_,param1.getMessageArray(),param2);
         if(var_389)
         {
            var_389.messageSent(String(_loc4_),_loc5_.toString());
         }
         if(var_984 != null)
         {
            _loc3_ = var_984.encipher(_loc5_);
         }
         else
         {
            _loc3_ = _loc5_;
         }
         logConnection("<< [SOCKET]: " + [_loc4_,param1.getMessageArray(),"->",_loc3_]);
         if(false)
         {
            var_77.writeBytes(_loc3_);
            var_77.flush();
            return true;
         }
         logConnection("[SOCKET] Not connected.");
         return false;
      }
      
      public function init(param1:String, param2:uint = 0) : Boolean
      {
         if(var_389)
         {
            var_389.connectionInit(param1,param2);
         }
         Security.loadPolicyFile("xmlsocket://" + param1 + ":" + param2);
         var_390.start();
         var_814 = getTimer();
         var_77.connect(param1,param2);
         return true;
      }
      
      private function onRead(param1:ProgressEvent) : void
      {
         if(!var_77)
         {
            return;
         }
         while(false)
         {
            var_298.writeByte(var_77.readUnsignedByte());
         }
         logConnection(">>[SOCKET]: " + var_298.toString());
      }
      
      public function get protocol() : IProtocol
      {
         return var_676;
      }
      
      public function addMessageEvent(param1:IMessageEvent) : void
      {
         var_309.addConnectionMessageEvent(_id,param1);
      }
      
      public function dispose() : void
      {
         _disposed = true;
         if(var_77)
         {
            var_77.removeEventListener(Event.CONNECT,onConnect);
            var_77.removeEventListener(Event.COMPLETE,onComplete);
            var_77.removeEventListener(Event.CLOSE,onClose);
            var_77.removeEventListener(ProgressEvent.SOCKET_DATA,onRead);
            var_77.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
            var_77.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            if(var_1452)
            {
               var_77.close();
            }
         }
         var_77 = null;
         var_298 = null;
         var_389 = null;
         var_984 = null;
         var_676 = null;
         _id = null;
         var_983 = null;
         var_309 = null;
         var_389 = null;
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         var_390.stop();
         logConnection("[SocketConnection] Security Error: " + param1.text);
         ErrorReportStorage.addDebugData("ConnectionTimer","SecurityError in " + (getTimer() - var_814));
         dispatchEvent(param1);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function registerMessageClasses(param1:IMessageConfiguration) : void
      {
         var_983.registerMessages(param1);
      }
      
      public function set protocol(param1:IProtocol) : void
      {
         var_676 = param1;
      }
      
      private function onComplete(param1:Event) : void
      {
         var_390.stop();
         logConnection("[SocketConnection] Complete");
         ErrorReportStorage.addDebugData("ConnectionTimer","Completed in " + (getTimer() - var_814));
         dispatchEvent(param1);
      }
      
      public function processReceivedData() : void
      {
         var id:int = 0;
         var message:Array = null;
         var data:ByteArray = null;
         var eventClasses:Array = null;
         var events:Array = null;
         var eventClass:Class = null;
         var parserInstance:IMessageParser = null;
         var parserClassCurrent:Class = null;
         var messageEventInstance:IMessageEvent = null;
         var eventsForClass:Array = null;
         var parserClass:Class = null;
         var wasParsed:Boolean = false;
         var dataClone:ByteArray = null;
         var dataWrapper:IMessageDataWrapper = null;
         var temp:ByteArray = null;
         if(disposed)
         {
            return;
         }
         var receivedMessages:Array = new Array();
         var offset:uint = var_676.getMessages(var_298,receivedMessages);
         var time:Number = new Date().getTime();
         try
         {
            for each(message in receivedMessages)
            {
               id = message[0] as int;
               data = message[1] as ByteArray;
               if(var_389)
               {
                  var_389.messageReceived(String(id),data.toString());
               }
               logConnection(">>[SocketConnection] timestamp:" + getTimer() + " Received message id: " + id + " data: " + data.toString());
               eventClasses = var_983.getMessageEventClasses(id);
               events = new Array();
               for each(eventClass in eventClasses)
               {
                  eventsForClass = var_309.getMessageEvents(this,eventClass);
                  events = events.concat(eventsForClass);
               }
               if(events.length == 0)
               {
                  logConnection(">>[SocketConnection] No message event listeners defined for id: " + id);
               }
               parserInstance = null;
               parserClassCurrent = null;
               for each(messageEventInstance in events)
               {
                  parserClass = messageEventInstance.parserClass;
                  if(parserClass == null)
                  {
                     logConnection(">>[SocketConnection] Message Event Has no parser defined, use annotation?: " + [id,messageEventInstance]);
                  }
                  else
                  {
                     wasParsed = false;
                     if(parserClass != parserClassCurrent)
                     {
                        dataClone = new ByteArray();
                        dataClone.writeBytes(data);
                        dataClone.position = data.position;
                        dataWrapper = new MessageDataWrapper(dataClone,protocol.decoder);
                        parserInstance = var_309.getMessageParser(parserClass);
                        if(!parserInstance.flush())
                        {
                           logConnection(">>[SocketConnection] Message Event Parser wasn\'t flushed: " + [id,parserClass,parserInstance]);
                        }
                        else if(parserInstance.parse(dataWrapper))
                        {
                           parserClassCurrent = parserClass;
                           wasParsed = true;
                        }
                     }
                     else
                     {
                        wasParsed = true;
                     }
                     if(wasParsed)
                     {
                        messageEventInstance.connection = this;
                        messageEventInstance.parser = parserInstance;
                        messageEventInstance.callback.call(null,messageEventInstance);
                     }
                     else
                     {
                        logConnection(">>[SocketConnection] Could not parse message: " + [id,eventClass,messageEventInstance]);
                        parserClassCurrent = null;
                        parserInstance = null;
                     }
                  }
               }
            }
            if(offset == var_298.length)
            {
               var_298 = new ByteArray();
            }
            else if(offset > 0)
            {
               temp = new ByteArray();
               temp.writeBytes(var_298,offset);
               var_298 = temp;
               logConnection("[SOCKET REST] offset: " + offset + " rest: " + var_298.toString());
            }
         }
         catch(e:Error)
         {
            if(!disposed)
            {
               ErrorReportStorage.addDebugData("SocketConnection","Crashed while processing incoming message with id=\"" + id + "\"!");
               throw e;
            }
         }
      }
      
      public function set timeout(param1:int) : void
      {
         var_390.delay = param1;
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         var_390.stop();
         logConnection("[SocketConnection] IO Error: " + param1.text);
         ErrorReportStorage.addDebugData("ConnectionTimer","IOError in " + (getTimer() - var_814));
         switch(param1.type)
         {
            case IOErrorEvent.IO_ERROR:
               break;
            case IOErrorEvent.DISK_ERROR:
               break;
            case IOErrorEvent.NETWORK_ERROR:
               break;
            case IOErrorEvent.VERIFY_ERROR:
         }
         dispatchEvent(param1);
      }
      
      private function onClose(param1:Event) : void
      {
         var_390.stop();
         logConnection("[SocketConnection] Closed");
         var_1452 = false;
         ErrorReportStorage.addDebugData("ConnectionTimer","Closed in " + (getTimer() - var_814));
         dispatchEvent(param1);
      }
      
      private function logConnection(param1:String) : void
      {
      }
      
      override public function toString() : String
      {
         var _loc1_:* = "";
         _loc1_ += "Socket Connection: \n";
         _loc1_ += "Protocol Encoder: undefined\n";
         _loc1_ += "Protocol Decoder: undefined\n";
         return _loc1_ + ("Encryption: " + var_984 + "\n");
      }
   }
}
