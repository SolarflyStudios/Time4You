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
		super(Assets.getBitmapData("img/Shop/StaminaBar.png"), Assets.getBitmapData("img/Shop/StaminaText.png"), 47, EUpgrade.Stamina, [10, 15, 25, 40, 55, 70, 85, 105, 125, 150]);
	}
	
}