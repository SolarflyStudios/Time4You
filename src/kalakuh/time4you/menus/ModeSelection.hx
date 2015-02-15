package kalakuh.time4you.menus ;

import kalakuh.time4you.Main;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.ui.Keyboard;
import kalakuh.time4you.gui.*;
import kalakuh.time4you.game.EGameMode;
import openfl.filters.GlowFilter;

/**
 * ...
 * @author Kalakuh
 */
class ModeSelection extends Screen
{
	private var classic : Bitmap;
	private var rush : Bitmap;
	
	private var buttonContainer : Sprite;
	
	private var background : Bitmap;
	
	private var selectionIndex : Int = 0;
	
	public function new() 
	{
		super(0);
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init (e : Event) {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		background = new Bitmap(Assets.getBitmapData("img/Game Mode/GameModeBackground.png"));
		
		buttonContainer = new Sprite();
		
		classic = new Bitmap(Assets.getBitmapData("img/Game Mode/ClassicModeButtonHover.png"));
		rush = new Bitmap(Assets.getBitmapData("img/Game Mode/RushModeButton.png"));
		
		addChild(background);
		
		addChild(buttonContainer);
		
		buttonContainer.addChild(classic);
		buttonContainer.addChild(rush);
		buttonContainer.x = stage.stageWidth / 2;
		buttonContainer.y = stage.stageHeight / 2 + 20;
		
		center(classic);
		center(rush);
		
		classic.x -= 150;
		rush.x += 150;
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
	}
	
	private function onKeyDown (e : KeyboardEvent) {
		if (super.isVisible()) {
			if (e.keyCode == Keyboard.SPACE || e.keyCode == Keyboard.ENTER) {
				var main : Main = cast parent;
				super.setTargetAlpha(0);
				if (selectionIndex == 0) {
					main.startGame(EGameMode.Classic);
				} else {
					main.startGame(EGameMode.Rush);
				}
			} else {
				if (e.keyCode == Keyboard.A || e.keyCode == Keyboard.LEFT) {
					selectionIndex--;
					if (selectionIndex < 0) selectionIndex = 1;
				} else if (e.keyCode == Keyboard.D || e.keyCode == Keyboard.RIGHT) {
					selectionIndex++;
					if (selectionIndex > 1) selectionIndex = 0;
				}
				
				switch (selectionIndex) 
				{
					case 0:
						classic.bitmapData = Assets.getBitmapData("img/Game Mode/ClassicModeButtonHover.png");
						rush.bitmapData = Assets.getBitmapData("img/Game Mode/RushModeButton.png");
					case 1:
						classic.bitmapData = Assets.getBitmapData("img/Game Mode/ClassicModeButton.png");
						rush.bitmapData = Assets.getBitmapData("img/Game Mode/RushModeButtonHover.png");
					default:
				}
			}
		}
	}
	
	private function center (bmp : Bitmap) {
		bmp.x = -bmp.width / 2;
		bmp.y = -bmp.height / 2;
	}
}