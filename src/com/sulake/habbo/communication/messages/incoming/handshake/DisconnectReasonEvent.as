package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1646:int = 5;
      
      public static const const_1553:int = 113;
      
      public static const const_1572:int = 29;
      
      public static const const_1694:int = 0;
      
      public static const const_1627:int = 102;
      
      public static const const_1559:int = 25;
      
      public static const const_1704:int = 20;
      
      public static const const_1692:int = 116;
      
      public static const const_1529:int = 114;
      
      public static const const_1623:int = 101;
      
      public static const const_1552:int = 108;
      
      public static const const_1530:int = 112;
      
      public static const const_1639:int = 100;
      
      public static const const_1653:int = 24;
      
      public static const const_1280:int = 10;
      
      public static const const_1602:int = 111;
      
      public static const const_1706:int = 23;
      
      public static const const_1549:int = 26;
      
      public static const const_1447:int = 2;
      
      public static const const_1647:int = 22;
      
      public static const const_1712:int = 17;
      
      public static const const_1703:int = 18;
      
      public static const const_1681:int = 3;
      
      public static const const_1670:int = 109;
      
      public static const const_1197:int = 1;
      
      public static const const_1680:int = 103;
      
      public static const const_1607:int = 11;
      
      public static const const_1605:int = 28;
      
      public static const const_1612:int = 104;
      
      public static const const_1548:int = 13;
      
      public static const const_1711:int = 107;
      
      public static const const_1544:int = 27;
      
      public static const const_1528:int = 118;
      
      public static const const_1677:int = 115;
      
      public static const const_1665:int = 16;
      
      public static const const_1700:int = 19;
      
      public static const const_1498:int = 4;
      
      public static const const_1592:int = 105;
      
      public static const const_1513:int = 117;
      
      public static const const_1565:int = 119;
      
      public static const const_1616:int = 106;
      
      public static const const_1710:int = 12;
      
      public static const const_1555:int = 110;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(reason)
         {
            case const_1197:
            case const_1280:
               return "banned";
            case const_1447:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
