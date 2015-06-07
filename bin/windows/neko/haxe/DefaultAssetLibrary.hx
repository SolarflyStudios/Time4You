package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		path.set ("img/Game Mode/ClassicModeButton.png", "img/Game Mode/ClassicModeButton.png");
		type.set ("img/Game Mode/ClassicModeButton.png", AssetType.IMAGE);
		path.set ("img/Game Mode/ClassicModeButtonHover.png", "img/Game Mode/ClassicModeButtonHover.png");
		type.set ("img/Game Mode/ClassicModeButtonHover.png", AssetType.IMAGE);
		path.set ("img/Game Mode/GameModeBackground.png", "img/Game Mode/GameModeBackground.png");
		type.set ("img/Game Mode/GameModeBackground.png", AssetType.IMAGE);
		path.set ("img/Game Mode/Left.png", "img/Game Mode/Left.png");
		type.set ("img/Game Mode/Left.png", AssetType.IMAGE);
		path.set ("img/Game Mode/Right.png", "img/Game Mode/Right.png");
		type.set ("img/Game Mode/Right.png", AssetType.IMAGE);
		path.set ("img/Game Mode/RushModeButton.png", "img/Game Mode/RushModeButton.png");
		type.set ("img/Game Mode/RushModeButton.png", AssetType.IMAGE);
		path.set ("img/Game Mode/RushModeButtonHover.png", "img/Game Mode/RushModeButtonHover.png");
		type.set ("img/Game Mode/RushModeButtonHover.png", AssetType.IMAGE);
		path.set ("img/Game Mode/Storm.png", "img/Game Mode/Storm.png");
		type.set ("img/Game Mode/Storm.png", AssetType.IMAGE);
		path.set ("img/Game Mode/StormHover.png", "img/Game Mode/StormHover.png");
		type.set ("img/Game Mode/StormHover.png", AssetType.IMAGE);
		path.set ("img/Game Over/MainMenu.png", "img/Game Over/MainMenu.png");
		type.set ("img/Game Over/MainMenu.png", AssetType.IMAGE);
		path.set ("img/Game Over/Retry.png", "img/Game Over/Retry.png");
		type.set ("img/Game Over/Retry.png", AssetType.IMAGE);
		path.set ("img/In-Game/Coin.png", "img/In-Game/Coin.png");
		type.set ("img/In-Game/Coin.png", AssetType.IMAGE);
		path.set ("img/In-Game/Enemy1.png", "img/In-Game/Enemy1.png");
		type.set ("img/In-Game/Enemy1.png", AssetType.IMAGE);
		path.set ("img/In-Game/Enemy2.png", "img/In-Game/Enemy2.png");
		type.set ("img/In-Game/Enemy2.png", AssetType.IMAGE);
		path.set ("img/In-Game/Enemy3.png", "img/In-Game/Enemy3.png");
		type.set ("img/In-Game/Enemy3.png", AssetType.IMAGE);
		path.set ("img/In-Game/ExplodingEnemy.png", "img/In-Game/ExplodingEnemy.png");
		type.set ("img/In-Game/ExplodingEnemy.png", AssetType.IMAGE);
		path.set ("img/In-Game/GameBackground.png", "img/In-Game/GameBackground.png");
		type.set ("img/In-Game/GameBackground.png", AssetType.IMAGE);
		path.set ("img/In-Game/InviPU.png", "img/In-Game/InviPU.png");
		type.set ("img/In-Game/InviPU.png", AssetType.IMAGE);
		path.set ("img/In-Game/InvisEnemy.png", "img/In-Game/InvisEnemy.png");
		type.set ("img/In-Game/InvisEnemy.png", AssetType.IMAGE);
		path.set ("img/In-Game/MissileEnemy.png", "img/In-Game/MissileEnemy.png");
		type.set ("img/In-Game/MissileEnemy.png", AssetType.IMAGE);
		path.set ("img/In-Game/Player.png", "img/In-Game/Player.png");
		type.set ("img/In-Game/Player.png", AssetType.IMAGE);
		path.set ("img/In-Game/SineEnemy.png", "img/In-Game/SineEnemy.png");
		type.set ("img/In-Game/SineEnemy.png", AssetType.IMAGE);
		path.set ("img/In-Game/SizePU.png", "img/In-Game/SizePU.png");
		type.set ("img/In-Game/SizePU.png", AssetType.IMAGE);
		path.set ("img/In-Game/SlowMotionBlur.png", "img/In-Game/SlowMotionBlur.png");
		type.set ("img/In-Game/SlowMotionBlur.png", AssetType.IMAGE);
		path.set ("img/In-Game/Sound.png", "img/In-Game/Sound.png");
		type.set ("img/In-Game/Sound.png", AssetType.IMAGE);
		path.set ("img/In-Game/SoundOff.png", "img/In-Game/SoundOff.png");
		type.set ("img/In-Game/SoundOff.png", AssetType.IMAGE);
		path.set ("img/In-Game/x2PU.png", "img/In-Game/x2PU.png");
		type.set ("img/In-Game/x2PU.png", AssetType.IMAGE);
		path.set ("img/Menu/CreditsButton.png", "img/Menu/CreditsButton.png");
		type.set ("img/Menu/CreditsButton.png", AssetType.IMAGE);
		path.set ("img/Menu/CreditsButtonHover.png", "img/Menu/CreditsButtonHover.png");
		type.set ("img/Menu/CreditsButtonHover.png", AssetType.IMAGE);
		path.set ("img/Menu/CreditsScreen.png", "img/Menu/CreditsScreen.png");
		type.set ("img/Menu/CreditsScreen.png", AssetType.IMAGE);
		path.set ("img/Menu/GameOverBG.png", "img/Menu/GameOverBG.png");
		type.set ("img/Menu/GameOverBG.png", AssetType.IMAGE);
		path.set ("img/Menu/HelpButton.png", "img/Menu/HelpButton.png");
		type.set ("img/Menu/HelpButton.png", AssetType.IMAGE);
		path.set ("img/Menu/HelpButtonHover.png", "img/Menu/HelpButtonHover.png");
		type.set ("img/Menu/HelpButtonHover.png", AssetType.IMAGE);
		path.set ("img/Menu/HelpScreen.png", "img/Menu/HelpScreen.png");
		type.set ("img/Menu/HelpScreen.png", AssetType.IMAGE);
		path.set ("img/Menu/MenuBackground.png", "img/Menu/MenuBackground.png");
		type.set ("img/Menu/MenuBackground.png", AssetType.IMAGE);
		path.set ("img/Menu/PlayButton.png", "img/Menu/PlayButton.png");
		type.set ("img/Menu/PlayButton.png", AssetType.IMAGE);
		path.set ("img/Menu/PlayButtonHover.png", "img/Menu/PlayButtonHover.png");
		type.set ("img/Menu/PlayButtonHover.png", AssetType.IMAGE);
		path.set ("img/Menu/ShopButton.png", "img/Menu/ShopButton.png");
		type.set ("img/Menu/ShopButton.png", AssetType.IMAGE);
		path.set ("img/Menu/ShopButtonHover.png", "img/Menu/ShopButtonHover.png");
		type.set ("img/Menu/ShopButtonHover.png", AssetType.IMAGE);
		path.set ("img/Numbers/0.png", "img/Numbers/0.png");
		type.set ("img/Numbers/0.png", AssetType.IMAGE);
		path.set ("img/Numbers/1.png", "img/Numbers/1.png");
		type.set ("img/Numbers/1.png", AssetType.IMAGE);
		path.set ("img/Numbers/2.png", "img/Numbers/2.png");
		type.set ("img/Numbers/2.png", AssetType.IMAGE);
		path.set ("img/Numbers/3.png", "img/Numbers/3.png");
		type.set ("img/Numbers/3.png", AssetType.IMAGE);
		path.set ("img/Numbers/4.png", "img/Numbers/4.png");
		type.set ("img/Numbers/4.png", AssetType.IMAGE);
		path.set ("img/Numbers/5.png", "img/Numbers/5.png");
		type.set ("img/Numbers/5.png", AssetType.IMAGE);
		path.set ("img/Numbers/6.png", "img/Numbers/6.png");
		type.set ("img/Numbers/6.png", AssetType.IMAGE);
		path.set ("img/Numbers/7.png", "img/Numbers/7.png");
		type.set ("img/Numbers/7.png", AssetType.IMAGE);
		path.set ("img/Numbers/8.png", "img/Numbers/8.png");
		type.set ("img/Numbers/8.png", AssetType.IMAGE);
		path.set ("img/Numbers/9.png", "img/Numbers/9.png");
		type.set ("img/Numbers/9.png", AssetType.IMAGE);
		path.set ("img/Shop/GrayBar.png", "img/Shop/GrayBar.png");
		type.set ("img/Shop/GrayBar.png", AssetType.IMAGE);
		path.set ("img/Shop/PriceButton.png", "img/Shop/PriceButton.png");
		type.set ("img/Shop/PriceButton.png", AssetType.IMAGE);
		path.set ("img/Shop/SlowmoBar.png", "img/Shop/SlowmoBar.png");
		type.set ("img/Shop/SlowmoBar.png", AssetType.IMAGE);
		path.set ("img/Shop/SlowmoText.png", "img/Shop/SlowmoText.png");
		type.set ("img/Shop/SlowmoText.png", AssetType.IMAGE);
		path.set ("img/Shop/SpawnBar.png", "img/Shop/SpawnBar.png");
		type.set ("img/Shop/SpawnBar.png", AssetType.IMAGE);
		path.set ("img/Shop/SpawnText.png", "img/Shop/SpawnText.png");
		type.set ("img/Shop/SpawnText.png", AssetType.IMAGE);
		path.set ("img/Shop/StaminaBar.png", "img/Shop/StaminaBar.png");
		type.set ("img/Shop/StaminaBar.png", AssetType.IMAGE);
		path.set ("img/Shop/StaminaText.png", "img/Shop/StaminaText.png");
		type.set ("img/Shop/StaminaText.png", AssetType.IMAGE);
		path.set ("img/Shop/upgradesBG.png", "img/Shop/upgradesBG.png");
		type.set ("img/Shop/upgradesBG.png", AssetType.IMAGE);
		path.set ("sound/coin.mp3", "sound/coin.mp3");
		type.set ("sound/coin.mp3", AssetType.MUSIC);
		path.set ("sound/DarknessOfForever.mp3", "sound/DarknessOfForever.mp3");
		type.set ("sound/DarknessOfForever.mp3", AssetType.MUSIC);
		path.set ("sound/death.mp3", "sound/death.mp3");
		type.set ("sound/death.mp3", AssetType.MUSIC);
		path.set ("sound/power.mp3", "sound/power.mp3");
		type.set ("sound/power.mp3", AssetType.MUSIC);
		path.set ("sound/purchase.mp3", "sound/purchase.mp3");
		type.set ("sound/purchase.mp3", AssetType.MUSIC);
		path.set ("sound/slowmo.mp3", "sound/slowmo.mp3");
		type.set ("sound/slowmo.mp3", AssetType.MUSIC);
		path.set ("font/license.txt", "font/license.txt");
		type.set ("font/license.txt", AssetType.TEXT);
		path.set ("font/Nebula.ttf", "font/Nebula.ttf");
		type.set ("font/Nebula.ttf", AssetType.FONT);
		path.set ("font/readme.txt", "font/readme.txt");
		type.set ("font/readme.txt", AssetType.TEXT);
		
		
		#elseif html5
		
		var id;
		id = "img/Game Mode/ClassicModeButton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Game Mode/ClassicModeButtonHover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Game Mode/GameModeBackground.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Game Mode/Left.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Game Mode/Right.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Game Mode/RushModeButton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Game Mode/RushModeButtonHover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Game Mode/Storm.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Game Mode/StormHover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Game Over/MainMenu.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Game Over/Retry.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/In-Game/Coin.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/In-Game/Enemy1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/In-Game/Enemy2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/In-Game/Enemy3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/In-Game/ExplodingEnemy.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/In-Game/GameBackground.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/In-Game/InviPU.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/In-Game/InvisEnemy.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/In-Game/MissileEnemy.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/In-Game/Player.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/In-Game/SineEnemy.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/In-Game/SizePU.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/In-Game/SlowMotionBlur.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/In-Game/Sound.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/In-Game/SoundOff.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/In-Game/x2PU.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Menu/CreditsButton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Menu/CreditsButtonHover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Menu/CreditsScreen.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Menu/GameOverBG.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Menu/HelpButton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Menu/HelpButtonHover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Menu/HelpScreen.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Menu/MenuBackground.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Menu/PlayButton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Menu/PlayButtonHover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Menu/ShopButton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Menu/ShopButtonHover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Numbers/0.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Numbers/1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Numbers/2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Numbers/3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Numbers/4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Numbers/5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Numbers/6.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Numbers/7.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Numbers/8.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Numbers/9.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Shop/GrayBar.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Shop/PriceButton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Shop/SlowmoBar.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Shop/SlowmoText.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Shop/SpawnBar.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Shop/SpawnText.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Shop/StaminaBar.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Shop/StaminaText.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Shop/upgradesBG.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "sound/coin.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "sound/DarknessOfForever.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "sound/death.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "sound/power.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "sound/purchase.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "sound/slowmo.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "font/license.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "font/Nebula.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "font/readme.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__font_nebula_ttf);
		
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		className.set ("font/Nebula.ttf", __ASSET__font_nebula_ttf);
		type.set ("font/Nebula.ttf", AssetType.FONT);
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash)
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				handler (audioBuffer);
				
			});
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			handler (getAudioBuffer (id));
			
		}
		#else
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || html5)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash






































































#elseif html5


































































@:keep #if display private #end class __ASSET__font_nebula_ttf extends lime.text.Font { public function new () { super (); name = "Nebula Regular"; } } 



#else

@:keep #if display private #end class __ASSET__font_nebula_ttf extends lime.text.Font { public function new () { __fontPath = "font/Nebula.ttf"; name = "Nebula Regular"; super (); }}


#if (windows || mac || linux)





#end

#if openfl
@:keep #if display private #end class __ASSET__OPENFL__font_nebula_ttf extends openfl.text.Font { public function new () { __fontPath = "font/Nebula.ttf"; name = "Nebula Regular"; super (); }}

#end

#end
#end

