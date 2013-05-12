package Objects
{
	import Objects.Activity;
	import Assets.Assets;
	
	import ViewModel.ViewModelLocator;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Timeline extends Sprite
	{
		public var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public var TestActivity1:Activity;
		public var TestActivity2:Activity;
		public var TestActivity3:Activity;
		public var TestActivity4:Activity;
		public var ActivityCollection:Array = new Array();
		
		private var Sprite:Bitmap;
		
		public function Timeline()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE,init)
		}
		
		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			
			CreateObjects();
		}
		
		private function CreateObjects():void
		{
			CreateActivities();
		}
		
		private function CreateActivities():void
		{
			TestActivity1 = new Activity("TestActivity1",1,15);
			TestActivity1.Sprite = new Assets.Assets.TestActivity1();
			addChild(TestActivity1);
			ActivityCollection.push(TestActivity1);
			
			TestActivity2 = new Activity("TestActivity2",16,30);
			TestActivity2.Sprite = new Assets.Assets.TestActivity2();
			addChild(TestActivity2);
			ActivityCollection.push(TestActivity2);
			
			TestActivity3 = new Activity("TestActivity3",31,45);
			TestActivity3.Sprite = new Assets.Assets.TestActivity3();
			addChild(TestActivity3);
			ActivityCollection.push(TestActivity3);
			
			TestActivity4 = new Activity("TestActivity4",46,60);
			TestActivity4.Sprite = new Assets.Assets.TestActivity4();
			addChild(TestActivity4);
			ActivityCollection.push(TestActivity4);
		}
		
		public function Update():void
		{
			for(var i:int = 0; i<ActivityCollection.length;i++)
			{
				if(Locator.home.clock.SecondValue >= ActivityCollection[i].StartTime &&
					Locator.home.clock.SecondValue <= ActivityCollection[i].StopTime)
				{
					ActivityCollection[i].Enabled = true;
				}
				else
				{
					ActivityCollection[i].Enabled = false;
				}
			}
		}
	}
}