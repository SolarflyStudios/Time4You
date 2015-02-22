package kalakuh.time4you.game;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.events.MouseEvent;
import openfl.events.Event;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Kalakuh
 */

class Volume extends Sprite
{
	private static var muted : Bool = false;
	private var button : Bitmap;
	private var container : Sprite;
	private var targetAlpha : Float = 1;
	
	public function new() 
	{
		super();
		if (muted) {
			button = new Bitmap(Assets.getBitmapData("img/In-Game/SoundOff.png"));
		} else {
			button = new Bitmap(Assets.getBitmapData("img/In-Game/Sound.png"));
		}
		
		container = new Sprite();
		addChild(container);
		button.x = -button.width / 2;
		button.y = -button.height / 2;
		container.addChild(button);
		
		addEventListener(Event.ENTER_FRAME, updateAlpha);
		container.addEventListener(MouseEvent.CLICK, onClick);
	}
	
	private function onClick (e : MouseEvent) : Void {
		muted = !muted;
		if (muted) {
			button.bitmapData = Assets.getBitmapData("img/In-Game/SoundOff.png");
			Main.mute();
		} else {
			button.bitmapData = Assets.getBitmapData("img/In-Game/Sound.png");
			Main.unmute();
		}
	}
	
	private function updateAlpha (e : Event) : Void {
		alpha += (targetAlpha - alpha) / 20;
	}
	
	public static function isMuted () : Bool {
		return muted;
	}
	
	public function setTargetAlpha (f : Float) : Void {
		targetAlpha = f;
	}
	
	public function getHitbox () : Rectangle {
		return new Rectangle(x - button.width / 2, y - button.height / 2, button.width, button.height);
	}
}