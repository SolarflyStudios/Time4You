package kalakuh.time4you.game;

import openfl.display.Sprite;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.Event;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Kalakuh
 */
class Counter extends Sprite {
	private var number0 : BitmapData;
	private var number1 : BitmapData;
	private var number2 : BitmapData;
	private var number3 : BitmapData;
	private var number4 : BitmapData;
	private var number5 : BitmapData;
	private var number6 : BitmapData;
	private var number7 : BitmapData;
	private var number8 : BitmapData;
	private var number9 : BitmapData;
	
	private var numbers : Array<Bitmap>;
	private var numberContainer : Sprite;
	
	private var targetAlpha : Float = 1;
	
	private var value : Float;
	
	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init (e : Event) : Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		number0 = Assets.getBitmapData("img/Numbers/0.png");
		number1 = Assets.getBitmapData("img/Numbers/1.png");
		number2 = Assets.getBitmapData("img/Numbers/2.png");
		number3 = Assets.getBitmapData("img/Numbers/3.png");
		number4 = Assets.getBitmapData("img/Numbers/4.png");
		number5 = Assets.getBitmapData("img/Numbers/5.png");
		number6 = Assets.getBitmapData("img/Numbers/6.png");
		number7 = Assets.getBitmapData("img/Numbers/7.png");
		number8 = Assets.getBitmapData("img/Numbers/8.png");
		number9 = Assets.getBitmapData("img/Numbers/9.png");
		
		numbers = new Array();
		
		numberContainer = new Sprite();
		addChild(numberContainer);
		numberContainer.x = 320 - numberContainer.width / 2;
		numberContainer.y = 25;
		
		addEventListener(Event.ENTER_FRAME, updateAlpha);
	}
	
	public function addScore (amount : Float) : Void {
		value += amount;
		update();
	}
	
	private function update () : Void {
		// add numbers
		var intValue : UInt = Std.int(value);
		if (numbers.length < (intValue + "").length) {
			for (i in (numbers.length)...((intValue + "").length)) {
				var bmp : Bitmap;
				switch (Std.parseInt((intValue + "").charAt(i - 1))) {
					case 0:
						bmp = new Bitmap(number0);
					case 1:
						bmp = new Bitmap(number1);
					case 2:
						bmp = new Bitmap(number2);
					case 3:
						bmp = new Bitmap(number3);
					case 4:
						bmp = new Bitmap(number4);
					case 5:
						bmp = new Bitmap(number5);
					case 6:
						bmp = new Bitmap(number6);
					case 7:
						bmp = new Bitmap(number7);
					case 8:
						bmp = new Bitmap(number8);
					case 9:
						bmp = new Bitmap(number9);
					default:
						bmp = new Bitmap(number0);
				}
				numberContainer.addChild(bmp);
				bmp.x = 34 * i - (bmp.width / 2) + (34 / 2);
				numbers.push(bmp);
				
				numberContainer.x = 320 - numberContainer.width / 2;
			}
		} else if (numbers.length > (intValue + "").length) {
			numberContainer.removeChild(numbers.pop());
		}
		
		// update numbers
		for (n in (0...numbers.length)) {
			switch (Std.parseInt((intValue + "").charAt(n))) {
				case 0:
					numbers[n].bitmapData = number0;
				case 1:
					numbers[n].bitmapData = number1;
				case 2:
					numbers[n].bitmapData = number2;
				case 3:
					numbers[n].bitmapData = number3;
				case 4:
					numbers[n].bitmapData = number4;
				case 5:
					numbers[n].bitmapData = number5;
				case 6:
					numbers[n].bitmapData = number6;
				case 7:
					numbers[n].bitmapData = number7;
				case 8:
					numbers[n].bitmapData = number8;
				case 9:
					numbers[n].bitmapData = number9;
				default:
					numbers[n].bitmapData = number0;
			}
			numbers[n].x = (34 * n) - (numbers[n].width / 2) + (34 / 2);
		}
	}
	
	private function updateAlpha (e : Event) : Void {
		alpha += (targetAlpha - alpha) / 40;
	}
	
	public function getHitbox () : Rectangle {
		return new Rectangle((stage.stageWidth / 2) - (34 * numbers.length / 2), 25, 34 * numbers.length, 39);
	}
	
	public function setTargetAlpha (f : Float) : Void {
		targetAlpha = f;
	}
	
	public function reset () : Void {
		for (bmp in numbers) {
			numberContainer.removeChild(bmp);
			bmp = null;
		}
		numbers.splice(0, numbers.length);
		
		value = 0;
		update();
	}
	
	public function getValue () : Float {
		return value;
	}
	
	public function setValue (n : Float) : Void {
		value = n;
		update();
	}
}