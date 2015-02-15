package kalakuh.time4you.gui;
	
import flash.ui.ContextMenu;
import flash.ui.ContextMenuItem;

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
		
		var infinite : ContextMenuItem = new ContextMenuItem("Director: InfiniteDrop", true, false);
		var kalakuh : ContextMenuItem = new ContextMenuItem("Programmer: Kalakuh", true, false);
		var haudio : ContextMenuItem = new ContextMenuItem("Graphics Designer: Haudio", true, false);
		var copyright : ContextMenuItem = new ContextMenuItem("Copyright - 2015", true, false);
		
		menu.customItems = [infinite, kalakuh, haudio, copyright];
		
		return menu;
	}
}