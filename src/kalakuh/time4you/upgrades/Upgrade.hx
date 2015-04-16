package kalakuh.time4you.upgrades;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.Event;
import openfl.Assets;
import openfl.text.Font;

/**
 * ...
 * @author Kalakuh
 */
class Upgrade extends Sprite
{
	private var bar : Bitmap;
	private var text : Bitmap;
	private var grayBar : Bitmap;
	private var type : EUpgrade;
	private var prices : Array<UInt>;
	private var priceDisplay : Bitmap;
	private var font : Font;
	
	public function new(bar : BitmapData, text : BitmapData, textY : Float, type : EUpgrade, prices : Array<UInt>) 
	{
		super();
		
		this.prices = prices;
		this.bar = new Bitmap(bar);
		this.text = new Bitmap(text);
		this.text.y = textY;
		this.type = type;
		
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init (e : Event) : Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		text.x = stage.stageWidth / 2 + 20;
		
		grayBar = new Bitmap(Assets.getBitmapData("img/Shop/GrayBar.png"));
		grayBar.y = 35;
		grayBar.x = stage.stageWidth - 30;
		
		priceDisplay = new Bitmap(Assets.getBitmapData("img/Shop/PriceButton.png"));
		priceDisplay.x = stage.stageWidth - priceDisplay.width - 25;
		priceDisplay.y = 95;
		
		addChild(bar);
		addChild(text);
		addChild(grayBar);
		addChild(priceDisplay);
	}
}