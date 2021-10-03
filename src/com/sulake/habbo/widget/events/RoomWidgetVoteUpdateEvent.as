package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_122:String = "RWPUE_VOTE_RESULT";
      
      public static const const_113:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1445:int;
      
      private var var_1122:String;
      
      private var var_752:Array;
      
      private var var_1152:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1122 = param2;
         var_1152 = param3;
         var_752 = param4;
         if(var_752 == null)
         {
            var_752 = [];
         }
         var_1445 = param5;
      }
      
      public function get votes() : Array
      {
         return var_752.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1445;
      }
      
      public function get question() : String
      {
         return var_1122;
      }
      
      public function get choices() : Array
      {
         return var_1152.slice();
      }
   }
}
