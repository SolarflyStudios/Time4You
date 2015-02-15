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
	private var direction : UInt;
	private var speed : Float;
	
	public function new(type : EEnemy) 
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
			default:
				enemy = new Bitmap(Assets.getBitmapData("img/In-Game/Enemy1.png"));
				speed = 0.5;
		}
		
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init (e : Event) : Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		enemy.x = -enemy.width / 2;
		enemy.y = -enemy.height / 2;
		addChild(enemy);
		
		switch (Math.floor(Math.random() * 4)) {
			case 0:
				direction = 0;
				x = -width / 2;
				y = Math.random() * stage.stageHeight;
				rotation = 90;
			case 1:
				direction = 1;
				x = stage.stageWidth + (width / 2);
				y = Math.random() * stage.stageHeight;
				rotation = -90;
			case 2:
				direction = 2;
				x = Math.random() * stage.stageWidth;
				y = -height / 2;
				rotation = 180;
			case 3:
				direction = 3;
				x = Math.random() * stage.stageWidth;
				y = stage.stageHeight + (height / 2);
				rotation = 0;
		}
	}
	
	public function update (pSpeed : Float) : Void {
		switch (direction) {
			case 0:
				x += speed * pSpeed;
			case 1:
				x -= speed * pSpeed;
			case 2:
				y += speed * pSpeed;
			case 3:
				y -= speed * pSpeed;
		}
	}
	
	public function getEnemy () : Bitmap {
		return enemy;
	}
	
	public function getHitbox () : Rectangle {
		return new Rectangle(x - width / 3, y - height / 3, width * 2 / 3, height * 2 / 3);
	}
}