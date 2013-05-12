package Screens
{
	import Objects.Clock;
	import Objects.Timeline;
	
	import flash.events.Event;
	
	public class Home extends Screen
	{
		public var clock:Clock;
		public var timeline:Timeline;
		
		public function Home()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE,init)
		}
		
		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			
			CreateObjects();
			PositionObjects();
			
			trace("HOME: Initialized");
		}
		
		private function CreateObjects():void
		{
			clock = new Clock();
			this.addChild(clock);
			
			timeline = new Timeline();
			this.addChild(timeline);
		}
		
		private function PositionObjects():void
		{
			clock.x = Locator.DeviceWidth/4;
			clock.y = Locator.DeviceHeight/2;
			
			timeline.x = Locator.DeviceWidth*0.75;
			timeline.y = Locator.DeviceHeight/2;
		}
	}
}