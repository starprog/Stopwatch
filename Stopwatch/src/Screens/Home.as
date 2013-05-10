package Screens
{
	import Objects.Clock;
	
	import flash.events.Event;
	
	public class Home extends Screen
	{
		public var clock:Clock;
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
			
			trace("Home Initialized!!");
		}
		
		private function CreateObjects():void
		{
			clock = new Clock();
			this.addChild(clock);
		}
		
		private function PositionObjects():void
		{
			clock.x = Locator.DeviceWidth/2;
			clock.y = Locator.DeviceHeight/2;
		}
	}
}