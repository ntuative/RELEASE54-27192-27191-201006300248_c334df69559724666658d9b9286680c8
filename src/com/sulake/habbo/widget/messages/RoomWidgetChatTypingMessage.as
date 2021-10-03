package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_637:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_493:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_637);
         var_493 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_493;
      }
   }
}
