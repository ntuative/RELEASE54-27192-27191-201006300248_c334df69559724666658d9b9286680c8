package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_412:FloorRasterizer;
      
      private var var_935:Boolean = false;
      
      private var var_609:PlaneMaskManager;
      
      private var var_411:WallRasterizer;
      
      private var var_610:WallAdRasterizer;
      
      private var var_413:LandscapeRasterizer;
      
      public function RoomVisualizationData()
      {
         super();
         var_411 = new WallRasterizer();
         var_412 = new FloorRasterizer();
         var_610 = new WallAdRasterizer();
         var_413 = new LandscapeRasterizer();
         var_609 = new PlaneMaskManager();
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return var_411;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return var_610;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return var_412;
      }
      
      public function get initialized() : Boolean
      {
         return var_935;
      }
      
      protected function reset() : void
      {
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return var_609;
      }
      
      public function dispose() : void
      {
         if(var_411 != null)
         {
            var_411.dispose();
            var_411 = null;
         }
         if(var_412 != null)
         {
            var_412.dispose();
            var_412 = null;
         }
         if(var_610 != null)
         {
            var_610.dispose();
            var_610 = null;
         }
         if(var_413 != null)
         {
            var_413.dispose();
            var_413 = null;
         }
         if(var_609 != null)
         {
            var_609.dispose();
            var_609 = null;
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            var_411.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            var_412.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            var_610.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            var_413.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            var_609.initialize(_loc11_);
         }
         return true;
      }
      
      public function clearCache() : void
      {
         if(var_411 != null)
         {
            var_411.clearCache();
         }
         if(var_412 != null)
         {
            var_412.clearCache();
         }
         if(var_413 != null)
         {
            var_413.clearCache();
         }
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return var_413;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(var_935)
         {
            return;
         }
         var_411.initializeAssetCollection(param1);
         var_412.initializeAssetCollection(param1);
         var_610.initializeAssetCollection(param1);
         var_413.initializeAssetCollection(param1);
         var_609.initializeAssetCollection(param1);
         var_935 = true;
      }
   }
}
