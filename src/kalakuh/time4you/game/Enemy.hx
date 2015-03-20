package kalakuh.time4you.game;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.Event;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Kalakuh
 */
class Enemy extends Sprite
{
	private var enemy : Bitmap;
	private var speed : Float;
	private var type : EEnemy;
	
	private var xVel : Float = 0; // missile
	private var yVel : Float = 0; // missile
	
	private var lifetime : Float; // hex
	private var canExplode : Bool = true; // hex
	private var deadly : Bool = true;
	
	private var a : Float = 0; // for ghost & sine wave
	private var originalPos : Float; // sine wave
	
	public function new(type : EEnemy, custom : Bool = false, x : Float = 0, y : Float = 0, rotation : Float = 0) 
	{
		super();
		switch (type) {
			case EEnemy.Triangle:
				enemy = new Bitmap(Assets.getBitmapData("img/In-Game/Enemy1.png"));
				speed = 0.5;
			case EEnemy.Star:
				enemy = new Bitmap(Assets.getBitmapData("img/In-Game/Enemy2.png"));
				speed = 1.1;
			case EEnemy.Pentagon:
				enemy = new Bitmap(Assets.getBitmapData("img/In-Game/Enemy3.png"));
				speed = 1.5;
			case EEnemy.Missile:
				enemy = new Bitmap(Assets.getBitmapData("img/In-Game/MissileEnemy.png"));
				speed = 0.01;
			case EEnemy.Hexagon:
				enemy = new Bitmap(Assets.getBitmapData("img/In-Game/ExplodingEnemy.png"));
				speed = 0.85;
			case EEnemy.HexagonSmall:
				enemy = new Bitmap(Assets.getBitmapData("img/In-Game/ExplodingEnemy.png"));
				enemy.width /= 2;
				enemy.height /= 2;
				speed = 0.7;
			case EEnemy.Ghost:
				enemy = new Bitmap(Assets.getBitmapData("img/In-Game/InvisEnemy.png"));
				speed = 0.8;
			case EEnemy.Sine:
				enemy = new Bitmap(Assets.getBitmapData("img/In-Game/SineEnemy.png"));
				speed = 0.6;
			default:
				enemy = new Bitmap(Assets.getBitmapData("img/In-Game/Enemy1.png"));
				speed = 0.5;
		}
		this.type = type;
		if (custom) {
			addChild(enemy);
			enemy.x = -enemy.width / 2;
			enemy.y = -enemy.height / 2;
			this.rotation = rotation;
			this.x = x;
			this.y = y;
		} else {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}
	
	private function init (e : Event) : Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		enemy.x = -enemy.width / 2;
		enemy.y = -enemy.height / 2;
		addChild(enemy);
		
		switch (Math.floor(Math.random() * 4)) {
			case 0:
				x = -width / 2;
				y = Math.random() * stage.stageHeight;
				rotation = 90;
				if (type == EEnemy.Hexagon) lifetime = 640 * Math.random();
				if (type == EEnemy.Sine) originalPos = y;
			case 1:
				x = stage.stageWidth + (width / 2);
				y = Math.random() * stage.stageHeight;
				rotation = -90;
				if (type == EEnemy.Hexagon) lifetime = 640 * Math.random();
				if (type == EEnemy.Sine) originalPos = y;
			case 2:
				x = Math.random() * stage.stageWidth;
				y = -height / 2;
				rotation = 180;
				if (type == EEnemy.Hexagon) lifetime = 480 * Math.random();
				if (type == EEnemy.Sine) originalPos = x;
			case 3:
				x = Math.random() * stage.stageWidth;
				y = stage.stageHeight + (height / 2);
				rotation = 0;
				if (type == EEnemy.Hexagon) lifetime = 480 * Math.random();
				if (type == EEnemy.Sine) originalPos = x;
		}
	}
	
	public function isDeadly () : Bool {
		return deadly;
	}
	
	public function getExplode () {
		return canExplode;
	}
	
	public function setExplode (b : Bool) {
		canExplode = b;
	}
	
	public function getType () : EEnemy {
		return type;
	}
	
	public function getLifetime () : Float {
		return lifetime;
	}
	 
	public function update (pSpeed : Float, player : Player) : Void {
		if (type != EEnemy.Missile) {
			if (type == EEnemy.Ghost) {
				a += pSpeed / 5;
				alpha = 0.10 + (Math.abs(Math.cos(a * Math.PI / 180)) / 2);
			} else if (type == EEnemy.Sine) {
				a += pSpeed;
			}
			if (type == EEnemy.Hexagon) {
				if (lifetime < 0) {
					alpha -= 0.005 * pSpeed;
					deadly = false;
				} else {
					lifetime -= speed * pSpeed;
					x -= pSpeed * speed * Math.cos((rotation + 90) * Math.PI / 180);
					y -= pSpeed * speed * Math.sin((rotation + 90) * Math.PI / 180);
				}
			} else {
				x -= pSpeed * speed * Math.cos((rotation + 90) * Math.PI / 180);
				y -= pSpeed * speed * Math.sin((rotation + 90) * Math.PI / 180);
				if (type == EEnemy.Sine) {
					if ((rotation + 180) % 180 == 90) { // move in y
						y = originalPos + (60 * Math.sin(a * Math.PI / 180));
					} else { // move in x
						x = originalPos + (60 * Math.sin(a * Math.PI / 180));
					}
				}
			}
		} else {
			var angle : Float = Math.atan2((y - player.y), (x - player.x));
			xVel -= Math.cos(angle) * pSpeed * speed;
			yVel -= Math.sin(angle) * pSpeed * speed;
			x += xVel * pSpeed;
			y += yVel * pSpeed;
			rotation = Math.atan2(yVel, xVel) * 180 / Math.PI + 90;
		}
	}
	
	public function getEnemy () : Bitmap {
		return enemy;
	}
	
	public function getHitbox () : Rectangle {
		if (type == EEnemy.Missile) return new Rectangle(x - width / 4.0, y - height / 4.0, width / 2.0, height / 2.0);
		return new Rectangle(x - width / 3.0, y - height / 3.0, width * 2.0 / 3.0, height * 2.0 / 3.0);
	}
}