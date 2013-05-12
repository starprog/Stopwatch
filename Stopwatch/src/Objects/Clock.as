package Objects
{
	import Assets.*;
	
	import Objects.Clock_BTN;
	import Objects.SecondHand;
	
	import ViewModel.ViewModelLocator;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Clock extends Sprite
	{
		public var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		private var _IsTicking:Boolean = false;
		private var _Loop:Boolean = false;
		private var _SecondValue:int = 0;
		
		private var Sprite:Bitmap;
		
		public var secondHand:SecondHand;
		public var clock_BTN:Clock_BTN;
		
		//counter
		private var _FrameCount:int = 0;
		
		public function Clock()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE,init)
		}
		
		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			
			CreateObjects();
			
			CreateEventHandlers();
			
			trace("CLOCK: Initialized");
		}
		
		private function CreateObjects():void
		{
			CreateSprite();
			
			secondHand = new SecondHand();
			this.addChild(secondHand);
			
			clock_BTN = new Clock_BTN();
			clock_BTN.y = y-height/2;
			clock_BTN.x = x;
			this.addChild(clock_BTN);
			

		}
		
		private function CreateEventHandlers():void
		{
			this.addEventListener(Event.ENTER_FRAME,Update);
		}
		
		protected function Update(event:Event):void
		{
			Tick();
			
			secondHand.Update();
			Locator.home.timeline.Update();
		}
		
		private function Tick():void
		{			
			if (IsTicking == true)
			{
				_FrameCount+=1;
				
				if(_FrameCount%Locator.FPS == 0)
				{
					SecondValue+=1;
				}
			}
		}
		
		private function CreateSprite():void
		{
			Sprite = new Assets.Assets.Clock();
			Sprite.x = Math.ceil(-Sprite.width/2);
			Sprite.y = Math.ceil(-Sprite.height/2);
			this.addChild(Sprite);
		}
		
		public function get SecondValue():int
		{
			return _SecondValue;
		}
		
		public function ResetTime():void
		{
			_SecondValue = 0;
			
			if(Loop == false)
			{
				clock_BTN.Stop();
			}

			trace("CLOCK: Reset");
		}
		
		public function set SecondValue(value:int):void
		{			
			//Ensures that the second value never goes past 60
			if(_SecondValue >= 60)
			{
				ResetTime();
			}
			else
			{
				_SecondValue = value;
			}
			
			trace("CLOCK: SecondValue = "+_SecondValue);
		}

		public function get IsTicking():Boolean
		{
			return _IsTicking;
		}

		public function set IsTicking(value:Boolean):void
		{
			_IsTicking = value;
		}

		public function get Loop():Boolean
		{
			return _Loop;
		}

		public function set Loop(value:Boolean):void
		{
			_Loop = value;
		}


	}
}