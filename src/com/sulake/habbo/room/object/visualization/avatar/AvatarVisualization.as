package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_809:int = 2;
      
      private static const const_1151:Array = [0,0,0];
       
      
      private var var_787:int = 0;
      
      private var var_417:String;
      
      private var var_2039:int = 0;
      
      private const const_1496:int = 1;
      
      private var var_451:String = "";
      
      private var var_819:int = 0;
      
      private var var_1250:int = 0;
      
      private var var_1923:Boolean = false;
      
      private var var_402:Boolean;
      
      private const const_1149:int = 3;
      
      private var var_1149:int = 0;
      
      private var _effectType:int = 0;
      
      private var var_67:IAvatarImage = null;
      
      private var var_1643:String = "";
      
      private var var_1979:Boolean = false;
      
      private var var_493:Boolean = false;
      
      private var var_2157:Boolean = false;
      
      private var var_818:int = 0;
      
      private var _isDisposed:Boolean;
      
      private const const_1754:int = 3;
      
      private var var_1453:int = -1;
      
      private var var_1642:int = -1;
      
      private var var_1401:Boolean = false;
      
      private var var_2469:Array;
      
      private const const_1150:int = 0;
      
      private var var_1641:int = -1;
      
      private var var_1704:int = -1;
      
      private var var_1148:int = 0;
      
      private var var_1640:int = 0;
      
      private var var_615:String;
      
      private var var_954:Boolean = false;
      
      private var var_1402:Boolean = false;
      
      private var var_555:BitmapDataAsset;
      
      private const const_1486:int = 2;
      
      private var _visualizationData:AvatarVisualizationData = null;
      
      private var var_331:BitmapDataAsset;
      
      private var var_554:Map;
      
      public function AvatarVisualization()
      {
         var_2469 = new Array();
         super();
         var_554 = new Map();
         var_402 = false;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         _visualizationData = param1 as AvatarVisualizationData;
         createSprites(const_1149);
         return true;
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            var_1402 = false;
         }
         if(var_451 == "sit" || var_451 == "lay")
         {
            var_1149 = param1 / 2;
         }
         else
         {
            var_1149 = 0;
         }
         var_1401 = false;
         var_954 = false;
         if(var_451 == "lay")
         {
            var_954 = true;
            _loc2_ = int(var_1643);
            if(_loc2_ < 0)
            {
               var_1401 = true;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         if(param1.getUpdateID() != var_173)
         {
            var_2157 = param1.getNumber(RoomObjectVariableEnum.const_210) > 0;
            var_1979 = param1.getNumber(RoomObjectVariableEnum.const_201) > 0;
            var_1923 = param1.getNumber(RoomObjectVariableEnum.const_434) > 0;
            var_1402 = param1.getNumber(RoomObjectVariableEnum.const_664) > 0;
            var_493 = param1.getNumber(RoomObjectVariableEnum.const_939) > 0;
            var_1250 = param1.getNumber(RoomObjectVariableEnum.const_282);
            var_451 = param1.getString(RoomObjectVariableEnum.const_505);
            var_1643 = param1.getString(RoomObjectVariableEnum.const_716);
            var_1640 = param1.getNumber(RoomObjectVariableEnum.const_957);
            _effectType = param1.getNumber(RoomObjectVariableEnum.const_478);
            var_1148 = param1.getNumber(RoomObjectVariableEnum.const_472);
            var_787 = param1.getNumber(RoomObjectVariableEnum.const_344);
            var_1704 = param1.getNumber(RoomObjectVariableEnum.const_355);
            if(var_1148 > 0 && param1.getNumber(RoomObjectVariableEnum.const_344) > 0)
            {
               var_787 = var_1148;
            }
            else
            {
               var_787 = 0;
            }
            validateActions(param2);
            var_615 = param1.getString(RoomObjectVariableEnum.const_992);
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_174);
            updateFigure(_loc3_);
            var_173 = param1.getUpdateID();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in var_554)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         var_554.reset();
         var_67 = null;
         _loc2_ = getSprite(const_1150);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
         }
      }
      
      private function updateFigure(param1:String) : void
      {
         if(var_417 != param1)
         {
            var_417 = param1;
            resetImages();
         }
      }
      
      override public function dispose() : void
      {
         if(var_554 != null)
         {
            resetImages();
            var_554.dispose();
            var_554 = null;
         }
         _visualizationData = null;
         var_331 = null;
         var_555 = null;
         super.dispose();
         _isDisposed = true;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(const_1496);
         var_331 = null;
         if(var_451 == "mv" || var_451 == "std")
         {
            _loc2_.visible = true;
            if(var_331 == null || param1 != var_157)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  var_331 = var_67.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  var_331 = var_67.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(var_331 != null)
               {
                  _loc2_.asset = var_331.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            var_331 = null;
            _loc2_.visible = false;
         }
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = var_554.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = _visualizationData.getAvatar(var_417,param1,var_615,this);
            if(_loc3_ != null)
            {
               var_554.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         resetImages();
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var_555 = null;
         var _loc2_:IRoomObjectSprite = getSprite(const_1486);
         if(var_493)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               var_555 = _visualizationData.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               var_555 = _visualizationData.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(var_451 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(var_451 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(var_555 != null)
            {
               _loc2_.asset = var_555.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(_visualizationData == null)
         {
            return;
         }
         var _loc4_:IRoomObjectModel = _loc3_.getModel();
         var _loc5_:Number = param1.scale;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = updateModel(_loc4_,_loc5_);
         if(_loc9_ || _loc5_ != var_157 || var_67 == null)
         {
            if(_loc5_ != var_157)
            {
               _loc7_ = true;
               validateActions(_loc5_);
            }
            if(_loc7_ || var_67 == null)
            {
               var_67 = getAvatarImage(_loc5_);
               _loc6_ = true;
            }
            if(var_67 == null)
            {
               return;
            }
            updateShadow(_loc5_);
            updateTypingBubble(_loc5_);
            _loc8_ = updateObject(_loc3_,param1,true);
            updateActions(var_67);
            var_157 = _loc5_;
         }
         else
         {
            _loc8_ = updateObject(_loc3_,param1);
         }
         var _loc10_:Boolean = _loc8_ || _loc9_ || _loc7_;
         var _loc11_:Boolean = var_402 || var_818 > 0;
         if(_loc10_)
         {
            var_818 = const_809;
         }
         if(_loc10_ || _loc11_)
         {
            increaseUpdateId();
            --var_818;
            --var_819;
            if(!(var_819 <= 0 || _loc7_ || _loc9_ || _loc6_))
            {
               return;
            }
            var_67.updateAnimationByFrames(1);
            var_819 = const_809;
            _loc13_ = var_67.getCanvasOffsets();
            if(_loc13_ == null || _loc13_.length < 3)
            {
               _loc13_ = const_1151;
            }
            _loc12_ = getSprite(const_1150);
            if(_loc12_ != null)
            {
               _loc16_ = var_67.getImage(AvatarSetType.const_29,false);
               if(_loc16_ != null)
               {
                  _loc12_.asset = _loc16_;
               }
               if(_loc12_.asset)
               {
                  _loc12_.offsetX = -1 * _loc5_ / 2 + _loc13_[0];
                  _loc12_.offsetY = -_loc12_.asset.height + _loc5_ / 4 + _loc13_[1] + var_1149;
               }
               if(var_954)
               {
                  if(var_1401)
                  {
                     _loc12_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc12_.relativeDepth = -0.409 + _loc13_[2];
                  }
               }
               else
               {
                  _loc12_.relativeDepth = -0.01 + _loc13_[2];
               }
            }
            _loc12_ = getSprite(const_1486);
            if(_loc12_ != null && _loc12_.visible)
            {
               if(!var_954)
               {
                  _loc12_.relativeDepth = -0.02 + _loc13_[2];
               }
               else
               {
                  _loc12_.relativeDepth = -0.44 + _loc13_[2];
               }
            }
            var_402 = var_67.isAnimating();
            _loc14_ = const_1149;
            for each(_loc15_ in var_67.getSprites())
            {
               if(_loc15_.id == "avatar")
               {
                  _loc12_ = getSprite(const_1150);
                  _loc17_ = var_67.getLayerData(_loc15_);
                  _loc18_ = _loc15_.getDirectionOffsetX(var_67.getDirection());
                  _loc19_ = _loc15_.getDirectionOffsetY(var_67.getDirection());
                  if(_loc17_ != null)
                  {
                     _loc18_ += _loc17_.dx;
                     _loc19_ += _loc17_.dy;
                  }
                  if(_loc5_ < 48)
                  {
                     _loc18_ /= 2;
                     _loc19_ /= 2;
                  }
                  _loc12_.offsetX += _loc18_;
                  _loc12_.offsetY += _loc19_;
               }
               else
               {
                  _loc12_ = getSprite(_loc14_);
                  if(_loc12_ != null)
                  {
                     _loc12_.visible = true;
                     _loc20_ = var_67.getLayerData(_loc15_);
                     _loc21_ = 0;
                     _loc22_ = _loc15_.getDirectionOffsetX(var_67.getDirection());
                     _loc23_ = _loc15_.getDirectionOffsetY(var_67.getDirection());
                     _loc24_ = _loc15_.getDirectionOffsetZ(var_67.getDirection());
                     _loc25_ = 0;
                     if(_loc15_.hasDirections)
                     {
                        _loc25_ = var_67.getDirection();
                     }
                     if(_loc20_ != null)
                     {
                        _loc21_ = _loc20_.animationFrame;
                        _loc22_ += _loc20_.dx;
                        _loc23_ += _loc20_.dy;
                        _loc25_ += _loc20_.directionOffset;
                     }
                     if(_loc5_ < 48)
                     {
                        _loc22_ /= 2;
                        _loc23_ /= 2;
                     }
                     if(_loc25_ < 0)
                     {
                        _loc25_ += 8;
                     }
                     else if(_loc25_ > 7)
                     {
                        _loc25_ -= 8;
                     }
                     _loc26_ = var_67.getScale() + "_" + _loc15_.member + "_" + _loc25_ + "_" + _loc21_;
                     _loc27_ = var_67.getAsset(_loc26_);
                     if(_loc27_ == null)
                     {
                        continue;
                     }
                     _loc12_.asset = _loc27_.content as BitmapData;
                     _loc12_.offsetX = -_loc27_.offset.x - _loc5_ / 2 + _loc22_;
                     _loc12_.offsetY = -_loc27_.offset.y + _loc23_ + var_1149;
                     if(var_954)
                     {
                        _loc12_.relativeDepth = -0.409 - 0.1 * spriteCount * _loc24_;
                     }
                     else
                     {
                        _loc12_.relativeDepth = -0.01 - 0.1 * spriteCount * _loc24_;
                     }
                     if(_loc15_.ink == 33)
                     {
                        _loc12_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc12_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc14_++;
               }
            }
         }
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean = false) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param3 || var_306 != param1.getUpdateID() || var_1453 != param2.updateId)
         {
            _loc4_ = param1.getDirection().x - param2.direction.x;
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = var_1704;
            if(var_451 == "float")
            {
               _loc5_ = _loc4_;
            }
            else
            {
               _loc5_ -= param2.direction.x;
            }
            _loc5_ = (_loc5_ % 360 + 360) % 360;
            if(_loc4_ != var_1641 || param3)
            {
               var_1641 = _loc4_;
               _loc4_ -= 112.5;
               _loc4_ = (_loc4_ + 360) % 360;
               var_67.setDirectionAngle(AvatarSetType.const_29,_loc4_);
            }
            if(_loc5_ != var_1642 || param3)
            {
               var_1642 = _loc5_;
               if(var_1642 != var_1641)
               {
                  _loc5_ -= 112.5;
                  _loc5_ = (_loc5_ + 360) % 360;
                  var_67.setDirectionAngle(AvatarSetType.const_39,_loc5_);
               }
            }
            var_306 = param1.getUpdateID();
            var_1453 = param2.updateId;
            return true;
         }
         return false;
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_406,var_451,var_1643);
         if(var_1250 > 0)
         {
            param1.appendAction(AvatarAction.const_275,AvatarAction.const_1235[var_1250]);
         }
         if(var_1640 > 0)
         {
            param1.appendAction(AvatarAction.const_1013,var_1640);
         }
         if(var_2039 > 0)
         {
            param1.appendAction(AvatarAction.const_978,var_2039);
         }
         if(var_1148 > 0)
         {
            param1.appendAction(AvatarAction.const_965,var_1148);
         }
         if(var_787 > 0)
         {
            param1.appendAction(AvatarAction.const_1001,var_787);
         }
         if(var_2157)
         {
            param1.appendAction(AvatarAction.const_293);
         }
         if(var_1923 || var_1402)
         {
            param1.appendAction(AvatarAction.const_482);
         }
         if(var_1979)
         {
            param1.appendAction(AvatarAction.const_286);
         }
         if(_effectType > 0)
         {
            param1.appendAction(AvatarAction.const_499,_effectType);
         }
         param1.endActionAppends();
         var_402 = param1.isAnimating();
         var _loc2_:int = const_1149;
         for each(_loc3_ in var_67.getSprites())
         {
            if(_loc3_.id != "avatarImage")
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
   }
}
