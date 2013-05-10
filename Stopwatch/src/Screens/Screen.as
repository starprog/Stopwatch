package Screens
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import ViewModel.ViewModelLocator;
	
	public class Screen extends Sprite
	{
		public var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function Screen()
		{
			super();
		}
		
		public function SwitchToScreen():void
		{
			var screen:String =getDefinitionByName(getQualifiedClassName(this)).toString();
			//trace("screen: " + screen);
			switch(screen)
			{
				case "[class Home]":
					trace("Home Screen Active!!");
					//HideScreen(Locator.stopWatch);
					this.visible = true;						
					break;
				
			}
		}
		
		public function HideScreen(ScreenName:Screen):void
		{	
			ScreenName.visible = false;
		}
	}
}