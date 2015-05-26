package kalakuh.time4you.menus;

import kalakuh.time4you.Main;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.geom.Point;
import openfl.ui.Keyboard;
import kalakuh.time4you.gui.*;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Kalakuh
 */
class MainMenu extends Screen
{
	private var credits : Bitmap;
	private var help : Bitmap;
	private var play : Bitmap;
	private var shop : Bitmap;
	private var buttonContainer : Sprite;
	
	private var background : Bitmap;
	
	private static var selectionIndex : Int = 0;
	
	public function new() 
	{
		super(1);
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init (e : Event) {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		background = new Bitmap(Assets.getBitmapData("img/Menu/MenuBackground.png"));
		
		// TODO: function for this
		switch (selectionIndex) {
			case 0:
				play = new Bitmap(Assets.getBitmapData("img/Menu/PlayButtonHover.png"));
				help = new Bitmap(Assets.getBitmapData("img/Menu/HelpButton.png"));
				credits = new Bitmap(Assets.getBitmapData("img/Menu/CreditsButton.png"));
				shop = new Bitmap(Assets.getBitmapData("img/Menu/ShopButton.png"));
			case 1:
				play = new Bitmap(Assets.getBitmapData("img/Menu/PlayButton.png"));
				help = new Bitmap(Assets.getBitmapData("img/Menu/HelpButtonHover.png"));
				credits = new Bitmap(Assets.getBitmapData("img/Menu/CreditsButton.png"));
				shop = new Bitmap(Assets.getBitmapData("img/Menu/ShopButton.png"));
			case 2:
				play = new Bitmap(Assets.getBitmapData("img/Menu/PlayButton.png"));
				help = new Bitmap(Assets.getBitmapData("img/Menu/HelpButton.png"));
				credits = new Bitmap(Assets.getBitmapData("img/Menu/CreditsButtonHover.png"));
				shop = new Bitmap(Assets.getBitmapData("img/Menu/ShopButton.png"));
			case 3:
				play = new Bitmap(Assets.getBitmapData("img/Menu/PlayButton.png"));
				help = new Bitmap(Assets.getBitmapData("img/Menu/HelpButton.png"));
				credits = new Bitmap(Assets.getBitmapData("img/Menu/CreditsButton.png"));
				shop = new Bitmap(Assets.getBitmapData("img/Menu/ShopButtonHover.png"));
			default:
		}
		
		buttonContainer = new Sprite();
		
		addChild(background);
		
		addChild(buttonContainer);
		
		buttonContainer.addChild(play);
		buttonContainer.addChild(help);
		buttonContainer.addChild(credits);
		buttonContainer.addChild(shop);
		buttonContainer.x = stage.stageWidth / 2;
		buttonContainer.y = stage.stageHeight / 2;
		
		center(play);
		center(help);
		center(credits);
		center(shop);
		
		addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		addEventListener(MouseEvent.CLICK, onClick);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
	}
	
	private function onMouseMove (e : MouseEvent) : Void {
		var index = selectionIndex;
		if (mouseX >= 202 && mouseX <= 450) {
			if (mouseY >= 137 && mouseY <= 215) {
				selectionIndex = 0;
			}
		} 
		if (mouseX >= 255 && mouseX <= 406) {
			if (mouseY >= 245 && mouseY <= 292) {
				selectionIndex = 1;
			}
		}
		if (mouseX >= 187 && mouseX <= 461) {
			if (mouseY >= 307 && mouseY <= 353) {
				selectionIndex = 2;
			}
		}
		if (mouseX >= 251 && mouseX <= 397) {
			if (mouseY >= 366 && mouseY <= 409) {
				selectionIndex = 3;
			}
		}
		
		if (index != selectionIndex) {
			switch (selectionIndex) {
				case 0:
					play.bitmapData = Assets.getBitmapData("img/Menu/PlayButtonHover.png");
					help.bitmapData = Assets.getBitmapData("img/Menu/HelpButton.png");
					credits.bitmapData = Assets.getBitmapData("img/Menu/CreditsButton.png");
					shop.bitmapData = Assets.getBitmapData("img/Menu/ShopButton.png");
				case 1:
					play.bitmapData = Assets.getBitmapData("img/Menu/PlayButton.png");
					help.bitmapData = Assets.getBitmapData("img/Menu/HelpButtonHover.png");
					credits.bitmapData = Assets.getBitmapData("img/Menu/CreditsButton.png");
					shop.bitmapData = Assets.getBitmapData("img/Menu/ShopButton.png");
				case 2:
					play.bitmapData = Assets.getBitmapData("img/Menu/PlayButton.png");
					help.bitmapData = Assets.getBitmapData("img/Menu/HelpButton.png");
					credits.bitmapData = Assets.getBitmapData("img/Menu/CreditsButtonHover.png");
					shop.bitmapData = Assets.getBitmapData("img/Menu/ShopButton.png");
				case 3:
					play.bitmapData = Assets.getBitmapData("img/Menu/PlayButton.png");
					help.bitmapData = Assets.getBitmapData("img/Menu/HelpButton.png");
					credits.bitmapData = Assets.getBitmapData("img/Menu/CreditsButton.png");
					shop.bitmapData = Assets.getBitmapData("img/Menu/ShopButtonHover.png");
				default:
			}
			center(play);
			center(help);
			center(credits);
			center(shop);
		}
	}
	
	private function onClick (e : MouseEvent) : Void {
		if (mouseX >= 202 && mouseX <= 450) {
			if (mouseY >= 137 && mouseY <= 215) {
				var main : Main = cast parent;
				main.openMenu(EScreen.S_ModeSelection);
				super.setTargetAlpha(0);
				selectionIndex = 0;
				super.setToBeDestroyed();
			}
		} 
		if (mouseX >= 255 && mouseX <= 406) {
			if (mouseY >= 245 && mouseY <= 292) {
				var main : Main = cast parent;
				main.openMenu(EScreen.S_Help);
				super.setTargetAlpha(0);
				selectionIndex = 1;
				super.setToBeDestroyed();
			}
		}
		if (mouseX >= 187 && mouseX <= 461) {
			if (mouseY >= 307 && mouseY <= 353) {
				var main : Main = cast parent;
				main.openMenu(EScreen.S_Credits);
				super.setTargetAlpha(0);
				selectionIndex = 2;
				super.setToBeDestroyed();
			}
		}
		if (mouseX >= 251 && mouseX <= 397) {
			if (mouseY >= 366 && mouseY <= 409) {
				var main : Main = cast parent;
				main.openMenu(EScreen.S_Shop);
				super.setTargetAlpha(0);
				selectionIndex = 3;
				super.setToBeDestroyed();
			}
		}
	}
	
	private function onKeyDown (e : KeyboardEvent) {
		if (super.isVisible()) {
			if (e.keyCode == Keyboard.SPACE || e.keyCode == Keyboard.ENTER) {
				var main : Main = cast parent;
				super.setTargetAlpha(0);
				switch (selectionIndex) {
					case 0:
						main.openMenu(EScreen.S_ModeSelection);
					case 1:
						main.openMenu(EScreen.S_Help);
					case 2:
						main.openMenu(EScreen.S_Credits);
					case 3:
						main.openMenu(EScreen.S_Shop);
					default:
						
				}
				super.setToBeDestroyed();
			} else {
				if (e.keyCode == Keyboard.W || e.keyCode == Keyboard.UP) {
					selectionIndex--;
					if (selectionIndex < 0) selectionIndex = 3;
				} else if (e.keyCode == Keyboard.S || e.keyCode == Keyboard.DOWN) {
					selectionIndex++;
					if (selectionIndex > 3) selectionIndex = 0;
				}
				
				switch (selectionIndex) 
				{
					case 0:
						play.bitmapData = Assets.getBitmapData("img/Menu/PlayButtonHover.png");
						help.bitmapData = Assets.getBitmapData("img/Menu/HelpButton.png");
						credits.bitmapData = Assets.getBitmapData("img/Menu/CreditsButton.png");
						shop.bitmapData = Assets.getBitmapData("img/Menu/ShopButton.png");
					case 1:
						play.bitmapData = Assets.getBitmapData("img/Menu/PlayButton.png");
						help.bitmapData = Assets.getBitmapData("img/Menu/HelpButtonHover.png");
						credits.bitmapData = Assets.getBitmapData("img/Menu/CreditsButton.png");
						shop.bitmapData = Assets.getBitmapData("img/Menu/ShopButton.png");
					case 2:
						play.bitmapData = Assets.getBitmapData("img/Menu/PlayButton.png");
						help.bitmapData = Assets.getBitmapData("img/Menu/HelpButton.png");
						credits.bitmapData = Assets.getBitmapData("img/Menu/CreditsButtonHover.png");
						shop.bitmapData = Assets.getBitmapData("img/Menu/ShopButton.png");
					case 3:
						play.bitmapData = Assets.getBitmapData("img/Menu/PlayButton.png");
						help.bitmapData = Assets.getBitmapData("img/Menu/HelpButton.png");
						credits.bitmapData = Assets.getBitmapData("img/Menu/CreditsButton.png");
						shop.bitmapData = Assets.getBitmapData("img/Menu/ShopButtonHover.png");
					default:
				}
				
				center(play);
				center(help);
				center(credits);
				center(shop);
			}
		}
	}
	
	private function center (bmp : Bitmap) {
		bmp.x = -bmp.width / 2;
		bmp.y = -bmp.height / 2;
		if (bmp.bitmapData == Assets.getBitmapData("img/Menu/ShopButtonHover.png")) bmp.x += 3;
	}
	
	override public function onDestroy () : Void {
		removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		removeEventListener(MouseEvent.CLICK, onClick);
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		
		buttonContainer.removeChild(play);
		buttonContainer.removeChild(help);
		buttonContainer.removeChild(credits);
		buttonContainer.removeChild(shop);
		removeChild(buttonContainer);
		buttonContainer = null;
		credits = null;
		play = null;
		help = null;
		shop = null;
		
		removeChild(background);
		background = null;
	}
}