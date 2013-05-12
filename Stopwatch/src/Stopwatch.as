package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import ViewModel.ViewModelLocator;
	import Screens.Home;
	import flash.geom.Rectangle;
	import Objects.Clock;
	import flash.display.*;
	
	[SWF(frameRate="60",width="1920",height="1080",backgroundColor="0x4C4C4C")]
	
	public class Stopwatch extends Sprite
	{
		private var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function Stopwatch()
		{
			super();
	
			this.stage.displayState=StageDisplayState.FULL_SCREEN;
			// support autoOrients
			//stage.align = StageAlign.TOP_LEFT;
			//stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			this.addEventListener(Event.ADDED_TO_STAGE,init)
		}
		
		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
					
			Locator.FPS = 60;
			
			setDeviceSize();
			
			CreateScreens();
			
			Locator.home.SwitchToScreen();
		}
		
		private function CreateScreens():void
		{
			Locator.stopWatch = this;
			
			Locator.home = new Home();

			this.addChild(Locator.home);

		}
		
		private function setDeviceSize():void
		{
			var deviceSize:Rectangle = new Rectangle(0,0,stage.fullScreenWidth,stage.fullScreenHeight);
			
			Locator.DeviceHeight=deviceSize.height;
			Locator.DeviceWidth=deviceSize.width;
			

		}
	}
}