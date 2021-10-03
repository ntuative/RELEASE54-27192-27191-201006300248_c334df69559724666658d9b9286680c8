package com.sulake.core.window.graphics
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.graphics.renderer.ISkinRenderer;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowRendererItem implements IDisposable
   {
      
      private static const const_514:uint = 0;
      
      private static const const_780:uint = 1;
      
      private static const const_781:uint = 2;
       
      
      private var var_725:ISkinContainer;
      
      private var _drawBufferAllocator:DrawBufferAllocator;
      
      private var _disposed:Boolean;
      
      private var var_227:Rectangle;
      
      private var var_228:Boolean;
      
      private var var_99:BitmapData;
      
      private var var_1029:Matrix;
      
      private var var_151:WindowRenderer;
      
      private var var_1054:uint;
      
      private var _colorTransform:ColorTransform;
      
      private var var_724:uint;
      
      public function WindowRendererItem(param1:WindowRenderer, param2:DrawBufferAllocator, param3:ISkinContainer)
      {
         super();
         _disposed = false;
         var_151 = param1;
         var_725 = param3;
         _drawBufferAllocator = param2;
         var_1054 = 4294967295;
         var_724 = 0;
         _colorTransform = new ColorTransform();
         var_1029 = new Matrix();
         var_227 = new Rectangle();
      }
      
      public function get buffer() : BitmapData
      {
         return var_99;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : Boolean
      {
         var _loc4_:Boolean = false;
         switch(param3)
         {
            case WindowRedrawFlag.const_74:
               var_228 = true;
               _loc4_ = true;
               break;
            case WindowRedrawFlag.RESIZE:
               var_228 = true;
               _loc4_ = true;
               break;
            case WindowRedrawFlag.const_385:
               if(param1.testParamFlag(WindowParam.const_30))
               {
                  _loc4_ = true;
               }
               else
               {
                  IGraphicContextHost(param1).getGraphicContext(true).setDrawRegion(param1.rectangle,false);
               }
               break;
            case WindowRedrawFlag.const_985:
               var_724 = var_725.getTheActualState(param1.type,param1.style,param1.state);
               if(var_724 != var_1054)
               {
                  var_228 = true;
                  _loc4_ = true;
               }
               break;
            case WindowRedrawFlag.const_1055:
               if(param1.testParamFlag(WindowParam.const_30))
               {
                  var_228 = true;
                  _loc4_ = true;
               }
               else
               {
                  IGraphicContextHost(param1).getGraphicContext(true).blend = param1.blend;
               }
               break;
            case WindowRedrawFlag.const_288:
               _loc4_ = true;
         }
         if(_loc4_)
         {
            var_227.left = Math.min(var_227.left,param2.left);
            var_227.top = Math.min(var_227.top,param2.top);
            var_227.right = Math.max(var_227.right,param2.right);
            var_227.bottom = Math.max(var_227.bottom,param2.bottom);
         }
         return _loc4_;
      }
      
      public function testForStateChange(param1:IWindow) : Boolean
      {
         return var_725.getTheActualState(param1.type,param1.style,param1.state) != var_1054;
      }
      
      public function get dirty() : Rectangle
      {
         return var_227;
      }
      
      public function render(param1:IWindow, param2:Point, param3:Rectangle) : Boolean
      {
         var _loc4_:* = null;
         var _loc11_:* = 0;
         var _loc5_:uint = !!param1.background ? uint(const_781) : uint(const_514);
         var _loc7_:ISkinRenderer = resolveSkinRenderer(param1);
         if(_loc7_ != null)
         {
            if(_loc7_.isStateDrawable(var_724))
            {
               _loc5_ = const_780;
            }
         }
         var _loc8_:int = Math.max(param1.width,1);
         var _loc9_:int = Math.max(param1.height,1);
         if(_loc5_ != const_514)
         {
            if(var_99 == null)
            {
               var_99 = _drawBufferAllocator.allocate(_loc8_,_loc9_,true,param1.color);
               var_228 = true;
            }
            else if(var_99.width != _loc8_ || var_99.height != _loc9_)
            {
               _drawBufferAllocator.free(var_99);
               var_99 = _drawBufferAllocator.allocate(_loc8_,_loc9_,true,param1.color);
               var_228 = true;
            }
         }
         var _loc10_:IGraphicContext = IGraphicContextHost(param1).getGraphicContext(false);
         if(_loc10_)
         {
            _loc10_.setDrawRegion(param1.rectangle,!param1.testParamFlag(WindowParam.const_30));
         }
         if(_loc5_ != const_514)
         {
            var_1054 = var_724;
            _loc4_ = param1.fetchDrawBuffer() as BitmapData;
            if(_loc4_ != null)
            {
               _loc4_.lock();
               if(_loc5_ == const_780)
               {
                  if(!param1.testParamFlag(WindowParam.const_30))
                  {
                     _loc4_.fillRect(param3,0);
                  }
                  if(var_228)
                  {
                     var_228 = false;
                     var_99.fillRect(var_99.rect,param1.color);
                     _loc7_.draw(param1,var_99,var_99.rect,var_724,false);
                     if(!param1.background)
                     {
                        _loc11_ = uint(param1.color);
                        if((_loc11_ & 16777215) < 16777215)
                        {
                           var_99.colorTransform(_loc4_.rect,new ColorTransform(((_loc11_ & 16711680) >> 16) / 255,((_loc11_ & 65280) >> 8) / 255,(_loc11_ & 255) / 255));
                        }
                     }
                  }
                  if(param1.blend < 1 && param1.testParamFlag(WindowParam.const_30))
                  {
                     var_1029.tx = param2.x;
                     var_1029.ty = param2.y;
                     _colorTransform.alphaMultiplier = param1.blend;
                     param3.offset(param2.x,param2.y);
                     _loc4_.draw(var_99,var_1029,_colorTransform,null,param3,false);
                     param3.offset(-param2.x,-param2.y);
                  }
                  else
                  {
                     _loc4_.copyPixels(var_99,param3,param2,null,null,true);
                  }
               }
               else if(_loc5_ == const_781)
               {
                  if(param1.testParamFlag(WindowParam.const_30))
                  {
                     var_99.fillRect(var_99.rect,param1.color);
                     _loc4_.copyPixels(var_99,param3,param2,null,null,true);
                  }
                  else
                  {
                     _loc4_.fillRect(new Rectangle(param2.x,param2.y,param3.width,param3.height),param1.color);
                     _loc10_.blend = param1.blend;
                  }
               }
               _loc4_.unlock();
            }
            var_227.left = int.MAX_VALUE;
            var_227.top = int.MAX_VALUE;
            var_227.right = int.MIN_VALUE;
            var_227.bottom = int.MIN_VALUE;
         }
         return true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            var_151 = null;
            var_725 = null;
            if(var_99 != null)
            {
               _drawBufferAllocator.free(var_99);
               var_99 = null;
            }
         }
      }
      
      private function drawRect(param1:BitmapData, param2:Rectangle, param3:uint) : void
      {
         var _loc4_:int = 0;
         _loc4_ = param2.left;
         while(_loc4_ < param2.right)
         {
            param1.setPixel32(_loc4_,param2.top,param3);
            param1.setPixel32(_loc4_,param2.bottom - 1,param3);
            _loc4_++;
         }
         _loc4_ = param2.top;
         while(_loc4_ < param2.bottom)
         {
            param1.setPixel32(param2.left,_loc4_,param3);
            param1.setPixel32(param2.right - 1,_loc4_,param3);
            _loc4_++;
         }
      }
      
      private function resolveSkinRenderer(param1:IWindow) : ISkinRenderer
      {
         var _loc2_:ISkinRenderer = var_725.getSkinRendererByTypeAndStyle(param1.type,param1.style);
         if(_loc2_ == null)
         {
            if(param1.style != WindowStyle.const_917)
            {
               _loc2_ = var_725.getSkinRendererByTypeAndStyle(param1.type,WindowStyle.const_917);
            }
         }
         return _loc2_;
      }
   }
}
