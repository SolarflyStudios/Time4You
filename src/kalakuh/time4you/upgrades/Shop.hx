package kalakuh.time4you.upgrades;

import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.ui.Keyboard;
import kalakuh.time4you.gui.*;
import openfl.events.MouseEvent;
import openfl.text.*;

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
	private var coinText : TextField;
	private var font : Font;
	
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
		
		// such copy-paste from Upgrade.hx...
		font = Assets.getFont("font/Nebula.ttf");
		coinText = new TextField();
		coinText.x = stage.stageWidth / 2 - 100;
		coinText.y = stage.stageHeight - 35; // magic numbers duh...
		coinText.width = 200;
		coinText.height = 50;
		coinText.antiAliasType = AntiAliasType.ADVANCED;
		coinText.embedFonts = true;
		var format : TextFormat = new TextFormat(font.fontName, 40, 0x000000, false, false, false, null, null, TextFormatAlign.CENTER);
		coinText.defaultTextFormat = format;
		coinText.text = "" + Saving.getCoins();
		coinText.selectable = false;
		
		addChild(coinText);
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
		if (mouseX >= 36 && mouseX <= 179 && mouseY >= 80 && mouseY <= 180
			|| mouseX >= 8 && mouseX <= 636 && mouseY >= 100 && mouseY <= 160) slowmo.purchase();
			
		if (mouseX >= 36 && mouseX <= 179 && mouseY >= 200 && mouseY <= 300
			|| mouseX >= 8 && mouseX <= 636 && mouseY >= 220 && mouseY <= 280) stamina.purchase();
			
		if (mouseX >= 36 && mouseX <= 179 && mouseY >= 320 && mouseY <= 420
			|| mouseX >= 8 && mouseX <= 636 && mouseY >= 340 && mouseY <= 398) spawnRate.purchase();
			
		// update the coin displayer
		coinText.text = "" + Saving.getCoins();
	}
	
	override public function onDestroy () {
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		removeEventListener(MouseEvent.CLICK, onClick);
		
		removeChild(background);
		background = null;
		
		removeChild(coinText);
		coinText = null;
	}
}