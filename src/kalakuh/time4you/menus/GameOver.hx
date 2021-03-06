package kalakuh.time4you.menus ;

import kalakuh.time4you.game.Counter;
import kalakuh.time4you.game.EGameMode;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.ui.Keyboard;
import kalakuh.time4you.gui.*;
import openfl.filters.GlowFilter;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Kalakuh
 */
class GameOver extends Screen
{
	private var bg : Bitmap;
	private var counter : Counter;
	private var backToMenu : Bitmap;
	private var retry : Bitmap;
	
	private static var selectionIndex : Int = 0;
	
	public function new() 
	{
		super(0);
		
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init (e : Event) : Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		bg = new Bitmap(Assets.getBitmapData("img/Menu/GameOverBG.png"));
		addChild(bg);
		
		counter = new Counter();
		addChild(counter);
		counter.y = 175;
		
		retry = new Bitmap(Assets.getBitmapData("img/Game Over/Retry.png"));
		retry.filters = selectionIndex == 0 ? [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)] : [];
		addChild(retry);
		retry.y = 350 - (retry.height / 2);
		retry.x = (stage.stageWidth / 2) - (retry.width / 2);
		
		backToMenu = new Bitmap(Assets.getBitmapData("img/Game Over/MainMenu.png"));
		backToMenu.filters = selectionIndex == 1 ? [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)] : [];
		addChild(backToMenu);
		backToMenu.y = 440 - (backToMenu.height / 2);
		backToMenu.x = (stage.stageWidth / 2) - (backToMenu.width / 2);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		addEventListener(MouseEvent.CLICK, onClick);
		addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
	}
	
	private function onClick (e : MouseEvent) : Void {
		if ((mouseX >= 121 && mouseX <= 518 && mouseY >= 303 && mouseY <= 395) || (mouseX >= 27 && mouseX <= 616 && mouseY >= 420 && mouseY <= 462)) {
			var main : Main = cast parent;
			super.setTargetAlpha(0);
			if (selectionIndex == 0) {
				main.restart();
			} else {
				main.openMenu(EScreen.S_MainMenu);
			}
			super.setToBeDestroyed();
		}
	}
	
	private function onMouseMove (e : MouseEvent) : Void {
		var index : Int = selectionIndex;
		
		if (mouseX >= 121 && mouseX <= 518 && mouseY >= 303 && mouseY <= 395) {
			selectionIndex = 0;
		}
		
		if (mouseX >= 27 && mouseX <= 616 && mouseY >= 420 && mouseY <= 462) {
			selectionIndex = 1;
		}
		
		if (index != selectionIndex) {
			switch (selectionIndex) {
				case 0:
					retry.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
					backToMenu.filters = [];
				case 1:
					retry.filters = [];
					backToMenu.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
				default:
			}
		}
	}
	
	public function setScore (f : Float, gamemode : EGameMode) : Void {
		counter.reset();
		counter.setValue(f);
		#if flash
			Main.getAPI().submitScore(Std.int(f), gamemode);
		#end
	}
	
	private function onKeyDown (e : KeyboardEvent) {
		if (super.isVisible()) {
			if (e.keyCode == Keyboard.SPACE || e.keyCode == Keyboard.ENTER) {
				var main : Main = cast parent;
				super.setTargetAlpha(0);
				if (selectionIndex == 0) {
					main.restart();
				} else {
					main.openMenu(EScreen.S_MainMenu);
				}
				super.setToBeDestroyed();
			} else {
				if (e.keyCode == Keyboard.W || e.keyCode == Keyboard.UP) {
					selectionIndex--;
					if (selectionIndex < 0) selectionIndex = 1;
				} else if (e.keyCode == Keyboard.S || e.keyCode == Keyboard.DOWN) {
					selectionIndex++;
					if (selectionIndex > 1) selectionIndex = 0;
				}
				
				switch (selectionIndex) 
				{
					case 0:
						retry.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
						backToMenu.filters = [];
					case 1:
						retry.filters = [];
						backToMenu.filters = [new GlowFilter(0xFFFFFF, 1, 8, 8, 3, 2)];
					default:
				}
			}
		}
	}
	
	override public function onDestroy () : Void {
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		removeEventListener(MouseEvent.CLICK, onClick);
		removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		
		removeChild(bg);
		bg = null;
		removeChild(counter);
		counter = null;
		removeChild(backToMenu);
		backToMenu = null;
		removeChild(retry);
		retry = null;
	}
}