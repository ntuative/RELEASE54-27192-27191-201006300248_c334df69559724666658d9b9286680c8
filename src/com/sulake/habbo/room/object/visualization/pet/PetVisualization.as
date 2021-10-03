package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IPetImageListener;
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
   
   public class PetVisualization extends RoomObjectSpriteVisualization implements IPetImageListener
   {
      
      private static const const_809:int = 2;
      
      private static const const_1151:Array = [0,0,0];
       
      
      private var var_417:String;
      
      private const const_1496:int = 1;
      
      private var var_451:String = "";
      
      private var var_819:int = 0;
      
      private var _isDisposed:Boolean = false;
      
      private var var_1800:int = 0;
      
      private var var_1250:String = "";
      
      private var var_1923:Boolean = false;
      
      private var var_402:Boolean;
      
      private const const_1149:int = 3;
      
      private var var_1643:String = "";
      
      private var var_67:IAvatarImage = null;
      
      private var var_818:int = 0;
      
      private const const_1754:int = 3;
      
      private var var_1453:int = -1;
      
      private var var_1463:Boolean = false;
      
      private var var_1641:int = -1;
      
      private var var_698:int = 0;
      
      private var var_2469:Array;
      
      private const const_1150:int = 0;
      
      private var var_1401:Boolean = false;
      
      private var var_1642:int = -1;
      
      private var var_392:ExperienceData;
      
      private var var_1704:Number = NaN;
      
      private var var_954:Boolean = false;
      
      private var var_1402:Boolean = false;
      
      private var var_331:BitmapDataAsset;
      
      private const const_1486:int = 2;
      
      private var var_1184:int = 0;
      
      private var _visualizationData:PetVisualizationData = null;
      
      private var var_554:Map;
      
      private var var_1462:Boolean = false;
      
      public function PetVisualization()
      {
         super();
         var_2469 = new Array();
         var_554 = new Map();
         var_402 = false;
      }
      
      public function imageReady() : void
      {
         var_1463 = true;
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_406,var_451,var_1643);
         if(var_1250 != null && var_1250 != "")
         {
            param1.appendAction(AvatarAction.const_275,var_1250);
         }
         if(var_1923 || var_1402)
         {
            param1.appendAction(AvatarAction.const_482);
         }
         param1.endActionAppends();
         var _loc2_:int = param1.getSprites().length + const_1149;
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      private function validateActions() : void
      {
         var _loc1_:int = 0;
         var_1462 = false;
         switch(var_451)
         {
            case AvatarAction.const_567:
            case AvatarAction.const_832:
            case AvatarAction.const_1027:
            case AvatarAction.const_937:
            case AvatarAction.const_895:
            case AvatarAction.const_946:
            case AvatarAction.const_630:
            case AvatarAction.const_293:
            case AvatarAction.const_286:
               var_1462 = true;
         }
         var_1401 = false;
         var_954 = false;
         if(var_451 == "lay")
         {
            var_954 = true;
            _loc1_ = int(var_1643);
            if(_loc1_ < 0)
            {
               var_1401 = true;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      private function resetAvatarImages() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_554)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         var_554.reset();
         var_67 = null;
      }
      
      public function petImageReady(param1:String) : void
      {
         resetAvatarImages();
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         _visualizationData = param1 as PetVisualizationData;
         createSprites(const_1149);
         var_392 = new ExperienceData(_visualizationData);
         return true;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.dispose();
         if(var_554 != null)
         {
            _loc1_ = var_554.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = var_554.getValue(_loc2_) as IAvatarImage;
               _loc3_.dispose();
            }
         }
         var_554.dispose();
         if(var_392)
         {
            var_392.dispose();
         }
         var_392 = null;
         _visualizationData = null;
         _isDisposed = true;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc2_:IRoomObjectSprite = getSprite(const_1496);
         var_331 = null;
         _loc2_ = getSprite(const_1496);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
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
         if(var_331)
         {
            _loc2_.asset = var_331.content as BitmapData;
            _loc2_.offsetX = _loc3_;
            _loc2_.offsetY = _loc4_;
            _loc2_.alpha = 50;
            _loc2_.relativeDepth = 1;
         }
         else
         {
            _loc2_.asset = null;
         }
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = var_554.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = _visualizationData.getAvatar(var_417,param1,this);
            if(_loc3_ != null)
            {
               var_554.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         if(param1.getUpdateID() != var_173)
         {
            var_1923 = param1.getNumber(RoomObjectVariableEnum.const_434) > 0;
            var_1250 = param1.getString(RoomObjectVariableEnum.const_282);
            var_451 = param1.getString(RoomObjectVariableEnum.const_505);
            var_1643 = param1.getString(RoomObjectVariableEnum.const_716);
            var_1704 = param1.getNumber(RoomObjectVariableEnum.const_355);
            var_1184 = param1.getNumber(RoomObjectVariableEnum.const_955);
            var_1800 = param1.getNumber(RoomObjectVariableEnum.const_919);
            validateActions();
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_174);
            if(var_417 != _loc3_)
            {
               var_417 = _loc3_;
               resetAvatarImages();
            }
            var_173 = param1.getUpdateID();
            return true;
         }
         return false;
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:* = null;
         var _loc25_:* = null;
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
         if(var_1463)
         {
            var_1463 = false;
            var_819 = 0;
            var_818 = 1;
            resetAvatarImages();
         }
         var _loc5_:Number = param1.scale;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = updateModel(_loc4_,_loc5_);
         if(_loc8_ || _loc5_ != var_157 || var_67 == null)
         {
            if(_loc5_ != var_157)
            {
               var_157 = _loc5_;
               _loc6_ = true;
            }
            if(_loc6_ || var_67 == null)
            {
               var_67 = getAvatarImage(_loc5_);
            }
            if(var_67 == null)
            {
               return;
            }
            if(_loc6_)
            {
               updateShadow(_loc5_);
            }
            _loc7_ = updateObject(_loc3_,param1,true);
            updateActions(var_67);
         }
         else
         {
            _loc7_ = updateObject(_loc3_,param1);
         }
         var _loc9_:Boolean = _loc7_ || _loc8_ || _loc6_;
         var _loc10_:Boolean = var_402 || var_818 > 0 || var_1462;
         var_392.alpha = 0;
         if(var_1184 > 0)
         {
            _loc11_ = param2 - var_1184;
            if(_loc11_ < AvatarAction.const_849)
            {
               var_392.alpha = int(Math.sin(_loc11_ / 0 * 0) * 255);
               var_392.setExperience(var_1800);
               var_818 = const_1754;
            }
            else
            {
               var_1184 = 0;
            }
            _loc12_ = getSprite(const_1486);
            if(_loc12_ != null)
            {
               if(false)
               {
                  _loc12_.asset = var_392.image;
                  _loc12_.offsetX = -20;
                  _loc12_.offsetY = -80;
                  _loc12_.alpha = var_392.alpha;
                  _loc12_.visible = true;
               }
               else
               {
                  _loc12_.asset = null;
                  _loc12_.visible = false;
               }
            }
         }
         if(_loc9_ || _loc10_)
         {
            increaseUpdateId();
            --var_818;
            ++var_698;
            --var_819;
            if(!(var_819 <= 0 || _loc6_))
            {
               return;
            }
            var_67.updateAnimationByFrames(1);
            var_819 = const_809;
            var_402 = var_67.isAnimating();
            _loc13_ = var_67.getCanvasOffsets();
            if(_loc13_ == null || _loc13_.length < 3)
            {
               _loc13_ = const_1151;
            }
            _loc14_ = 0;
            if(object.getLocation().z > 0)
            {
               _loc14_ = Math.min(_loc5_ / 2.75,0);
            }
            _loc12_ = getSprite(const_1150);
            if(_loc12_)
            {
               _loc17_ = var_67.getImage(AvatarSetType.const_29,false);
               if(_loc17_ != null)
               {
                  _loc12_.asset = _loc17_;
               }
               if(_loc5_ < 48)
               {
                  _loc12_.offsetX = -16 + _loc13_[0];
                  _loc12_.offsetY = -_loc12_.asset.height + 8 + _loc13_[1] + _loc14_;
               }
               else
               {
                  _loc12_.offsetX = -32 + _loc13_[0];
                  _loc12_.offsetY = -_loc12_.asset.height + 16 + _loc13_[1] + _loc14_;
               }
            }
            _loc15_ = const_1149;
            for each(_loc16_ in var_67.getSprites())
            {
               _loc12_ = getSprite(_loc15_);
               if(_loc12_ != null)
               {
                  _loc18_ = var_67.getLayerData(_loc16_);
                  _loc19_ = 0;
                  _loc20_ = _loc16_.getDirectionOffsetX(var_67.getDirection());
                  _loc21_ = _loc16_.getDirectionOffsetY(var_67.getDirection());
                  _loc22_ = _loc16_.getDirectionOffsetZ(var_67.getDirection());
                  _loc23_ = 0;
                  if(_loc16_.hasDirections)
                  {
                     _loc23_ = var_67.getDirection();
                  }
                  if(_loc18_ != null)
                  {
                     _loc19_ = _loc18_.animationFrame;
                     _loc20_ += _loc18_.dx;
                     _loc21_ += _loc18_.dy;
                     _loc23_ += _loc18_.directionOffset;
                  }
                  if(_loc5_ < 48)
                  {
                     _loc20_ /= 2;
                     _loc21_ /= 2;
                  }
                  if(_loc23_ < 0)
                  {
                     _loc23_ += 8;
                  }
                  if(_loc23_ > 7)
                  {
                     _loc23_ -= 8;
                  }
                  _loc24_ = var_67.getScale() + "_" + _loc16_.member + "_" + _loc23_ + "_" + _loc19_;
                  _loc25_ = var_67.getAsset(_loc24_);
                  if(_loc25_ != null)
                  {
                     _loc12_.asset = _loc25_.content as BitmapData;
                     _loc12_.offsetX = -1 * _loc25_.offset.x - _loc5_ / 2 + _loc20_;
                     _loc12_.offsetY = -1 * _loc25_.offset.y + _loc21_;
                     _loc12_.relativeDepth = -0.01 - 0.1 * _loc15_ * _loc22_;
                     if(_loc16_.ink == 33)
                     {
                        _loc12_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc12_.blendMode = BlendMode.NORMAL;
                     }
                     _loc15_++;
                  }
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
            if(isNaN(var_1704))
            {
               _loc5_ = _loc4_;
            }
            else
            {
               _loc5_ -= param2.direction.x;
               _loc5_ = (_loc5_ % 360 + 360) % 360;
            }
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
               _loc5_ -= 112.5;
               _loc5_ = (_loc5_ + 360) % 360;
               var_67.setDirectionAngle(AvatarSetType.const_39,_loc5_);
            }
            var_306 = param1.getUpdateID();
            var_1453 = param2.updateId;
            return true;
         }
         return false;
      }
   }
}
