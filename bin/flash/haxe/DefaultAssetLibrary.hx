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
		
		className.set ("img/Game Mode/ClassicModeButton.png", __ASSET__img_game_mode_classicmodebutton_png);
		type.set ("img/Game Mode/ClassicModeButton.png", AssetType.IMAGE);
		className.set ("img/Game Mode/ClassicModeButtonHover.png", __ASSET__img_game_mode_classicmodebuttonhover_png);
		type.set ("img/Game Mode/ClassicModeButtonHover.png", AssetType.IMAGE);
		className.set ("img/Game Mode/GameModeBackground.png", __ASSET__img_game_mode_gamemodebackground_png);
		type.set ("img/Game Mode/GameModeBackground.png", AssetType.IMAGE);
		className.set ("img/Game Mode/Left.png", __ASSET__img_game_mode_left_png);
		type.set ("img/Game Mode/Left.png", AssetType.IMAGE);
		className.set ("img/Game Mode/Right.png", __ASSET__img_game_mode_right_png);
		type.set ("img/Game Mode/Right.png", AssetType.IMAGE);
		className.set ("img/Game Mode/RushModeButton.png", __ASSET__img_game_mode_rushmodebutton_png);
		type.set ("img/Game Mode/RushModeButton.png", AssetType.IMAGE);
		className.set ("img/Game Mode/RushModeButtonHover.png", __ASSET__img_game_mode_rushmodebuttonhover_png);
		type.set ("img/Game Mode/RushModeButtonHover.png", AssetType.IMAGE);
		className.set ("img/Game Mode/Storm.png", __ASSET__img_game_mode_storm_png);
		type.set ("img/Game Mode/Storm.png", AssetType.IMAGE);
		className.set ("img/Game Mode/StormHover.png", __ASSET__img_game_mode_stormhover_png);
		type.set ("img/Game Mode/StormHover.png", AssetType.IMAGE);
		className.set ("img/Game Over/MainMenu.png", __ASSET__img_game_over_mainmenu_png);
		type.set ("img/Game Over/MainMenu.png", AssetType.IMAGE);
		className.set ("img/Game Over/Retry.png", __ASSET__img_game_over_retry_png);
		type.set ("img/Game Over/Retry.png", AssetType.IMAGE);
		className.set ("img/In-Game/Coin.png", __ASSET__img_in_game_coin_png);
		type.set ("img/In-Game/Coin.png", AssetType.IMAGE);
		className.set ("img/In-Game/Enemy1.png", __ASSET__img_in_game_enemy1_png);
		type.set ("img/In-Game/Enemy1.png", AssetType.IMAGE);
		className.set ("img/In-Game/Enemy2.png", __ASSET__img_in_game_enemy2_png);
		type.set ("img/In-Game/Enemy2.png", AssetType.IMAGE);
		className.set ("img/In-Game/Enemy3.png", __ASSET__img_in_game_enemy3_png);
		type.set ("img/In-Game/Enemy3.png", AssetType.IMAGE);
		className.set ("img/In-Game/ExplodingEnemy.png", __ASSET__img_in_game_explodingenemy_png);
		type.set ("img/In-Game/ExplodingEnemy.png", AssetType.IMAGE);
		className.set ("img/In-Game/GameBackground.png", __ASSET__img_in_game_gamebackground_png);
		type.set ("img/In-Game/GameBackground.png", AssetType.IMAGE);
		className.set ("img/In-Game/InvisEnemy.png", __ASSET__img_in_game_invisenemy_png);
		type.set ("img/In-Game/InvisEnemy.png", AssetType.IMAGE);
		className.set ("img/In-Game/MissileEnemy.png", __ASSET__img_in_game_missileenemy_png);
		type.set ("img/In-Game/MissileEnemy.png", AssetType.IMAGE);
		className.set ("img/In-Game/Player.png", __ASSET__img_in_game_player_png);
		type.set ("img/In-Game/Player.png", AssetType.IMAGE);
		className.set ("img/In-Game/SineEnemy.png", __ASSET__img_in_game_sineenemy_png);
		type.set ("img/In-Game/SineEnemy.png", AssetType.IMAGE);
		className.set ("img/In-Game/SizePU.png", __ASSET__img_in_game_sizepu_png);
		type.set ("img/In-Game/SizePU.png", AssetType.IMAGE);
		className.set ("img/In-Game/SlowMotionBlur.png", __ASSET__img_in_game_slowmotionblur_png);
		type.set ("img/In-Game/SlowMotionBlur.png", AssetType.IMAGE);
		className.set ("img/In-Game/Sound.png", __ASSET__img_in_game_sound_png);
		type.set ("img/In-Game/Sound.png", AssetType.IMAGE);
		className.set ("img/In-Game/SoundOff.png", __ASSET__img_in_game_soundoff_png);
		type.set ("img/In-Game/SoundOff.png", AssetType.IMAGE);
		className.set ("img/Menu/CreditsButton.png", __ASSET__img_menu_creditsbutton_png);
		type.set ("img/Menu/CreditsButton.png", AssetType.IMAGE);
		className.set ("img/Menu/CreditsButtonHover.png", __ASSET__img_menu_creditsbuttonhover_png);
		type.set ("img/Menu/CreditsButtonHover.png", AssetType.IMAGE);
		className.set ("img/Menu/CreditsScreen.png", __ASSET__img_menu_creditsscreen_png);
		type.set ("img/Menu/CreditsScreen.png", AssetType.IMAGE);
		className.set ("img/Menu/GameOverBG.png", __ASSET__img_menu_gameoverbg_png);
		type.set ("img/Menu/GameOverBG.png", AssetType.IMAGE);
		className.set ("img/Menu/HelpButton.png", __ASSET__img_menu_helpbutton_png);
		type.set ("img/Menu/HelpButton.png", AssetType.IMAGE);
		className.set ("img/Menu/HelpButtonHover.png", __ASSET__img_menu_helpbuttonhover_png);
		type.set ("img/Menu/HelpButtonHover.png", AssetType.IMAGE);
		className.set ("img/Menu/HelpScreen.png", __ASSET__img_menu_helpscreen_png);
		type.set ("img/Menu/HelpScreen.png", AssetType.IMAGE);
		className.set ("img/Menu/MenuBackground.png", __ASSET__img_menu_menubackground_png);
		type.set ("img/Menu/MenuBackground.png", AssetType.IMAGE);
		className.set ("img/Menu/PlayButton.png", __ASSET__img_menu_playbutton_png);
		type.set ("img/Menu/PlayButton.png", AssetType.IMAGE);
		className.set ("img/Menu/PlayButtonHover.png", __ASSET__img_menu_playbuttonhover_png);
		type.set ("img/Menu/PlayButtonHover.png", AssetType.IMAGE);
		className.set ("img/Menu/ShopButton.png", __ASSET__img_menu_shopbutton_png);
		type.set ("img/Menu/ShopButton.png", AssetType.IMAGE);
		className.set ("img/Menu/ShopButtonHover.png", __ASSET__img_menu_shopbuttonhover_png);
		type.set ("img/Menu/ShopButtonHover.png", AssetType.IMAGE);
		className.set ("img/Numbers/0.png", __ASSET__img_numbers_0_png);
		type.set ("img/Numbers/0.png", AssetType.IMAGE);
		className.set ("img/Numbers/1.png", __ASSET__img_numbers_1_png);
		type.set ("img/Numbers/1.png", AssetType.IMAGE);
		className.set ("img/Numbers/2.png", __ASSET__img_numbers_2_png);
		type.set ("img/Numbers/2.png", AssetType.IMAGE);
		className.set ("img/Numbers/3.png", __ASSET__img_numbers_3_png);
		type.set ("img/Numbers/3.png", AssetType.IMAGE);
		className.set ("img/Numbers/4.png", __ASSET__img_numbers_4_png);
		type.set ("img/Numbers/4.png", AssetType.IMAGE);
		className.set ("img/Numbers/5.png", __ASSET__img_numbers_5_png);
		type.set ("img/Numbers/5.png", AssetType.IMAGE);
		className.set ("img/Numbers/6.png", __ASSET__img_numbers_6_png);
		type.set ("img/Numbers/6.png", AssetType.IMAGE);
		className.set ("img/Numbers/7.png", __ASSET__img_numbers_7_png);
		type.set ("img/Numbers/7.png", AssetType.IMAGE);
		className.set ("img/Numbers/8.png", __ASSET__img_numbers_8_png);
		type.set ("img/Numbers/8.png", AssetType.IMAGE);
		className.set ("img/Numbers/9.png", __ASSET__img_numbers_9_png);
		type.set ("img/Numbers/9.png", AssetType.IMAGE);
		className.set ("img/Shop/upgradesBG.png", __ASSET__img_shop_upgradesbg_png);
		type.set ("img/Shop/upgradesBG.png", AssetType.IMAGE);
		className.set ("sound/coin.mp3", __ASSET__sound_coin_mp3);
		type.set ("sound/coin.mp3", AssetType.MUSIC);
		className.set ("sound/DarknessOfForever.mp3", __ASSET__sound_darknessofforever_mp3);
		type.set ("sound/DarknessOfForever.mp3", AssetType.MUSIC);
		className.set ("sound/death.mp3", __ASSET__sound_death_mp3);
		type.set ("sound/death.mp3", AssetType.MUSIC);
		className.set ("sound/power.mp3", __ASSET__sound_power_mp3);
		type.set ("sound/power.mp3", AssetType.MUSIC);
		className.set ("sound/slowmo.mp3", __ASSET__sound_slowmo_mp3);
		type.set ("sound/slowmo.mp3", AssetType.MUSIC);
		
		
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
		id = "sound/slowmo.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("img/Game Mode/ClassicModeButton.png", __ASSET__img_game_mode_classicmodebutton_png);
		type.set ("img/Game Mode/ClassicModeButton.png", AssetType.IMAGE);
		
		className.set ("img/Game Mode/ClassicModeButtonHover.png", __ASSET__img_game_mode_classicmodebuttonhover_png);
		type.set ("img/Game Mode/ClassicModeButtonHover.png", AssetType.IMAGE);
		
		className.set ("img/Game Mode/GameModeBackground.png", __ASSET__img_game_mode_gamemodebackground_png);
		type.set ("img/Game Mode/GameModeBackground.png", AssetType.IMAGE);
		
		className.set ("img/Game Mode/Left.png", __ASSET__img_game_mode_left_png);
		type.set ("img/Game Mode/Left.png", AssetType.IMAGE);
		
		className.set ("img/Game Mode/Right.png", __ASSET__img_game_mode_right_png);
		type.set ("img/Game Mode/Right.png", AssetType.IMAGE);
		
		className.set ("img/Game Mode/RushModeButton.png", __ASSET__img_game_mode_rushmodebutton_png);
		type.set ("img/Game Mode/RushModeButton.png", AssetType.IMAGE);
		
		className.set ("img/Game Mode/RushModeButtonHover.png", __ASSET__img_game_mode_rushmodebuttonhover_png);
		type.set ("img/Game Mode/RushModeButtonHover.png", AssetType.IMAGE);
		
		className.set ("img/Game Mode/Storm.png", __ASSET__img_game_mode_storm_png);
		type.set ("img/Game Mode/Storm.png", AssetType.IMAGE);
		
		className.set ("img/Game Mode/StormHover.png", __ASSET__img_game_mode_stormhover_png);
		type.set ("img/Game Mode/StormHover.png", AssetType.IMAGE);
		
		className.set ("img/Game Over/MainMenu.png", __ASSET__img_game_over_mainmenu_png);
		type.set ("img/Game Over/MainMenu.png", AssetType.IMAGE);
		
		className.set ("img/Game Over/Retry.png", __ASSET__img_game_over_retry_png);
		type.set ("img/Game Over/Retry.png", AssetType.IMAGE);
		
		className.set ("img/In-Game/Coin.png", __ASSET__img_in_game_coin_png);
		type.set ("img/In-Game/Coin.png", AssetType.IMAGE);
		
		className.set ("img/In-Game/Enemy1.png", __ASSET__img_in_game_enemy1_png);
		type.set ("img/In-Game/Enemy1.png", AssetType.IMAGE);
		
		className.set ("img/In-Game/Enemy2.png", __ASSET__img_in_game_enemy2_png);
		type.set ("img/In-Game/Enemy2.png", AssetType.IMAGE);
		
		className.set ("img/In-Game/Enemy3.png", __ASSET__img_in_game_enemy3_png);
		type.set ("img/In-Game/Enemy3.png", AssetType.IMAGE);
		
		className.set ("img/In-Game/ExplodingEnemy.png", __ASSET__img_in_game_explodingenemy_png);
		type.set ("img/In-Game/ExplodingEnemy.png", AssetType.IMAGE);
		
		className.set ("img/In-Game/GameBackground.png", __ASSET__img_in_game_gamebackground_png);
		type.set ("img/In-Game/GameBackground.png", AssetType.IMAGE);
		
		className.set ("img/In-Game/InvisEnemy.png", __ASSET__img_in_game_invisenemy_png);
		type.set ("img/In-Game/InvisEnemy.png", AssetType.IMAGE);
		
		className.set ("img/In-Game/MissileEnemy.png", __ASSET__img_in_game_missileenemy_png);
		type.set ("img/In-Game/MissileEnemy.png", AssetType.IMAGE);
		
		className.set ("img/In-Game/Player.png", __ASSET__img_in_game_player_png);
		type.set ("img/In-Game/Player.png", AssetType.IMAGE);
		
		className.set ("img/In-Game/SineEnemy.png", __ASSET__img_in_game_sineenemy_png);
		type.set ("img/In-Game/SineEnemy.png", AssetType.IMAGE);
		
		className.set ("img/In-Game/SizePU.png", __ASSET__img_in_game_sizepu_png);
		type.set ("img/In-Game/SizePU.png", AssetType.IMAGE);
		
		className.set ("img/In-Game/SlowMotionBlur.png", __ASSET__img_in_game_slowmotionblur_png);
		type.set ("img/In-Game/SlowMotionBlur.png", AssetType.IMAGE);
		
		className.set ("img/In-Game/Sound.png", __ASSET__img_in_game_sound_png);
		type.set ("img/In-Game/Sound.png", AssetType.IMAGE);
		
		className.set ("img/In-Game/SoundOff.png", __ASSET__img_in_game_soundoff_png);
		type.set ("img/In-Game/SoundOff.png", AssetType.IMAGE);
		
		className.set ("img/Menu/CreditsButton.png", __ASSET__img_menu_creditsbutton_png);
		type.set ("img/Menu/CreditsButton.png", AssetType.IMAGE);
		
		className.set ("img/Menu/CreditsButtonHover.png", __ASSET__img_menu_creditsbuttonhover_png);
		type.set ("img/Menu/CreditsButtonHover.png", AssetType.IMAGE);
		
		className.set ("img/Menu/CreditsScreen.png", __ASSET__img_menu_creditsscreen_png);
		type.set ("img/Menu/CreditsScreen.png", AssetType.IMAGE);
		
		className.set ("img/Menu/GameOverBG.png", __ASSET__img_menu_gameoverbg_png);
		type.set ("img/Menu/GameOverBG.png", AssetType.IMAGE);
		
		className.set ("img/Menu/HelpButton.png", __ASSET__img_menu_helpbutton_png);
		type.set ("img/Menu/HelpButton.png", AssetType.IMAGE);
		
		className.set ("img/Menu/HelpButtonHover.png", __ASSET__img_menu_helpbuttonhover_png);
		type.set ("img/Menu/HelpButtonHover.png", AssetType.IMAGE);
		
		className.set ("img/Menu/HelpScreen.png", __ASSET__img_menu_helpscreen_png);
		type.set ("img/Menu/HelpScreen.png", AssetType.IMAGE);
		
		className.set ("img/Menu/MenuBackground.png", __ASSET__img_menu_menubackground_png);
		type.set ("img/Menu/MenuBackground.png", AssetType.IMAGE);
		
		className.set ("img/Menu/PlayButton.png", __ASSET__img_menu_playbutton_png);
		type.set ("img/Menu/PlayButton.png", AssetType.IMAGE);
		
		className.set ("img/Menu/PlayButtonHover.png", __ASSET__img_menu_playbuttonhover_png);
		type.set ("img/Menu/PlayButtonHover.png", AssetType.IMAGE);
		
		className.set ("img/Menu/ShopButton.png", __ASSET__img_menu_shopbutton_png);
		type.set ("img/Menu/ShopButton.png", AssetType.IMAGE);
		
		className.set ("img/Menu/ShopButtonHover.png", __ASSET__img_menu_shopbuttonhover_png);
		type.set ("img/Menu/ShopButtonHover.png", AssetType.IMAGE);
		
		className.set ("img/Numbers/0.png", __ASSET__img_numbers_0_png);
		type.set ("img/Numbers/0.png", AssetType.IMAGE);
		
		className.set ("img/Numbers/1.png", __ASSET__img_numbers_1_png);
		type.set ("img/Numbers/1.png", AssetType.IMAGE);
		
		className.set ("img/Numbers/2.png", __ASSET__img_numbers_2_png);
		type.set ("img/Numbers/2.png", AssetType.IMAGE);
		
		className.set ("img/Numbers/3.png", __ASSET__img_numbers_3_png);
		type.set ("img/Numbers/3.png", AssetType.IMAGE);
		
		className.set ("img/Numbers/4.png", __ASSET__img_numbers_4_png);
		type.set ("img/Numbers/4.png", AssetType.IMAGE);
		
		className.set ("img/Numbers/5.png", __ASSET__img_numbers_5_png);
		type.set ("img/Numbers/5.png", AssetType.IMAGE);
		
		className.set ("img/Numbers/6.png", __ASSET__img_numbers_6_png);
		type.set ("img/Numbers/6.png", AssetType.IMAGE);
		
		className.set ("img/Numbers/7.png", __ASSET__img_numbers_7_png);
		type.set ("img/Numbers/7.png", AssetType.IMAGE);
		
		className.set ("img/Numbers/8.png", __ASSET__img_numbers_8_png);
		type.set ("img/Numbers/8.png", AssetType.IMAGE);
		
		className.set ("img/Numbers/9.png", __ASSET__img_numbers_9_png);
		type.set ("img/Numbers/9.png", AssetType.IMAGE);
		
		className.set ("img/Shop/upgradesBG.png", __ASSET__img_shop_upgradesbg_png);
		type.set ("img/Shop/upgradesBG.png", AssetType.IMAGE);
		
		className.set ("sound/coin.mp3", __ASSET__sound_coin_mp3);
		type.set ("sound/coin.mp3", AssetType.MUSIC);
		
		className.set ("sound/DarknessOfForever.mp3", __ASSET__sound_darknessofforever_mp3);
		type.set ("sound/DarknessOfForever.mp3", AssetType.MUSIC);
		
		className.set ("sound/death.mp3", __ASSET__sound_death_mp3);
		type.set ("sound/death.mp3", AssetType.MUSIC);
		
		className.set ("sound/power.mp3", __ASSET__sound_power_mp3);
		type.set ("sound/power.mp3", AssetType.MUSIC);
		
		className.set ("sound/slowmo.mp3", __ASSET__sound_slowmo_mp3);
		type.set ("sound/slowmo.mp3", AssetType.MUSIC);
		
		
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

@:keep @:bind #if display private #end class __ASSET__img_game_mode_classicmodebutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_game_mode_classicmodebuttonhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_game_mode_gamemodebackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_game_mode_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_game_mode_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_game_mode_rushmodebutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_game_mode_rushmodebuttonhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_game_mode_storm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_game_mode_stormhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_game_over_mainmenu_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_game_over_retry_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_in_game_coin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_in_game_enemy1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_in_game_enemy2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_in_game_enemy3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_in_game_explodingenemy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_in_game_gamebackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_in_game_invisenemy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_in_game_missileenemy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_in_game_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_in_game_sineenemy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_in_game_sizepu_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_in_game_slowmotionblur_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_in_game_sound_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_in_game_soundoff_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_creditsbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_creditsbuttonhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_creditsscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_gameoverbg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_helpbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_helpbuttonhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_helpscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_menubackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_playbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_playbuttonhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_shopbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_shopbuttonhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_numbers_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_numbers_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_numbers_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_numbers_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_numbers_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_numbers_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_numbers_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_numbers_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_numbers_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_numbers_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_shop_upgradesbg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__sound_coin_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__sound_darknessofforever_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__sound_death_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__sound_power_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__sound_slowmo_mp3 extends flash.media.Sound { }


#elseif html5
























































#else



#if (windows || mac || linux)


@:image("assets/img/Game Mode/ClassicModeButton.png") #if display private #end class __ASSET__img_game_mode_classicmodebutton_png extends lime.graphics.Image {}
@:image("assets/img/Game Mode/ClassicModeButtonHover.png") #if display private #end class __ASSET__img_game_mode_classicmodebuttonhover_png extends lime.graphics.Image {}
@:image("assets/img/Game Mode/GameModeBackground.png") #if display private #end class __ASSET__img_game_mode_gamemodebackground_png extends lime.graphics.Image {}
@:image("assets/img/Game Mode/Left.png") #if display private #end class __ASSET__img_game_mode_left_png extends lime.graphics.Image {}
@:image("assets/img/Game Mode/Right.png") #if display private #end class __ASSET__img_game_mode_right_png extends lime.graphics.Image {}
@:image("assets/img/Game Mode/RushModeButton.png") #if display private #end class __ASSET__img_game_mode_rushmodebutton_png extends lime.graphics.Image {}
@:image("assets/img/Game Mode/RushModeButtonHover.png") #if display private #end class __ASSET__img_game_mode_rushmodebuttonhover_png extends lime.graphics.Image {}
@:image("assets/img/Game Mode/Storm.png") #if display private #end class __ASSET__img_game_mode_storm_png extends lime.graphics.Image {}
@:image("assets/img/Game Mode/StormHover.png") #if display private #end class __ASSET__img_game_mode_stormhover_png extends lime.graphics.Image {}
@:image("assets/img/Game Over/MainMenu.png") #if display private #end class __ASSET__img_game_over_mainmenu_png extends lime.graphics.Image {}
@:image("assets/img/Game Over/Retry.png") #if display private #end class __ASSET__img_game_over_retry_png extends lime.graphics.Image {}
@:image("assets/img/In-Game/Coin.png") #if display private #end class __ASSET__img_in_game_coin_png extends lime.graphics.Image {}
@:image("assets/img/In-Game/Enemy1.png") #if display private #end class __ASSET__img_in_game_enemy1_png extends lime.graphics.Image {}
@:image("assets/img/In-Game/Enemy2.png") #if display private #end class __ASSET__img_in_game_enemy2_png extends lime.graphics.Image {}
@:image("assets/img/In-Game/Enemy3.png") #if display private #end class __ASSET__img_in_game_enemy3_png extends lime.graphics.Image {}
@:image("assets/img/In-Game/ExplodingEnemy.png") #if display private #end class __ASSET__img_in_game_explodingenemy_png extends lime.graphics.Image {}
@:image("assets/img/In-Game/GameBackground.png") #if display private #end class __ASSET__img_in_game_gamebackground_png extends lime.graphics.Image {}
@:image("assets/img/In-Game/InvisEnemy.png") #if display private #end class __ASSET__img_in_game_invisenemy_png extends lime.graphics.Image {}
@:image("assets/img/In-Game/MissileEnemy.png") #if display private #end class __ASSET__img_in_game_missileenemy_png extends lime.graphics.Image {}
@:image("assets/img/In-Game/Player.png") #if display private #end class __ASSET__img_in_game_player_png extends lime.graphics.Image {}
@:image("assets/img/In-Game/SineEnemy.png") #if display private #end class __ASSET__img_in_game_sineenemy_png extends lime.graphics.Image {}
@:image("assets/img/In-Game/SizePU.png") #if display private #end class __ASSET__img_in_game_sizepu_png extends lime.graphics.Image {}
@:image("assets/img/In-Game/SlowMotionBlur.png") #if display private #end class __ASSET__img_in_game_slowmotionblur_png extends lime.graphics.Image {}
@:image("assets/img/In-Game/Sound.png") #if display private #end class __ASSET__img_in_game_sound_png extends lime.graphics.Image {}
@:image("assets/img/In-Game/SoundOff.png") #if display private #end class __ASSET__img_in_game_soundoff_png extends lime.graphics.Image {}
@:image("assets/img/Menu/CreditsButton.png") #if display private #end class __ASSET__img_menu_creditsbutton_png extends lime.graphics.Image {}
@:image("assets/img/Menu/CreditsButtonHover.png") #if display private #end class __ASSET__img_menu_creditsbuttonhover_png extends lime.graphics.Image {}
@:image("assets/img/Menu/CreditsScreen.png") #if display private #end class __ASSET__img_menu_creditsscreen_png extends lime.graphics.Image {}
@:image("assets/img/Menu/GameOverBG.png") #if display private #end class __ASSET__img_menu_gameoverbg_png extends lime.graphics.Image {}
@:image("assets/img/Menu/HelpButton.png") #if display private #end class __ASSET__img_menu_helpbutton_png extends lime.graphics.Image {}
@:image("assets/img/Menu/HelpButtonHover.png") #if display private #end class __ASSET__img_menu_helpbuttonhover_png extends lime.graphics.Image {}
@:image("assets/img/Menu/HelpScreen.png") #if display private #end class __ASSET__img_menu_helpscreen_png extends lime.graphics.Image {}
@:image("assets/img/Menu/MenuBackground.png") #if display private #end class __ASSET__img_menu_menubackground_png extends lime.graphics.Image {}
@:image("assets/img/Menu/PlayButton.png") #if display private #end class __ASSET__img_menu_playbutton_png extends lime.graphics.Image {}
@:image("assets/img/Menu/PlayButtonHover.png") #if display private #end class __ASSET__img_menu_playbuttonhover_png extends lime.graphics.Image {}
@:image("assets/img/Menu/ShopButton.png") #if display private #end class __ASSET__img_menu_shopbutton_png extends lime.graphics.Image {}
@:image("assets/img/Menu/ShopButtonHover.png") #if display private #end class __ASSET__img_menu_shopbuttonhover_png extends lime.graphics.Image {}
@:image("assets/img/Numbers/0.png") #if display private #end class __ASSET__img_numbers_0_png extends lime.graphics.Image {}
@:image("assets/img/Numbers/1.png") #if display private #end class __ASSET__img_numbers_1_png extends lime.graphics.Image {}
@:image("assets/img/Numbers/2.png") #if display private #end class __ASSET__img_numbers_2_png extends lime.graphics.Image {}
@:image("assets/img/Numbers/3.png") #if display private #end class __ASSET__img_numbers_3_png extends lime.graphics.Image {}
@:image("assets/img/Numbers/4.png") #if display private #end class __ASSET__img_numbers_4_png extends lime.graphics.Image {}
@:image("assets/img/Numbers/5.png") #if display private #end class __ASSET__img_numbers_5_png extends lime.graphics.Image {}
@:image("assets/img/Numbers/6.png") #if display private #end class __ASSET__img_numbers_6_png extends lime.graphics.Image {}
@:image("assets/img/Numbers/7.png") #if display private #end class __ASSET__img_numbers_7_png extends lime.graphics.Image {}
@:image("assets/img/Numbers/8.png") #if display private #end class __ASSET__img_numbers_8_png extends lime.graphics.Image {}
@:image("assets/img/Numbers/9.png") #if display private #end class __ASSET__img_numbers_9_png extends lime.graphics.Image {}
@:image("assets/img/Shop/upgradesBG.png") #if display private #end class __ASSET__img_shop_upgradesbg_png extends lime.graphics.Image {}
@:file("assets/sound/coin.mp3") #if display private #end class __ASSET__sound_coin_mp3 extends lime.utils.ByteArray {}
@:file("assets/sound/DarknessOfForever.mp3") #if display private #end class __ASSET__sound_darknessofforever_mp3 extends lime.utils.ByteArray {}
@:file("assets/sound/death.mp3") #if display private #end class __ASSET__sound_death_mp3 extends lime.utils.ByteArray {}
@:file("assets/sound/power.mp3") #if display private #end class __ASSET__sound_power_mp3 extends lime.utils.ByteArray {}
@:file("assets/sound/slowmo.mp3") #if display private #end class __ASSET__sound_slowmo_mp3 extends lime.utils.ByteArray {}



#end

#if openfl

#end

#end
#end

