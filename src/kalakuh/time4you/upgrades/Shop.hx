package kalakuh.time4you.upgrades;

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
class Shop extends Screen
{
	private var background : Bitmap;
	private var slowmo : SlowMotion;
	private var spawnRate : SpawnRate;
	private var stamina : Stamina;
	
	public function new() 
	{
		super(0);
		
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init (e : Event) : Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		background = new Bitmap(Assets.getBitmapData("img/Shop/upgradesBG.png"));
		addChild(background);
		
		slowmo = new SlowMotion();
		addChild(slowmo);
		slowmo.y = 70;
		
		stamina = new Stamina();
		addChild(stamina);
		stamina.y = 190;
		
		spawnRate = new SpawnRate();
		addChild(spawnRate);
		spawnRate.y = 310;
		
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
		trace(mouseX, mouseY);
	}
	
	override public function onDestroy () {
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		//removeEventListener(MouseEvent.CLICK, onClick);
		
		removeChild(background);
		background = null;
	}
}