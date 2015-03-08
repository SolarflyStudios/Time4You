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
class ModeSelection extends Screen {
	private var button : Bitmap;
	private var left : Bitmap;
	private var right : Bitmap;
	
	private var buttonContainer : Sprite;
	
	private var background : Bitmap;
	
	private static var selectionIndex : Int = 0;
	private static inline var BUTTON_COUNT : Int = 3;
	
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
			button = new Bitmap(Assets.getBitmapData("img/Game Mode/ClassicModeButtonHover.png"));
		} else if (selectionIndex == 1) {
			button = new Bitmap(Assets.getBitmapData("img/Game Mode/RushModeButtonHover.png"));
		} else if (selectionIndex == 2) {
			button = new Bitmap(Assets.getBitmapData("img/Game Mode/StormHover.png"));
		}
		button.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
		
		addChild(background);
		center(button);
		button.x += stage.stageWidth / 2;
		button.y += stage.stageHeight / 2 + 20;
		addChild(button);
		
		left = new Bitmap(Assets.getBitmapData("img/Game Mode/Left.png"));
		right = new Bitmap(Assets.getBitmapData("img/Game Mode/Right.png"));
		center(left);
		center(right);
		addChild(left);
		addChild(right);
		left.y += stage.stageHeight / 2 + 20;
		right.y += stage.stageHeight / 2 + 20;
		left.x += 105;
		right.x += stage.stageWidth - 105;
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		addEventListener(MouseEvent.CLICK, onClick);
		addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
	}
	
	private function onClick (e : MouseEvent) : Void {
		var index : Int = selectionIndex;
		if (mouseX >= 55 && mouseX <= 150 && mouseY >= 231 && mouseY <= 289) {
			selectionIndex--;
			if (selectionIndex < 0) selectionIndex = BUTTON_COUNT - 1;
		}
		if (mouseX >= 485 && mouseX <= 580 && mouseY >= 231 && mouseY <= 289) {
			selectionIndex++;
			if (selectionIndex > BUTTON_COUNT - 1) selectionIndex = 0;
		}
		
		if (index != selectionIndex) {
			switch (selectionIndex) {
				case 0:
					button.bitmapData = Assets.getBitmapData("img/Game Mode/ClassicModeButtonHover.png");
				case 1:
					button.bitmapData = Assets.getBitmapData("img/Game Mode/RushModeButtonHover.png");
				case 2:
					button.bitmapData = Assets.getBitmapData("img/Game Mode/StormHover.png");
				default:
			}
			center(button);
			button.x += stage.stageWidth / 2;
			button.y += stage.stageHeight / 2 + 20;
		}
		
		// check if mouse is in radius
		if (checkDistance(button)) {
			var main : Main = cast parent;
			super.setTargetAlpha(0);
			if (selectionIndex == 0) {
				main.startGame(EGameMode.Classic);
			} else if (selectionIndex == 1) {
				main.startGame(EGameMode.Rush);
			} else if (selectionIndex == 2) {
				main.startGame(EGameMode.Storm);
			}
			super.setToBeDestroyed();
		}
	}
	
	private function onMouseMove (e : MouseEvent) : Void {
		
	}
	
	private function onKeyDown (e : KeyboardEvent) {
		if (super.isVisible()) {
			if (e.keyCode == Keyboard.SPACE || e.keyCode == Keyboard.ENTER) {
				
				var main : Main = cast parent;
				super.setTargetAlpha(0);
				
				if (selectionIndex == 0) {
					main.startGame(EGameMode.Classic);
				} else if (selectionIndex == 1) {
					main.startGame(EGameMode.Rush);
				} else if (selectionIndex == 2) {
					main.startGame(EGameMode.Storm);
				}
				
				super.setToBeDestroyed();
			} else {
				if (e.keyCode == Keyboard.A || e.keyCode == Keyboard.LEFT) {
					selectionIndex--;
					if (selectionIndex < 0) selectionIndex = 2;
				} else if (e.keyCode == Keyboard.D || e.keyCode == Keyboard.RIGHT) {
					selectionIndex++;
					if (selectionIndex > 2) selectionIndex = 0;
				}
				
				switch (selectionIndex) {
					case 0:
						button.bitmapData = Assets.getBitmapData("img/Game Mode/ClassicModeButtonHover.png");
					case 1:
						button.bitmapData = Assets.getBitmapData("img/Game Mode/RushModeButtonHover.png");
					case 2:
						button.bitmapData = Assets.getBitmapData("img/Game Mode/StormHover.png");
					default:
				}
				center(button);
				button.x += stage.stageWidth / 2;
				button.y += stage.stageHeight / 2 + 20;
			}
		}
	}
	
	private function center (bmp : Bitmap) {
		bmp.x = -bmp.width / 2;
		bmp.y = -bmp.height / 2;
	}
	
	private function checkDistance (bitmap : Bitmap) : Bool {
		return Math.sqrt(Math.pow(mouseX - bitmap.x - bitmap.width / 2 - buttonContainer.x, 2) + Math.pow(mouseY - (stage.stageHeight / 2 + 20), 2)) <= 140;
	}
	
	override public function onDestroy () : Void {
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		removeEventListener(MouseEvent.CLICK, onClick);
		removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		
		removeChild(button);
		button = null;
		
		removeChild(background);
		background = null;
	}
}