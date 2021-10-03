package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_122:String = "RSPE_VOTE_RESULT";
      
      public static const const_113:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1445:int = 0;
      
      private var var_1122:String = "";
      
      private var var_752:Array;
      
      private var var_1152:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_1152 = [];
         var_752 = [];
         super(param1,param2,param7,param8);
         var_1122 = param3;
         var_1152 = param4;
         var_752 = param5;
         if(var_752 == null)
         {
            var_752 = [];
         }
         var_1445 = param6;
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
