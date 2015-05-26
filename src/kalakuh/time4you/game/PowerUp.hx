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
	private var targetAlpha : Float = 1;
	private var isCollected : Bool = false;
	
	public function new(type : EPowerUp)
	{
		super();
		switch (type) {
			case EPowerUp.Shrink:
				powerup = new Bitmap(Assets.getBitmapData("img/In-Game/SizePU.png"));
			case EPowerUp.Invincibility:
				powerup = new Bitmap(Assets.getBitmapData("img/In-Game/InviPU.png"));
			case EPowerUp.Double:
				powerup = new Bitmap(Assets.getBitmapData("img/In-Game/x2PU.png"));
			default:
				trace(type + " not recognized");
				powerup = new Bitmap(Assets.getBitmapData("img/In-Game/SizePU.png"));
		}
		this.type = type;
		addChild(powerup);
		alpha = 0;
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init (e : Event) : Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		powerup.x = -powerup.width / 2;
		powerup.y = -powerup.height / 2;
		this.x = powerup.width * 3 + (Math.random() * (stage.stageWidth - 6 * powerup.width));
		this.y = powerup.height * 3 + (Math.random() * (stage.stageHeight - 6 * powerup.height));
		
		addEventListener(Event.ENTER_FRAME, updateAlpha);
	}
	
	private function updateAlpha (e : Event) : Void {
		alpha += (targetAlpha - alpha) / 20;
	}
	
	public function setTargetAlpha (f : Float) : Void {
		targetAlpha = f;
	}
	
	public function getCollected () : Bool {
		return isCollected;
	}
	
	public function setCollected (b : Bool) : Void {
		isCollected = b;
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