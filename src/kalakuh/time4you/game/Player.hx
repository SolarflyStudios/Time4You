package kalakuh.time4you.game;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Kalakuh
 */
class Player extends Sprite
{
	private var player : Bitmap;
	private var xVel : Float = 0;
	private var yVel : Float = 0;
	private var alive : Bool = false;
	
	private var invincible : UInt = 0;
	
	private var shrinkCounter : UInt = 0;
	private var targetScale : Float = 1;
	
	public function new() 
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init (e : Event) : Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		player = new Bitmap(Assets.getBitmapData("img/In-Game/Player.png"));
		player.x = -player.width / 2;
		player.y = -player.height / 2;
		addChild(player);
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	public function addSpeed (x : Float, y : Float) : Void {
		xVel += x;
		yVel += y;
	}
	
	public function getSpeed () : Float{
		return Math.sqrt(xVel * xVel + yVel * yVel);
	}
	
	public function resetSpeed () : Void {
		xVel = 0;
		yVel = 0;
	}
	
	public function shrink () : Void {
		targetScale = 0.5;
		shrinkCounter = 300;
	}
	
	public function isInvincible () : Bool {
		return 0 < invincible;
	}
	
	private function update (e : Event) : Void {
		if (alive) {
			if (invincible > 0) {
				invincible--;
				if (invincible > 60) {
					alpha = 0.5;
				} else {
					if (invincible > 45 || (invincible <= 30 && invincible > 15)) {
						alpha = 0.5;
					} else {
						alpha = 0.75;
					}
				}
			} else {
				alpha = 1;
			}
			
			
			if (shrinkCounter > 0) {
				shrinkCounter--;
			} else {
				targetScale = 1;
			}
			player.scaleX += (targetScale - player.scaleX) / 10.0;
			player.scaleY += (targetScale - player.scaleY) / 10.0;
			player.x = -player.width / 2.0;
			player.y = -player.height / 2.0;
			
			x += xVel;
			y += yVel;
			xVel *= 0.96;
			yVel *= 0.96;
			
			if (x < width / 2) {
				x = width / 2;
				xVel = -xVel;
			} else if (x > stage.stageWidth - (width / 2)) {
				x = stage.stageWidth - (width / 2);
				xVel = -xVel;
			}
			
			if (y < height / 2) {
				y = height / 2;
				yVel = -yVel;
			} else if (y > stage.stageHeight - (height / 2)) {
				y = stage.stageHeight - (height / 2);
				yVel = -yVel;
			}
			
			if (Math.abs(xVel) < 0.2) {
				xVel = 0;
			}
			
			if (Math.abs(yVel) < 0.2) {
				yVel = 0;
			}
		}
	}
	
	public function beInvincible () : Void {
		invincible = 300;
	}
	
	public function getPlayer () : Bitmap {
		return player;
	}
	
	public function getHitbox () : Rectangle {
		return new Rectangle(x - width / 3, y - height / 3, width * 2 / 3, height * 2 / 3);
	}
	
	public function setAlive (b : Bool) : Void {
		alive = b;
	}
}