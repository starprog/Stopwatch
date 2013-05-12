package ViewModel {

	import Screens.Home;

	public class ViewModelLocator
	{
		
		
		// Single Instance of Our ModelLocator
		private static var instance:ViewModelLocator;
		public function ViewModelLocator(enforcer:SingletonEnforcer)
		{
			if (enforcer == null) {
				throw new Error( "VIEWMODELLOCATOR: You Can Only Have One ModelLocator" );
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
		public var DeviceHeight:int;
		public var DeviceWidth:int;
		public var FPS:int;
		
		// Screens
		public var stopWatch:Stopwatch;
		public var home:Home;
	}
}
class SingletonEnforcer{};