package kalakuh.time4you;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import kalakuh.time4you.game.EGameMode;
import kalakuh.time4you.game.GameManager;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.Event;
import kalakuh.time4you.menus.*;
import kalakuh.time4you.gui.*;
import openfl.media.Sound;
#if flash
	import kalakuh.time4you.gui.GameContextMenu;
#end

/**
 * ...
 * @author Kalakuh
 */

class Main extends Sprite 
{
	private var inited:Bool;
	private var mainMenu : MainMenu;
	private var credits : Credits;
	private var help : Help;
	private var mSelection : ModeSelection;
	private var game : GameManager;
	private var gOver : GameOver;
	private var sound : Sound;
	
	#if flash
		private static var kongregate : KongregateAPI;
	#end	
	
	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;
		
		// (your code here)
		mainMenu = new MainMenu();
		addChild(mainMenu);
		
		credits = new Credits();
		addChild(credits);
		
		help = new Help();
		addChild(help);
		
		mSelection = new ModeSelection();
		addChild(mSelection);
		
		gOver = new GameOver();
		addChild(gOver);
		
		game = new GameManager();
		addChild(game);
		
		sound = Assets.getSound("sound/DarknessOfForever.mp3");
		// i hope 9999 repeats is enough?
		sound.play(0.0, 9999);
		
		#if flash
			contextMenu = GameContextMenu.getContextMenu();
			kongregate = new KongregateAPI();
		#end
	}
	
	public function openMenu (menu : EScreen) : Void {
		switch (menu) {
			case EScreen.S_MainMenu:
				mainMenu.setTargetAlpha(1);
			case EScreen.S_Credits:
				credits.setTargetAlpha(1);
			case EScreen.S_Help:
				help.setTargetAlpha(1);
			case EScreen.S_ModeSelection:
				mSelection.setTargetAlpha(1);
			default:
		}
	}
	
	public function gameOver (score : Float, gamemode : EGameMode) : Void {
		gOver.setTargetAlpha(1);
		gOver.setScore(score, gamemode);
	}
	
	public function startGame (gamemode : EGameMode) : Void {
		game.setTargetAlpha(1);
		game.start(gamemode);
	}
	
	public function restart () : Void {
		game.setTargetAlpha(1);
		game.start();
	}

	/* SETUP */

	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
	
	public static function getAPI () : KongregateAPI {
		return kongregate;
	}
}
