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
	private var storm : Bitmap;
	
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
			classic = new Bitmap(Assets.getBitmapData("img/Game Mode/ClassicModeButtonHover.png"));
			classic.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
			rush = new Bitmap(Assets.getBitmapData("img/Game Mode/RushModeButton.png"));
			storm = new Bitmap(Assets.getBitmapData("img/Game Mode/Storm.png"));
		} else if (selectionIndex == 1) {
			classic = new Bitmap(Assets.getBitmapData("img/Game Mode/ClassicModeButton.png"));
			rush = new Bitmap(Assets.getBitmapData("img/Game Mode/RushModeButtonHover.png"));
			rush.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
			storm = new Bitmap(Assets.getBitmapData("img/Game Mode/Storm.png"));
		} else if (selectionIndex == 2) {
			classic = new Bitmap(Assets.getBitmapData("img/Game Mode/ClassicModeButton.png"));
			rush = new Bitmap(Assets.getBitmapData("img/Game Mode/RushModeButton.png"));
			storm = new Bitmap(Assets.getBitmapData("img/Game Mode/StormHover.png"));
			storm.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
		}
		
		addChild(background);
		
		addChild(buttonContainer);
		
		buttonContainer.addChild(classic);
		buttonContainer.addChild(rush);
		buttonContainer.addChild(storm);
		buttonContainer.x = 0;
		buttonContainer.y = stage.stageHeight / 2 + 20;
		
		center(classic);
		center(rush);
		center(storm);
		
		classic.x += stage.stageWidth / 4 * 1;
		rush.x += stage.stageWidth / 4 * 3;
		storm.x += stage.stageWidth / 4 * 5;
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		addEventListener(MouseEvent.CLICK, onClick);
		addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		addEventListener(Event.ENTER_FRAME, scrollUpdate);
	}
	
	private function scrollUpdate (e : Event) : Void {
		if (super.isVisible()) {
			if (mouseX < 50) {
				buttonContainer.x = Math.min(0, buttonContainer.x + (10 / Math.max(mouseX, 1)));
			} else if (mouseX > stage.stageWidth - 50) {
				buttonContainer.x = Math.max(stage.stageWidth / 2 * -(BUTTON_COUNT - 2), buttonContainer.x - (10 / Math.max(stage.stageWidth - mouseX, 1)));
			}
		}
	}
	
	private function onClick (e : MouseEvent) : Void {
		// check if mouse is in radius		
		if (checkDistance(classic) || checkDistance(rush) || checkDistance(storm)) {
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
		var index : Int = selectionIndex;
		
		if (checkDistance(classic)) {
			selectionIndex = 0;
		}
		
		if (checkDistance(rush)) {
			selectionIndex = 1;
		}
		
		if (checkDistance(storm)) {
			selectionIndex = 2;
		}
		
		if (index != selectionIndex) {
			switch (selectionIndex) {
				case 0:
					classic.bitmapData = Assets.getBitmapData("img/Game Mode/ClassicModeButtonHover.png");
					classic.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
					rush.bitmapData = Assets.getBitmapData("img/Game Mode/RushModeButton.png");
					rush.filters = [];
					storm.bitmapData = Assets.getBitmapData("img/Game Mode/Storm.png");
					storm.filters = [];
				case 1:
					classic.bitmapData = Assets.getBitmapData("img/Game Mode/ClassicModeButton.png");
					classic.filters = [];
					rush.bitmapData = Assets.getBitmapData("img/Game Mode/RushModeButtonHover.png");
					rush.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
					storm.bitmapData = Assets.getBitmapData("img/Game Mode/Storm.png");
					storm.filters = [];
				case 2:
					classic.bitmapData = Assets.getBitmapData("img/Game Mode/ClassicModeButton.png");
					classic.filters = [];
					rush.bitmapData = Assets.getBitmapData("img/Game Mode/RushModeButtonHover.png");
					rush.filters = [];
					storm.bitmapData = Assets.getBitmapData("img/Game Mode/StormHover.png");
					storm.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
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
						classic.bitmapData = Assets.getBitmapData("img/Game Mode/ClassicModeButtonHover.png");
						classic.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
						rush.bitmapData = Assets.getBitmapData("img/Game Mode/RushModeButton.png");
						rush.filters = [];
						storm.bitmapData = Assets.getBitmapData("img/Game Mode/Storm.png");
						storm.filters = [];
					case 1:
						classic.bitmapData = Assets.getBitmapData("img/Game Mode/ClassicModeButton.png");
						classic.filters = [];
						rush.bitmapData = Assets.getBitmapData("img/Game Mode/RushModeButtonHover.png");
						rush.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
						storm.bitmapData = Assets.getBitmapData("img/Game Mode/Storm.png");
						storm.filters = [];
					case 2:
						classic.bitmapData = Assets.getBitmapData("img/Game Mode/ClassicModeButton.png");
						classic.filters = [];
						rush.bitmapData = Assets.getBitmapData("img/Game Mode/RushModeButtonHover.png");
						rush.filters = [];
						storm.bitmapData = Assets.getBitmapData("img/Game Mode/StormHover.png");
						storm.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
					default:
				}
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
		removeEventListener(Event.ENTER_FRAME, scrollUpdate);
		
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