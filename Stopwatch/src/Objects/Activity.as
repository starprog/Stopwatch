package Objects
{
	import ViewModel.ViewModelLocator;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Activity extends Sprite
	{
		public var Locator:ViewModelLocator=ViewModelLocator.getInstance();
				
		private var _Enabled:Boolean = false;
		
		private var _Name:String;
		private var _Description:String;
		private var _Sprite:Bitmap;
		private var _StartTime:int;
		private var _StopTime:int;
		
		public function Activity(Name:String,StartTime:int,StopTime:int)
		{
			super();
			_Name = Name;
			_StartTime = StartTime;
			_StopTime = StopTime;
			
			this.addEventListener(Event.ADDED_TO_STAGE,init)
		}
		
		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			this.visible = false;
			
			CreateSprite();
		}
		
		private function CreateSprite():void
		{
			Sprite.x = Math.ceil(-Sprite.width/2);
			Sprite.y = Math.ceil(-Sprite.height/2);
			this.addChild(Sprite);
		}
		
		public function get Name():String
		{
			return _Name;
		}

		public function set Name(value:String):void
		{
			_Name = value;
		}

		public function get Description():String
		{
			return _Description;
		}

		public function set Description(value:String):void
		{
			_Description = value;
		}

		public function get Sprite():Bitmap
		{
			return _Sprite;
		}

		public function set Sprite(value:Bitmap):void
		{
			_Sprite = value;
		}

		public function get StartTime():int
		{
			return _StartTime;
		}

		public function set StartTime(value:int):void
		{
			_StartTime = value;
		}

		public function get StopTime():int
		{
			return _StopTime;
		}

		public function set StopTime(value:int):void
		{
			_StopTime = value;
		}

		public function get Enabled():Boolean
		{
			return _Enabled;
		}

		public function set Enabled(value:Boolean):void
		{
			_Enabled = value;
			
			if(_Enabled == false)
			{
				visible = false;
			}
			else
			{
				visible = true;
			}
		}


	}
}