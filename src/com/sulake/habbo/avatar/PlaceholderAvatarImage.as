package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import flash.display.BitmapData;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
       
      
      private const PLACEHOLDER_FIGURE:String = "hd-99999-99999";
      
      private var var_1362:GlowFilter;
      
      private var var_281:BitmapData;
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:String)
      {
         var_1362 = new GlowFilter(16777215);
         super(param1,param2,new AvatarFigureContainer(PLACEHOLDER_FIGURE),param3,null);
      }
      
      override public function getImage(param1:String, param2:Boolean) : BitmapData
      {
         if(param2)
         {
            return super.getImage(param1,param2);
         }
         var _loc3_:BitmapData = super.getImage(param1,param2);
         if(!var_281)
         {
            var_281 = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
         }
         var_281.fillRect(var_281.rect,16777215);
         var_281.copyPixels(_loc3_,_loc3_.rect,new Point(0,0),null,null,true);
         var_281.applyFilter(var_281,var_281.rect,new Point(0,0),var_1362);
         return var_281;
      }
      
      override public function dispose() : void
      {
         if(var_281)
         {
            var_281.dispose();
            var_281 = null;
         }
         var_1362 = null;
         super.dispose();
      }
      
      override public function getCroppedImage(param1:String) : BitmapData
      {
         return super.getCroppedImage(param1);
      }
   }
}
