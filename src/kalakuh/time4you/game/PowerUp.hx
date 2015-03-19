package kalakuh.time4you.game;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.Event;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Kalakuh
 */
class PowerUp extends Sprite
{
	private var powerup : Bitmap;
	private var type : EPowerUp;
	
	public function new(type : EPowerUp)
	{
		super();
		switch (type) {
			case EPowerUp.Shrink:
				powerup = new Bitmap(Assets.getBitmapData("img/In-Game/SizePU.png"));
			default:
				powerup = new Bitmap(Assets.getBitmapData("img/In-Game/SizePU.png"));
		}
		this.type = type;
		addChild(powerup);
		
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init (e : Event) : Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		powerup.x = -powerup.width / 2;
		powerup.y = -powerup.height / 2;
		this.x = powerup.width * 3 + (Math.random() * (stage.stageWidth - 6 * powerup.width));
		this.y = powerup.height * 3 + (Math.random() * (stage.stageHeight - 6 * powerup.height));
	}
	
	public function getType () : EPowerUp {
		return type;
	}
	
	public function getPowerUp () : Bitmap {
		return powerup;
	}
	
	public function getHitbox () : Rectangle {
		return new Rectangle(x - width / 3.0, y - height / 3.0, width * 2.0 / 3.0, height * 2.0 / 3.0);
	}
}