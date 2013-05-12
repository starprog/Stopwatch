package Objects
{
	import Assets.Assets;
	
	import ViewModel.ViewModelLocator;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class SecondHand extends Sprite
	{
		public var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		private var Sprite:Bitmap;
		
		public function SecondHand()
		{			
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE,init)
		}
		
		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			
			CreateSprite();
		}
		
		private function CreateSprite():void
		{
			Sprite = new Assets.Assets.SecondHand();
			Sprite.x = Math.ceil(-Sprite.width/2);
			Sprite.y = Math.ceil(-Sprite.height/2);
			this.addChild(Sprite);
		}
		
		public function Update():void
		{
			RotationHandler();
		}
		
		private function RotationHandler():void
		{
			var degree:int = (360/60*Locator.home.clock.SecondValue);
			rotation = degree;
		}
	}
}