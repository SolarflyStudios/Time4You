package kalakuh.time4you.upgrades;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.Event;
import openfl.Assets;
import openfl.media.Sound;
import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.text.AntiAliasType;
import openfl.events.MouseEvent;
import openfl.geom.Rectangle;

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
	private var priceText : TextField;
	private var upgradeSound : Sound;
	
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
		
		upgradeSound = Assets.getSound("sound/purchase.mp3");
		
		grayBar = new Bitmap(Assets.getBitmapData("img/Shop/GrayBar.png"));
		grayBar.y = 35;
		grayBar.x = stage.stageWidth - 30;
		
		priceDisplay = new Bitmap(Assets.getBitmapData("img/Shop/PriceButton.png"));
		priceDisplay.x = stage.stageWidth - priceDisplay.width - 25;
		priceDisplay.y = 95;
		
		font = Assets.getFont("font/Nebula.ttf");
		priceText = new TextField();
		priceText.x = priceDisplay.x + priceDisplay.width / 2;
		priceText.y = priceDisplay.y;
		priceText.width = priceDisplay.width / 2;
		priceText.height = priceDisplay.height;
		priceText.antiAliasType = AntiAliasType.ADVANCED;
		priceText.embedFonts = true;
		var format : TextFormat = new TextFormat(font.fontName, 40, 0x000000, false, false, false, null, null, TextFormatAlign.CENTER);
		priceText.defaultTextFormat = format;
		priceText.text = (Saving.getUpgradeLevel(type) == 10 ? "-" : "" + prices[Saving.getUpgradeLevel(type)]);
		priceText.selectable = false;
		
		addChild(bar);
		addChild(text);
		addChild(grayBar);
		addChild(priceDisplay);
		addChild(priceText);
	}
	
	public function purchase () : Void {
		if (Saving.getCoins() >= prices[Saving.getUpgradeLevel(type)] && priceText.text != "-") {
			trace("UPGRADE!");
			upgradeSound.play();
			Saving.setCoins(Saving.getCoins() - prices[Saving.getUpgradeLevel(type)]);
			Saving.setUpgradeLevel(type, Saving.getUpgradeLevel(type) + 1); 
			priceText.text = (Saving.getUpgradeLevel(type) == 10 ? "-" : "" + prices[Saving.getUpgradeLevel(type)]);
		}
	}
}