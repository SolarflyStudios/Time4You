package kalakuh.time4you.upgrades;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.Event;

/**
 * ...
 * @author Kalakuh
 */
class Upgrade extends Sprite
{
	private var bar : Bitmap;
	private var text : Bitmap;
	
	public function new(bar : BitmapData, text : BitmapData, textY : Float) 
	{
		super();
		
		this.bar = new Bitmap(bar);
		this.text = new Bitmap(text);
		this.text.y = textY;
		
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init (e : Event) : Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		text.x = stage.stageWidth / 2 + 20;
		
		addChild(bar);
		addChild(text);
	}
}