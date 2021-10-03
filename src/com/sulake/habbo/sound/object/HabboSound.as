package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1076:SoundChannel = null;
      
      private var var_895:Boolean;
      
      private var var_1075:Sound = null;
      
      private var var_761:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_1075 = param1;
         var_1075.addEventListener(Event.COMPLETE,onComplete);
         var_761 = 1;
         var_895 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_895;
      }
      
      public function stop() : Boolean
      {
         var_1076.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_895 = false;
         var_1076 = var_1075.play(0);
         this.volume = var_761;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_761;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_1076.position;
      }
      
      public function get length() : Number
      {
         return var_1075.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_761 = param1;
         if(var_1076 != null)
         {
            var_1076.soundTransform = new SoundTransform(var_761);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_895 = true;
      }
   }
}
