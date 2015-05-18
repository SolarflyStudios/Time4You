package kalakuh.time4you.gui;
	
import flash.ui.ContextMenu;
import flash.ui.ContextMenuItem;
import openfl.events.ContextMenuEvent;

	/**
	 * ...
	 * @author Kalakuh
	 */
class GameContextMenu {
	public function new () {
		
	}
	
	public static function getContextMenu () : ContextMenu {
		var menu : ContextMenu = new ContextMenu();
		menu.hideBuiltInItems();
		
		var secret : ContextMenuItem = new ContextMenuItem("DO NOT CLICK ME!");
		secret.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, onClick);
		var solarfly : ContextMenuItem = new ContextMenuItem("Made by Solarfly Studios", true, false);
		var copyright : ContextMenuItem = new ContextMenuItem("Copyright - 2015", false, false);
		
		menu.customItems = [solarfly, copyright, secret];
		
		return menu;
	}
	
	private static function onClick (e : ContextMenuEvent) : Void {
		var arr : Array<String> = ["The cake is a lie", "Herobrine was here", "Beam me up, Scotty", "std::cout<<\"Hello, World!\"<<std::endl;", "<insert a cool message here>", "Such game, very wow", "The princess is in another castle", "You shall not pass", "Elmo knows where you live", "This is a randomly chosen message", "sin(a) = cos(90 - a)", "Luke, I'm your father"];
		cast(e.target, ContextMenuItem).caption = arr[Std.int(Math.random() * arr.length)];
	}
}