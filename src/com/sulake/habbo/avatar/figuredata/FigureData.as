package com.sulake.habbo.avatar.figuredata
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   
   public class FigureData implements IAvatarImageListener
   {
      
      public static const const_1350:String = "U";
      
      public static const FEMALE:String = "F";
      
      public static const const_70:String = "M";
      
      public static const const_214:String = "cc";
      
      public static const const_244:String = "cp";
      
      public static const const_163:String = "ch";
      
      public static const const_231:String = "sh";
      
      public static const FACE:String = "hd";
      
      public static const const_219:String = "ea";
      
      public static const const_381:String = "h";
      
      public static const const_220:String = "wa";
      
      public static const const_233:String = "fa";
      
      public static const const_102:String = "0";
      
      public static const const_603:String = "4";
      
      public static const const_161:String = "hr";
      
      public static const CHEST_ACCESSORIES:String = "ca";
      
      public static const TROUSERS:String = "lg";
      
      public static const const_199:String = "he";
      
      public static const const_237:String = "ha";
      
      public static const const_373:String = "std";
       
      
      private var _view:FigureDataView;
      
      private var _data:Dictionary;
      
      private var _isDisposed:Boolean;
      
      private var _colors:Dictionary;
      
      private var var_615:String = "M";
      
      private var _controller:HabboAvatarEditor;
      
      public function FigureData(param1:HabboAvatarEditor)
      {
         super();
         _controller = param1;
         _view = new FigureDataView(param1.windowManager,param1.assets);
      }
      
      public function get gender() : String
      {
         return var_615;
      }
      
      public function getFigureString() : String
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc1_:* = "";
         var _loc2_:* = [];
         for(_loc3_ in _data)
         {
            if(false)
            {
               _loc5_ = "null";
               _loc6_ = _colors[_loc3_] as Array;
               _loc7_ = _loc3_ + "-" + _loc5_;
               if(_loc6_)
               {
                  _loc8_ = 0;
                  while(_loc8_ < _loc6_.length)
                  {
                     _loc7_ += "-" + _loc6_[_loc8_];
                     _loc8_++;
                  }
               }
               _loc2_.push(_loc7_);
            }
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc1_ += _loc2_[_loc4_];
            if(_loc4_ < _loc2_.length - 1)
            {
               _loc1_ += ".";
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         updateView();
      }
      
      private function updateView() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:String = getFigureString();
         var _loc2_:IAvatarImage = _controller.avatarRenderManager.createAvatarImage(_loc1_,AvatarScaleType.const_49,gender,this);
         if(_loc2_)
         {
            _loc2_.setDirection(AvatarSetType.const_29,int(const_603));
            _loc3_ = _loc2_.getImage(AvatarSetType.const_29,true);
            _view.udpate(_loc3_);
            _loc2_.dispose();
         }
         else
         {
            Logger.log("Unable to create avatar image for the preview in avatar editor!");
            _loc4_ = new BitmapData(1,1);
            _view.udpate(_loc4_);
         }
      }
      
      public function getColourIds(param1:String) : Array
      {
         if(false)
         {
            return _colors[param1];
         }
         return [_controller.getDefaultColour(param1)];
      }
      
      public function savePartSetColourId(param1:String, param2:Array, param3:Boolean = true) : void
      {
         switch(param1)
         {
            case FACE:
            case const_161:
            case const_237:
            case const_199:
            case const_219:
            case const_233:
            case const_163:
            case const_214:
            case CHEST_ACCESSORIES:
            case const_244:
            case TROUSERS:
            case const_231:
            case const_220:
               _colors[param1] = param2;
               break;
            default:
               Logger.log("[FigureData] Unknown partset: " + param1 + ", can not store color-ids");
         }
         if(param3)
         {
            updateView();
         }
      }
      
      public function savePartData(param1:String, param2:int, param3:Array, param4:Boolean = false) : void
      {
         savePartSetId(param1,param2,param4);
         savePartSetColourId(param1,param3,param4);
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         _controller = null;
         _view = null;
         _data = null;
         _colors = null;
         _isDisposed = true;
      }
      
      private function parseFigureString(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1.split("."))
         {
            _loc3_ = _loc2_.split("-");
            if(_loc3_.length > 0)
            {
               _loc4_ = String(_loc3_[0]);
               _loc5_ = parseInt(_loc3_[1]);
               _loc6_ = new Array();
               _loc7_ = 2;
               while(_loc7_ < _loc3_.length)
               {
                  _loc6_.push(_loc3_[_loc7_]);
                  _loc7_++;
               }
               if(_loc6_.length == 0)
               {
                  _loc6_.push(0);
               }
               savePartSetId(_loc4_,_loc5_,false);
               savePartSetColourId(_loc4_,_loc6_,false);
            }
         }
      }
      
      public function loadAvatarData(param1:String, param2:String) : void
      {
         _data = new Dictionary();
         _colors = new Dictionary();
         var_615 = param2;
         parseFigureString(param1);
         updateView();
      }
      
      private function savePartSetId(param1:String, param2:int, param3:Boolean = true) : void
      {
         switch(param1)
         {
            case FACE:
            case const_161:
            case const_237:
            case const_199:
            case const_219:
            case const_233:
            case const_163:
            case const_214:
            case CHEST_ACCESSORIES:
            case const_244:
            case TROUSERS:
            case const_231:
            case const_220:
               if(param2 >= 0)
               {
                  _data[param1] = param2;
               }
               else
               {
                  delete _data[param1];
               }
               break;
            default:
               Logger.log("[FigureData] Unknown partset: " + param1 + ", can not store id: " + param2);
         }
         if(param3)
         {
            updateView();
         }
      }
      
      public function getFigureStringWithFace(param1:int) : String
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc2_:* = [];
         _loc2_.push(FACE);
         var _loc3_:* = "";
         var _loc4_:* = [];
         for each(_loc5_ in _loc2_)
         {
            if(false)
            {
               _loc7_ = 0;
               _loc8_ = _colors[_loc5_] as Array;
               if(_loc5_ == FACE)
               {
                  _loc7_ = param1;
               }
               _loc9_ = _loc5_ + "-" + _loc7_;
               if(_loc7_ >= 0)
               {
                  _loc10_ = 0;
                  while(_loc10_ < _loc8_.length)
                  {
                     _loc9_ += "-" + _loc8_[_loc10_];
                     _loc10_++;
                  }
               }
               _loc4_.push(_loc9_);
            }
         }
         _loc6_ = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc3_ += _loc4_[_loc6_];
            if(_loc6_ < _loc4_.length - 1)
            {
               _loc3_ += ".";
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      public function getPartSetId(param1:String) : int
      {
         if(false)
         {
            return _data[param1];
         }
         return -1;
      }
      
      public function get view() : FigureDataView
      {
         return _view;
      }
   }
}
