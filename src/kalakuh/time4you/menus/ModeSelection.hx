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
import openfl.events.MouseEvent;

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
	
	private static var selectionIndex : Int = 0;
	
	public function new() 
	{
		super(0);
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init (e : Event) {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		background = new Bitmap(Assets.getBitmapData("img/Game Mode/GameModeBackground.png"));
		
		buttonContainer = new Sprite();
		
		if (selectionIndex == 0) {
			classic = new Bitmap(Assets.getBitmapData("img/Game Mode/ClassicModeButtonHover.png"));
			rush = new Bitmap(Assets.getBitmapData("img/Game Mode/RushModeButton.png"));
			classic.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
		} else {
			classic = new Bitmap(Assets.getBitmapData("img/Game Mode/ClassicModeButton.png"));
			rush = new Bitmap(Assets.getBitmapData("img/Game Mode/RushModeButtonHover.png"));
			rush.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
		}
		
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
		addEventListener(MouseEvent.CLICK, onClick);
		addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
	}
	
	private function onClick (e : MouseEvent) : Void {
		// check if mouse is in radius
		if (Math.sqrt((mouseX - 170) * (mouseX - 170) + (mouseY - 260) * (mouseY - 260)) <= 140 || Math.sqrt((mouseX - 470) * (mouseX - 470) + (mouseY - 260) * (mouseY - 260)) <= 140) {
			var main : Main = cast parent;
			super.setTargetAlpha(0);
			if (selectionIndex == 0) {
				main.startGame(EGameMode.Classic);
			} else {
				main.startGame(EGameMode.Rush);
			}
			super.setToBeDestroyed();
		}
	}
	
	private function onMouseMove (e : MouseEvent) : Void {
		var index : Int = selectionIndex;
		
		if (Math.sqrt((mouseX - 170) * (mouseX - 170) + (mouseY - 260) * (mouseY - 260)) <= 140) {
			selectionIndex = 0;
		}
		
		if (Math.sqrt((mouseX - 470) * (mouseX - 470) + (mouseY - 260) * (mouseY - 260)) <= 140) {
			selectionIndex = 1;
		}
		
		if (index != selectionIndex) {
			switch (selectionIndex) {
				case 0:
					classic.bitmapData = Assets.getBitmapData("img/Game Mode/ClassicModeButtonHover.png");
					classic.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
					rush.bitmapData = Assets.getBitmapData("img/Game Mode/RushModeButton.png");
					rush.filters = [];
				case 1:
					classic.bitmapData = Assets.getBitmapData("img/Game Mode/ClassicModeButton.png");
					classic.filters = [];
					rush.bitmapData = Assets.getBitmapData("img/Game Mode/RushModeButtonHover.png");
					rush.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
				default:
			}
		}
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
				super.setToBeDestroyed();
			} else {
				if (e.keyCode == Keyboard.A || e.keyCode == Keyboard.LEFT) {
					selectionIndex--;
					if (selectionIndex < 0) selectionIndex = 1;
				} else if (e.keyCode == Keyboard.D || e.keyCode == Keyboard.RIGHT) {
					selectionIndex++;
					if (selectionIndex > 1) selectionIndex = 0;
				}
				
				switch (selectionIndex) {
					case 0:
						classic.bitmapData = Assets.getBitmapData("img/Game Mode/ClassicModeButtonHover.png");
						classic.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
						rush.bitmapData = Assets.getBitmapData("img/Game Mode/RushModeButton.png");
						rush.filters = [];
					case 1:
						classic.bitmapData = Assets.getBitmapData("img/Game Mode/ClassicModeButton.png");
						classic.filters = [];
						rush.bitmapData = Assets.getBitmapData("img/Game Mode/RushModeButtonHover.png");
						rush.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
					default:
				}
			}
		}
	}
	
	private function center (bmp : Bitmap) {
		bmp.x = -bmp.width / 2;
		bmp.y = -bmp.height / 2;
	}
	
	override public function onDestroy () : Void {
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		removeEventListener(MouseEvent.CLICK, onClick);
		removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		
		buttonContainer.removeChild(classic);
		buttonContainer.removeChild(rush);
		removeChild(buttonContainer);
		buttonContainer = null;
		classic = null;
		rush = null;
		
		removeChild(background);
		background = null;
	}
}