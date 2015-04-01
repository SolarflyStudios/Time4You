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
		super(Assets.getBitmapData("img/Shop/SpawnBar.png"), Assets.getBitmapData("img/Shop/SpawnText.png"), -188);
	}
	
}