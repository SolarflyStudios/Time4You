package kalakuh.time4you;

import openfl.net.SharedObject;
import kalakuh.time4you.upgrades.EUpgrade;

/**
 * ...
 * @author Kalakuh
 */
class Saving
{
	private static var saving : SharedObject;
	private static var version : String = "Beta 3.0";
	private static var coins : UInt;
	private static var slowmo : UInt;
	private static var spawnRate : UInt;
	private static var stamina : UInt;
	
	
	public function new() 
	{
		
	}
	
	public static function init () : Void {
		saving = SharedObject.getLocal("Time4You");
		if (saving.data.version == null) {
			saving.data.version = version;
			saving.data.slowmo = 0;
			saving.data.spawn = 0;
			saving.data.stamina = 0;
			saving.data.coins = 0;
			saving.flush();
		} else if (saving.data.version != version) {
			// DO STUFF
			if (saving.data.version == "Beta 2.0") {
				saving.data.slowmo = 0;
				saving.data.spawn = 0;
				saving.data.stamina = 0;
			}
			saving.data.version = version;
			saving.flush();
		}
		
		slowmo = saving.data.slowmo;
		spawnRate = saving.data.spawn;
		stamina = saving.data.stamina;
		coins = saving.data.coins;
	}
	
	public static function getCoins () : UInt {
		return coins;
	}
	
	public static function setCoins (c : UInt) {
		coins = c;
		saving.data.coins = coins;
		saving.flush();
		trace(coins + " coins");
	}
	
	public static function getUpgradeLevel (upgrade : EUpgrade) : UInt {
		switch (upgrade) {
			case EUpgrade.SlowMo:
				return slowmo;
			case EUpgrade.Spawn:
				return spawnRate;
			case EUpgrade.Stamina:
				return stamina;
		}
	}
	
	public static function setUpgradeLevel (upgrade : EUpgrade, level : UInt) : Void {
		switch (upgrade) {
			case EUpgrade.SlowMo:
				slowmo = level;
				saving.data.slowmo = level;
			case EUpgrade.Spawn:
				spawnRate = level;
				saving.data.spawn = level;
			case EUpgrade.Stamina:
				stamina = level;
				saving.data.stamina = level;
		}
		saving.flush();
	}
}