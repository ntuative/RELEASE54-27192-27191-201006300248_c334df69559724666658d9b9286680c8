package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_557:int = 6;
      
      public static const const_226:int = 5;
      
      public static const const_701:int = 2;
      
      public static const const_305:int = 9;
      
      public static const const_304:int = 4;
      
      public static const const_277:int = 2;
      
      public static const const_708:int = 4;
      
      public static const const_241:int = 8;
      
      public static const const_624:int = 7;
      
      public static const const_284:int = 3;
      
      public static const const_329:int = 1;
      
      public static const const_202:int = 5;
      
      public static const const_398:int = 12;
      
      public static const const_306:int = 1;
      
      public static const const_759:int = 11;
      
      public static const const_746:int = 3;
      
      public static const const_1685:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_460:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_460 = new Array();
         var_460.push(new Tab(_navigator,const_329,const_398,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_421));
         var_460.push(new Tab(_navigator,const_277,const_306,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_421));
         var_460.push(new Tab(_navigator,const_304,const_759,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_1030));
         var_460.push(new Tab(_navigator,const_284,const_226,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_421));
         var_460.push(new Tab(_navigator,const_202,const_241,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_641));
         setSelectedTab(const_329);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_460)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_460)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_460)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_304;
      }
      
      public function get tabs() : Array
      {
         return var_460;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
