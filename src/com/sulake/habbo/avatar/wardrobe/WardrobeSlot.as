package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IOutfit;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class WardrobeSlot implements IOutfit, IAvatarImageListener
   {
       
      
      private var var_417:String;
      
      private var _view:IWindowContainer;
      
      private var _isDisposed:Boolean;
      
      private var var_315:IBitmapWrapperWindow;
      
      private var var_1550:int;
      
      private var var_615:String;
      
      private var var_1288:Boolean;
      
      private var _controller:HabboAvatarEditor;
      
      public function WardrobeSlot(param1:HabboAvatarEditor, param2:int, param3:Boolean, param4:String = null, param5:String = null)
      {
         super();
         _controller = param1;
         var_1550 = param2;
         createView();
         update(param4,param5,param3);
      }
      
      private function createView() : void
      {
         var _loc1_:XmlAsset = _controller.assets.getAssetByName("wardrobe_slot") as XmlAsset;
         if(!_loc1_)
         {
            return;
         }
         _view = _controller.windowManager.buildFromXML(_loc1_.content as XML) as IWindowContainer;
         _view.procedure = eventHandler;
         _view.visible = false;
         var_315 = _view.findChildByName("image") as IBitmapWrapperWindow;
      }
      
      public function update(param1:String, param2:String, param3:Boolean) : void
      {
         switch(param2)
         {
            case FigureData.const_70:
            case "m":
            case "M":
               param2 = "null";
               break;
            case FigureData.FEMALE:
            case "f":
            case "F":
               param2 = "null";
         }
         var_417 = param1;
         var_615 = param2;
         var_1288 = param3;
         updateView();
      }
      
      public function updateView() : void
      {
         var _loc1_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Boolean = true;
         if(var_417 && var_1288)
         {
            _loc5_ = _controller.avatarRenderManager.createAvatarImage(figure,AvatarScaleType.SMALL,var_615,this);
            if(_loc5_)
            {
               _loc5_.setDirection(AvatarSetType.const_29,parseInt(FigureData.const_603));
               _loc1_ = _loc5_.getCroppedImage(AvatarSetType.const_29);
               _loc5_.dispose();
            }
         }
         else
         {
            _loc6_ = _controller.assets.getAssetByName("wardrobe_empty_slot") as BitmapDataAsset;
            if(_loc6_)
            {
               _loc1_ = _loc6_.content as BitmapData;
               _loc2_ = false;
            }
         }
         if(!_loc1_)
         {
            return;
         }
         if(var_315)
         {
            if(false)
            {
               var_315.bitmap.dispose();
            }
            var_315.bitmap = new BitmapData(var_315.width,var_315.height,true,0);
            _loc7_ = (0 - _loc1_.width) / 2;
            _loc8_ = (0 - _loc1_.height) / 2;
            var_315.bitmap.draw(_loc1_,new Matrix(1,0,0,1,_loc7_,_loc8_));
         }
         if(_loc2_)
         {
            _loc1_.dispose();
         }
         var _loc3_:IContainerButtonWindow = _view.findChildByName("set_button") as IContainerButtonWindow;
         if(_loc3_)
         {
            _loc3_.visible = var_1288;
         }
         var _loc4_:IContainerButtonWindow = _view.findChildByName("get_button") as IContainerButtonWindow;
         if(_loc4_)
         {
            _loc4_.visible = var_1288 && var_417 != null;
         }
      }
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "set_button":
               var_417 = _controller.figureData.getFigureString();
               var_615 = _controller.gender;
               _controller.handler.saveWardrobeOutfit(var_1550,this);
               updateView();
               break;
            case "get_button":
               if(var_417)
               {
                  _controller.loadAvatarInEditor(var_417,var_615,_controller.clubMemberLevel);
               }
         }
      }
      
      public function get gender() : String
      {
         return var_615;
      }
      
      public function get id() : int
      {
         return var_1550;
      }
      
      public function get figure() : String
      {
         return var_417;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         _controller = null;
         var_417 = null;
         var_615 = null;
         var_315 = null;
         if(_view)
         {
            _view.dispose();
            _view = null;
         }
         _isDisposed = true;
      }
      
      public function get view() : IWindowContainer
      {
         return _view;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         updateView();
      }
   }
}
