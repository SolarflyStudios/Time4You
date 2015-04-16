package kalakuh.time4you.upgrades;

import openfl.Assets;

/**
 * ...
 * @author Kalakuh
 */
class SpawnRate extends Upgrade
{

	public function new() 
	{
		super(Assets.getBitmapData("img/Shop/SpawnBar.png"), Assets.getBitmapData("img/Shop/SpawnText.png"), -188, EUpgrade.Spawn, [15, 25, 35, 50, 65, 80, 100, 120, 140, 160]);
	}
	
}