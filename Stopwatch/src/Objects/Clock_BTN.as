package Objects
{
	import Assets.Assets;
	
	import ViewModel.ViewModelLocator;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class Clock_BTN extends Sprite
	{
		public var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		private var Sprite:Bitmap;
		
		private var _StartPosition:Point;
		private var _EndPosition:Point;
		
		public function Clock_BTN()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE,init)
		}
		
		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			
			CreateSprite();
			
			y-=height/2;
			
			//Set StartPosition
			_StartPosition = new Point(x,y);
			_EndPosition = new Point(_StartPosition.x,_StartPosition.y+30);
			
			this.addEventListener(MouseEvent.CLICK,Press);
			this.addEventListener(MouseEvent.RIGHT_CLICK,ResetPress);
		}
				
		protected function ResetPress(event:MouseEvent):void
		{
				Stop();
				Locator.home.clock.ResetTime();
		}
		//localtoglobal
		protected function Press(event:MouseEvent):void
		{
			if(Locator.home.clock.IsTicking == false)
			{
				Start();
			}
			else
			{
				Stop();
			}
		}
		
		private function CreateSprite():void
		{
			Sprite = new Assets.Assets.Clock_BTN();
			Sprite.x = Math.ceil(-Sprite.width/2);
			Sprite.y = Math.ceil(-Sprite.height/2);
			this.addChild(Sprite);
		}
		
		public function Stop():void
		{
			x = _StartPosition.x;
			y = _StartPosition.y;
			
			Locator.home.clock.IsTicking = false;
		}
		
		public function Start():void
		{
			x = _EndPosition.x;
			y = _EndPosition.y;
			
			Locator.home.clock.IsTicking = true;
		}
	}
}