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
		super(Assets.getBitmapData("img/Shop/SlowmoBar.png"), Assets.getBitmapData("img/Shop/SlowmoText.png"), 35);
	}
	
}