package kalakuh.time4you.menus ;

import kalakuh.time4you.Main;
import openfl.display.Sprite;
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
class MainMenu extends Screen
{
	private var credits : Bitmap;
	private var help : Bitmap;
	private var play : Bitmap;
	private var buttonContainer : Sprite;
	
	private var background : Bitmap;
	
	private var selectionIndex : Int = 0;
	
	public function new() 
	{
		super(1);
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init (e : Event) {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		background = new Bitmap(Assets.getBitmapData("img/Menu/MenuBackground.png"));
		
		play = new Bitmap(Assets.getBitmapData("img/Menu/PlayButtonHover.png"));
		help = new Bitmap(Assets.getBitmapData("img/Menu/HelpButton.png"));
		credits = new Bitmap(Assets.getBitmapData("img/Menu/CreditsButton.png"));
		
		buttonContainer = new Sprite();
		
		addChild(background);
		
		addChild(buttonContainer);
		
		buttonContainer.addChild(play);
		buttonContainer.addChild(help);
		buttonContainer.addChild(credits);
		buttonContainer.x = stage.stageWidth / 2;
		buttonContainer.y = stage.stageHeight / 2;
		
		center(play);
		center(help);
		center(credits);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
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
					default:
						
				}
			} else {
				if (e.keyCode == Keyboard.W || e.keyCode == Keyboard.UP) {
					selectionIndex--;
					if (selectionIndex < 0) selectionIndex = 2;
				} else if (e.keyCode == Keyboard.S || e.keyCode == Keyboard.DOWN) {
					selectionIndex++;
					if (selectionIndex > 2) selectionIndex = 0;
				}
				
				switch (selectionIndex) 
				{
					case 0:
						play.bitmapData = Assets.getBitmapData("img/Menu/PlayButtonHover.png");
						help.bitmapData = Assets.getBitmapData("img/Menu/HelpButton.png");
						credits.bitmapData = Assets.getBitmapData("img/Menu/CreditsButton.png");
					case 1:
						play.bitmapData = Assets.getBitmapData("img/Menu/PlayButton.png");
						help.bitmapData = Assets.getBitmapData("img/Menu/HelpButtonHover.png");
						credits.bitmapData = Assets.getBitmapData("img/Menu/CreditsButton.png");
					case 2:
						play.bitmapData = Assets.getBitmapData("img/Menu/PlayButton.png");
						help.bitmapData = Assets.getBitmapData("img/Menu/HelpButton.png");
						credits.bitmapData = Assets.getBitmapData("img/Menu/CreditsButtonHover.png");
					default:
				}
				
				center(play);
				center(help);
				center(credits);
			}
		}
	}
	
	private function center (bmp : Bitmap) {
		bmp.x = -bmp.width / 2;
		bmp.y = -bmp.height / 2;
	}
}