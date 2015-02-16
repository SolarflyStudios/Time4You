package kalakuh.time4you.game;

import kalakuh.time4you.gui.Screen;
import kalakuh.time4you.Main;
import kalakuh.time4you.gui.EScreen;
import openfl.events.Event;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.geom.Point;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.utils.Timer;
import openfl.events.TimerEvent;
import openfl.media.Sound;

/**
 * ...
 * @author Kalakuh
 */
 
class GameManager extends Screen
{
	private var background : Bitmap;
	
	private var player : Player;
	private var deathSound : Sound;
	
	private var score : Counter;
	private var rush : Counter;
	private var rushTimer : Timer;
	
	private var keysDown : Array<UInt> = new Array();
	
	private var pixelsMoved : Float = 0;
	
	private var enemySpawnCounter : Float = 400;
	private var enemies : Array<Enemy>;
	
	private var collectedCoins : UInt = 0;
	private var coin : Coin;
	private var oldCoin : Coin;
	
	private var stamina : StaminaBar;
	
	private var glow : SlowMotionGlow;
	
	private var gamemode : EGameMode = EGameMode.Classic;
	
	private var slowmoSound : Sound;
	private var coinSound : Sound;
	
	private var alive : Bool = false;
	
	public function new() 
	{
		super(0);
		
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init (e : Event) : Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		background = new Bitmap(Assets.getBitmapData("img/In-Game/GameBackground.png"));
		addChild(background);
		
		coin = new Coin();
		addChild(coin);
		
		score = new Counter();
		addChild(score);
		
		rush = new Counter();
		addChild(rush);
		rushTimer = new Timer(1000, 30);
		rushTimer.addEventListener(TimerEvent.TIMER, updateTimer);
		rushTimer.addEventListener(TimerEvent.TIMER_COMPLETE, timerComplete);
		
		enemies = new Array();
		
		player = new Player();
		addChild(player);
		
		deathSound = Assets.getSound("sound/death.mp3");
		slowmoSound = Assets.getSound("sound/slowmo.mp3");
		coinSound = Assets.getSound("sound/coin.mp3");
		
		stamina = new StaminaBar();
		addChild(stamina);
		
		glow = new SlowMotionGlow();
		addChild(glow);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}
	
	private function onKeyDown (e : KeyboardEvent) : Void {
		if (keysDown.indexOf(e.keyCode) == -1 && alive) {
			keysDown.push(e.keyCode);
			if (e.keyCode == Keyboard.SPACE) {
				if (stamina.getStamina() > 0 && pixelsMoved > 10) {
					slowmoSound.play();
				}
			}
		}
	}
	
	private function onKeyUp (e : KeyboardEvent) : Void {
		keysDown.remove(e.keyCode);
	}
	
	public function start (gm : EGameMode = null) : Void {
		score.reset();
		rush.reset();
		
		player.x = stage.stageWidth / 2;
		player.y = stage.stageHeight / 2;
		player.resetSpeed();
		
		alive = true;
		
		if (oldCoin != null) {
			removeChild(oldCoin);
			oldCoin = null;
		}
		
		if (gm != null) {
			if (gm == EGameMode.Classic) {
				rush.alpha = 0;
				rush.setTargetAlpha(0);
			} else {
				rush.alpha = 1;
				rush.setTargetAlpha(1);
			}
			
			if (gm == EGameMode.Rush) {
				rush.setValue(30);
				rushTimer.reset();
				rushTimer.start();
			}
			
			if (gm == EGameMode.Classic) {
				score.alpha = 1;
				score.setTargetAlpha(1);
			} else {
				score.alpha = 0;
				score.setTargetAlpha(0);
			}
			gamemode = gm;
		} else {
			if (gamemode == EGameMode.Rush) {
				rush.setValue(30);
				rushTimer.reset();
				rushTimer.start();
			}
		}
		
		coin.newPosition();
		
		stamina.reset();
		
		collectedCoins = 0;
		enemySpawnCounter = 400;
		pixelsMoved = 0;
		
		for (enemy in enemies) {
			removeChild(enemy);
			enemy = null;
		}
		enemies.splice(0, enemies.length);
		
		player.setAlive(true);
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function updateTimer (e : TimerEvent) : Void {
		rush.setValue(rush.getValue() - 1);
	}
	
	private function timerComplete (e : TimerEvent) : Void {
		if (alive) {
			super.setTargetAlpha(0);
			var main : Main = cast parent;
			main.gameOver(score.getValue(), gamemode);
			player.setAlive(false);
			alive = false;
			deathSound.play();
			removeEventListener(Event.ENTER_FRAME, update);
		}
	}
	
	private function update (e : Event) : Void {
		if (gamemode == EGameMode.Classic) {
			score.setTargetAlpha(1);
		} else {
			rush.setTargetAlpha(1);
		}
		
		stamina.setTargetAlpha(0.8);
		
		// update player's speed
		if (keysDown.indexOf(Keyboard.UP) != -1 || keysDown.indexOf(Keyboard.W) != -1) {
			player.addSpeed(0, -0.4);
		}
		if (keysDown.indexOf(Keyboard.DOWN) != -1 || keysDown.indexOf(Keyboard.S) != -1) {
			player.addSpeed(0, 0.4);
		}
		if (keysDown.indexOf(Keyboard.LEFT) != -1 || keysDown.indexOf(Keyboard.A) != -1) {
			player.addSpeed(-0.4, 0);
		}
		if (keysDown.indexOf(Keyboard.RIGHT) != -1 || keysDown.indexOf(Keyboard.D) != -1) {
			player.addSpeed(0.4, 0);
		}
		
		var pSpeed : Float = player.getSpeed();
		pixelsMoved += pSpeed;
		score.addScore(pSpeed * (1 + collectedCoins));
		
		// slow mo'
		var slowmo : Bool = false;
		if (keysDown.indexOf(Keyboard.SPACE) != -1) {
			if (stamina.getStamina() > 0) {
				if (pSpeed > 1) {
					slowmo = true;
					stamina.setStamina(stamina.getStamina() - 1);
				}
			}
		}
		
		if (slowmo) {
			glow.setTargetAlpha(1);
		} else {
			glow.setTargetAlpha(0);
		}
		
		// update enemy spawn counter & spawn enemies
		if (pixelsMoved >= enemySpawnCounter) {
			pixelsMoved %= enemySpawnCounter;
			enemySpawnCounter -= enemySpawnCounter / 40;
			
			var enemy : Enemy;
			if (score.getValue() < 7500) { 
				enemy = new Enemy(EEnemy.Triangle);
			} else if (score.getValue() < 25000) {
				enemy = new Enemy(Math.random() < 0.66 ? EEnemy.Triangle : EEnemy.Star);
			} else {
				enemy = new Enemy(Math.random() < 0.5 ? EEnemy.Triangle : Math.random() < 0.5 ? EEnemy.Pentagon : EEnemy.Star);
			}
			addChildAt(enemy, 1);
			enemies.push(enemy);
		}
		
		// update enemies
		var removed : UInt = 0;
		for (e in 0...enemies.length) {
			enemies[e - removed].update(pSpeed * (slowmo ? 0.5 : 1));
			if (enemies[e - removed].x < -50 || enemies[e - removed].y < -50 || enemies[e - removed].x > stage.stageWidth + 50 || enemies[e - removed].y > stage.stageHeight + 50) {
				removeChild(enemies[e - removed]);
				enemies.remove(enemies[e - removed]);
				removed++;
			}
		}
		
		// check collisions
			// enemies
		for (enemy in enemies) {
			if (enemy.getHitbox().intersects(player.getHitbox())) {
				super.setTargetAlpha(0);
				var main : Main = cast parent;
				main.gameOver(score.getValue(), gamemode);
				player.setAlive(false);
				alive = false;
				deathSound.play();
				rushTimer.stop();
				removeEventListener(Event.ENTER_FRAME, update);
			}
			if (gamemode == EGameMode.Classic && enemy.getHitbox().intersects(score.getHitbox())) {
				score.setTargetAlpha(0.5);
			} else if (gamemode == EGameMode.Rush && enemy.getHitbox().intersects(rush.getHitbox())) {
				rush.setTargetAlpha(0.5);
			}
			if (enemy.getHitbox().intersects(stamina.getHitbox())) {
				stamina.setTargetAlpha(0.5);
			}
		}
			// coin
		if (player.getHitbox().intersects(coin.getHitbox())) {
			collectedCoins++;
			
			if (oldCoin != null) removeChild(oldCoin);
			oldCoin = new Coin(coin.x, coin.y);
			oldCoin.setTargetAlpha(0);
			addChildAt(oldCoin, 1);
			
			coin.alpha = 0;
			coin.newPosition();
			
			stamina.increase(10);
			
			coinSound.play();
		}
		
		// score & timer
		if (gamemode == EGameMode.Classic) {
			if (coin.getHitbox().intersects(score.getHitbox())) {
				score.setTargetAlpha(0.5);
			}
			if (player.getHitbox().intersects(score.getHitbox())) {
				score.setTargetAlpha(0.5);
			}
		} else {
			if (coin.getHitbox().intersects(rush.getHitbox())) {
				rush.setTargetAlpha(0.5);
			}
			if (player.getHitbox().intersects(rush.getHitbox())) {
				rush.setTargetAlpha(0.5);
			}
		}
		
		// stamina
		if (coin.getHitbox().intersects(stamina.getHitbox())) {
			stamina.setTargetAlpha(0.5);
		}
		if (player.getHitbox().intersects(stamina.getHitbox())) {
			stamina.setTargetAlpha(0.5);
		}
	}
}