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
		
		menu.customItems = [secret, solarfly, copyright];
		
		return menu;
	}
	
	private static function onClick (e : ContextMenuEvent) : Void {
		trace("Wow! Much secret! Very easter egg!");
	}
}