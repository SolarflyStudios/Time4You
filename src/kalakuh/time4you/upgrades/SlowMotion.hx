package kalakuh.time4you.upgrades;

import openfl.Assets;

/**
 * ...
 * @author Kalakuh
 */
class SlowMotion extends Upgrade
{

	public function new() 
	{
		super(Assets.getBitmapData("img/Shop/SlowmoBar.png"), Assets.getBitmapData("img/Shop/SlowmoText.png"), 35, EUpgrade.SlowMo, [5, 15, 30, 45, 60, 75, 90, 105, 120, 145]);
	}
	
}