package Objects
{
	import Assets.*;
	
	import ViewModel.ViewModelLocator;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Clock extends Sprite
	{
		public var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		private var Sprite:Bitmap;
		
		public function Clock()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE,init)
		}
		
		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			
			CreateSprite();
			
			trace("Clock Initialized");
		}
		
		private function CreateSprite():void
		{
			Sprite = new Assets.Assets.Clock();
			Sprite.x = Math.ceil(-Sprite.width/2);
			Sprite.y = Math.ceil(-Sprite.height/2);
			this.addChild(Sprite);
			
			trace("Clock Width = "+Sprite.width);
		}
	}
}