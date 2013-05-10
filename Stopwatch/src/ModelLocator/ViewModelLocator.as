package ViewModel {
	import objects.Background.GameBackground;
	import objects.Player.Serial;
	
	import screens.InGame;
	import screens.Start;
	
	import starling.display.Sprite;
	import managers.PoolManager;
	
	public class ViewModelLocator
	{
		// Single Instance of Our ModelLocator
		private static var instance:ViewModelLocator;
		public function ViewModelLocator(enforcer:SingletonEnforcer)
		{
			if (enforcer == null) {
				throw new Error( "You Can Only Have One ModelLocator" );
			}
			
		}
		// Returns the Single Instance
		public static function getInstance() : ViewModelLocator {
			if (instance == null) {
				instance = new ViewModelLocator( new SingletonEnforcer );
			}
			return instance;
		}
		//DEFINE VARIABLES 
		public var inGame:InGame;
		public var startScreen:Start;
		public var activePlayerSerial:Serial;
		public var gameObjects:Array = new Array();
		public var gameBackground:GameBackground;
		public var objectHolder:Sprite;
		
		// DEFINE VIEW CONSTANTS
		
		//Specialized functions for the the model locator.
		
	}
}
class SingletonEnforcer{};