package kalakuh.time4you.gui ;

import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Kalakuh
 */
class Screen extends Sprite
{
	private var targetAlpha : Float;
	
	public function new(a : Float) 
	{
		super();
		targetAlpha = a;
		alpha = a;
		
		addEventListener(Event.ENTER_FRAME, updateAlpha);
	}
	
	private function updateAlpha (e : Event) : Void {
		#if flash
		// Flash build seems to have problems with alpha when using Haxe
		alpha += (targetAlpha - alpha) / 20;
		#else
		alpha += (targetAlpha - alpha) / 30;
		#end
	}
	
	public function setTargetAlpha (newValue : Float) : Void {
		targetAlpha = newValue;
	}
	
	private function isVisible () : Bool {
		return alpha >= 0.9;
	}
}