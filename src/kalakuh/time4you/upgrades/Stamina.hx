package kalakuh.time4you.upgrades;

import openfl.Assets;

/**
 * ...
 * @author Kalakuh
 */
class Stamina extends Upgrade
{

	public function new() 
	{
		super(Assets.getBitmapData("img/Shop/StaminaBar.png"), Assets.getBitmapData("img/Shop/StaminaText.png"), 47);
	}
	
}