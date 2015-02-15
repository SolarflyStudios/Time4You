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
class Coin extends Sprite {
	private var coin : Bitmap;
	private var targetAlpha : Float = 1;
	
	public function new(x : Float = 0, y : Float = 0) : Void {
		super();
		this.x = x;
		this.y = y;
		
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init (e : Event) : Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		coin = new Bitmap(Assets.getBitmapData("img/In-Game/Coin.png"));
		coin.x = -coin.width / 2;
		coin.y = -coin.height / 2;
		addChild(coin);
		
		addEventListener(Event.ENTER_FRAME, updateAlpha);
	}
	
	public function newPosition () : Void {
		this.x = coin.width + (Math.random() * (stage.stageWidth - 2 * coin.width));
		this.y = coin.height + (Math.random() * (stage.stageHeight - 2 * coin.height));
	}
	
	public function getCoin () : Bitmap {
		return coin;
	}
	
	public function getHitbox () : Rectangle {
		return new Rectangle(x - width / 5 * 1.5, y - height / 5 * 1.5, width * 3 / 5, height * 3 / 5);
	}
	
	private function updateAlpha (e : Event) : Void {
		alpha += (targetAlpha - alpha) / 20;
	}
	
	public function setTargetAlpha (f : Float) : Void {
		targetAlpha = f;
	}
}