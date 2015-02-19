package kalakuh.time4you.game;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.GradientType;
import openfl.geom.Matrix;
import openfl.filters.GlowFilter;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Kalakuh
 */
class StaminaBar extends Sprite
{
	private static inline var MAX_STAMINA : Int = 200;
	private var stamina : Int = MAX_STAMINA;
	private var bar : Sprite;
	private var mat : Matrix;
	private var targetAlpha : Float = 1;
	
	private var increaseRepeats : UInt = 0;
	
	public function new() 
	{
		super();
		
		bar = new Sprite();
		addChild(bar);
		bar.filters = [new GlowFilter(0x000000, 1, 8, 8, 3)];
		
		mat = new Matrix();
		mat.createGradientBox(640, 480, 90 * Math.PI / 180);
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	public function reset () : Void {
		stamina = MAX_STAMINA;
		increaseRepeats = 0;
	}
	
	private function update (e : Event) : Void {
		if (stage != null) {
			bar.graphics.clear();
			
			// background
			bar.graphics.beginFill(0x000000);
			bar.graphics.drawRoundRect(28, 28, 24, stage.stageHeight - 56, 24, 24);
			bar.graphics.endFill();
			
			bar.graphics.beginFill(0x669999);
			bar.graphics.drawRoundRect(30, 30, 20, stage.stageHeight - 60, 20, 20);
			bar.graphics.endFill();
			
			// gradient
			bar.graphics.beginGradientFill(GradientType.LINEAR, [0xFFEE00, 0xE68A00], [1, 1], [0, 0xFF], mat);
			bar.graphics.drawRoundRect(30, 30 + (stage.stageHeight - 60 - (stage.stageHeight - 60) * stamina / MAX_STAMINA), 20, (stage.stageHeight - 60) * stamina / MAX_STAMINA, 20, 20);
			bar.graphics.endFill();
			
			// alpha
			alpha += (targetAlpha - alpha) / 20;
			
			if (increaseRepeats > 0) {
				increaseRepeats--;
				setStamina(getStamina() + 1);
			}
		}
	}
	
	public function increase (u : UInt) : Void {
		increaseRepeats = u;
	}
	
	public function getStamina () : Int {
		return stamina;
	}
	
	public function setStamina (s : Int) : Void {
		stamina = cast Math.max(Math.min(s, MAX_STAMINA), 0);
	}
	
	public function getHitbox () : Rectangle {
		return new Rectangle(30, 30, 24, stage.stageHeight - 56);
	}
	
	public function setTargetAlpha (a : Float) : Void {
		targetAlpha = a;
	}
}