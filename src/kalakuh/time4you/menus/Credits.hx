package kalakuh.time4you.menus ;

import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.ui.Keyboard;
import kalakuh.time4you.gui.*;
import openfl.events.MouseEvent;

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
		addEventListener(MouseEvent.CLICK, onClick);
	}
	
	private function onKeyDown (e : KeyboardEvent) {
		if (super.isVisible()) {
			if (e.keyCode == Keyboard.SPACE || e.keyCode == Keyboard.ENTER) {
				var main : Main = cast parent;
				super.setTargetAlpha(0);
				main.openMenu(EScreen.S_MainMenu);
				super.setToBeDestroyed();
			}
		}
	}
	
	private function onClick (e : MouseEvent) : Void {
		var main : Main = cast parent;
		super.setTargetAlpha(0);
		main.openMenu(EScreen.S_MainMenu);
		super.setToBeDestroyed();
	}
	
	override public function onDestroy () {
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		removeEventListener(MouseEvent.CLICK, onClick);
		
		removeChild(creds);
		creds = null;
	}
}