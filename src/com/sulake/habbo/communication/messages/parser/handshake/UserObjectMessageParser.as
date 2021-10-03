package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_417:String;
      
      private var var_2466:String;
      
      private var var_2467:int;
      
      private var var_2463:int;
      
      private var var_649:String;
      
      private var var_1439:String;
      
      private var _name:String;
      
      private var var_580:int;
      
      private var var_998:int;
      
      private var var_2465:int;
      
      private var _respectTotal:int;
      
      private var var_2464:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2463;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1439;
      }
      
      public function get customData() : String
      {
         return this.var_2466;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_580;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2467;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2464;
      }
      
      public function get figure() : String
      {
         return this.var_417;
      }
      
      public function get respectTotal() : int
      {
         return this._respectTotal;
      }
      
      public function get sex() : String
      {
         return this.var_649;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_417 = param1.readString();
         this.var_649 = param1.readString();
         this.var_2466 = param1.readString();
         this.var_1439 = param1.readString();
         this.var_2465 = param1.readInteger();
         this.var_2464 = param1.readString();
         this.var_2467 = param1.readInteger();
         this.var_2463 = param1.readInteger();
         this._respectTotal = param1.readInteger();
         this.var_998 = param1.readInteger();
         this.var_580 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2465;
      }
      
      public function get respectLeft() : int
      {
         return this.var_998;
      }
   }
}
