package kalakuh.time4you;

import openfl.net.SharedObject;

/**
 * ...
 * @author Kalakuh
 */
class Saving
{
	private static var saving : SharedObject;
	private static var version : String = "Beta 2.0";
	private static var coins : UInt;
	
	public function new() 
	{
		
	}
	
	public static function init () : Void {
		saving = SharedObject.getLocal("Time4You");
		if (saving.data.version == null) {
			saving.data.version = version;
			saving.data.coins = 0;
			saving.flush();
		} else if (saving.data.version != version) {
			// DO STUFF
			
			saving.flush();
		}
		
		coins = saving.data.coins;
	}
	
	public static function getCoins () : UInt {
		return coins;
	}
	
	public static function setCoins (c : UInt) {
		coins = c;
		saving.data.coins = coins;
		saving.flush();
	}
}