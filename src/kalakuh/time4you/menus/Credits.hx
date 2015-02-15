package kalakuh.time4you.menus ;

import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.ui.Keyboard;
import kalakuh.time4you.gui.*;

/**
 * ...
 * @author Kalakuh
 */
class Credits extends Screen
{
	private var creds : Bitmap;
	
	public function new() 
	{
		super(0);
		
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init (e : Event) : Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		creds = new Bitmap(Assets.getBitmapData("img/Menu/CreditsScreen.png"));
		addChild(creds);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
	}
	
	private function onKeyDown (e : KeyboardEvent) {
		if (super.isVisible()) {
			if (e.keyCode == Keyboard.SPACE || e.keyCode == Keyboard.ENTER) {
				var main : Main = cast parent;
				super.setTargetAlpha(0);
				main.openMenu(EScreen.S_MainMenu);
			}
		}
	}
}