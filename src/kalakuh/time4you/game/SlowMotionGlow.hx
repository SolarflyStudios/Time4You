package kalakuh.time4you.game;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.Event;

/**
 * ...
 * @author Kalakuh
 */
class SlowMotionGlow extends Sprite
{
	private var glow : Bitmap;
	private var targetAlpha : Float = 0;
	
	public function new() 
	{
		super();
		
		glow = new Bitmap(Assets.getBitmapData("img/In-Game/SlowMotionBlur.png"));
		addChild(glow);
		alpha = 0;
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function update (e : Event) : Void {
		alpha += (targetAlpha - alpha) / 20;
	}
	
	public function setTargetAlpha (f : Float) : Void {
		targetAlpha = f;
	}
}