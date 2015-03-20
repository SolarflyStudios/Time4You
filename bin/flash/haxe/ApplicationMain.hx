import lime.Assets;
#if !macro


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	private static var app:lime.app.Application;
	
	
	public static function create ():Void {
		
		app = new openfl.display.Application ();
		app.create (config);
		
		var display = new NMEPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if js
		var urls = [];
		var types = [];
		
		
		urls.push ("img/Game Mode/ClassicModeButton.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Game Mode/ClassicModeButtonHover.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Game Mode/GameModeBackground.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Game Mode/Left.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Game Mode/Right.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Game Mode/RushModeButton.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Game Mode/RushModeButtonHover.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Game Mode/Storm.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Game Mode/StormHover.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Game Over/MainMenu.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Game Over/Retry.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/In-Game/Coin.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/In-Game/Enemy1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/In-Game/Enemy2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/In-Game/Enemy3.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/In-Game/ExplodingEnemy.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/In-Game/GameBackground.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/In-Game/InvisEnemy.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/In-Game/MissileEnemy.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/In-Game/Player.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/In-Game/SineEnemy.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/In-Game/SizePU.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/In-Game/SlowMotionBlur.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/In-Game/Sound.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/In-Game/SoundOff.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Menu/CreditsButton.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Menu/CreditsButtonHover.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Menu/CreditsScreen.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Menu/GameOverBG.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Menu/HelpButton.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Menu/HelpButtonHover.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Menu/HelpScreen.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Menu/MenuBackground.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Menu/PlayButton.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Menu/PlayButtonHover.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Numbers/0.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Numbers/1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Numbers/2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Numbers/3.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Numbers/4.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Numbers/5.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Numbers/6.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Numbers/7.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Numbers/8.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/Numbers/9.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("sound/coin.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("sound/DarknessOfForever.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("sound/death.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("sound/power.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("sound/slowmo.mp3");
		types.push (AssetType.MUSIC);
		
		
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if sys
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (loaded == total) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			antialiasing: Std.int (0),
			background: Std.int (16777215),
			borderless: false,
			depthBuffer: false,
			fps: Std.int (60),
			fullscreen: false,
			height: Std.int (480),
			orientation: "",
			resizable: true,
			stencilBuffer: false,
			title: "Time4You",
			vsync: false,
			width: Std.int (640),
			
		}
		
		#if js
		#if (munit || utest)
		flash.Lib.embed (null, 640, 480, "FFFFFF");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		openfl.Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
		openfl.Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields (kalakuh.time4you.Main)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		if (hasMain) {
			
			Reflect.callMethod (kalakuh.time4you.Main, Reflect.field (kalakuh.time4you.Main, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends kalakuh.time4you.Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
