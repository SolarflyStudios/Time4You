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
			
		}
		this.type = type;
	}
	
	private function init (e : Event) : Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
	}
	
	public function getType () : EPowerUp {
		return type;
	}
	 
	public function update () : Void {
		
	}
	
	public function getPowerUp () : Bitmap {
		return powerup;
	}
	
	public function getHitbox () : Rectangle {
		return new Rectangle(x - width / 3, y - height / 3, width * 2 / 3, height * 2 / 3);
	}
}