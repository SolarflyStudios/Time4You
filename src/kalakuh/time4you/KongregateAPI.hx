package kalakuh.time4you;

/**
 * ...
 * @author Kalakuh
 */
import flash.net.URLRequest;
import flash.display.Loader;
import flash.events.Event;
import flash.Lib;
import kalakuh.time4you.game.EGameMode;
 
class KongregateAPI
{
    var kongregate : Dynamic;

    public function new()
    {	
        kongregate = null;
            
        var parameters = flash.Lib.current.loaderInfo.parameters;
        var url: String;
        url = parameters.api_path;
        
        if (url == null)
			url = "http://www.kongregate.com/flash/API_AS3_Local.swf";
        
        var request : URLRequest = new URLRequest(url);          
        
        var loader = new Loader();
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, OnLoadComplete);
        loader.load(request);

        Lib.current.addChild(loader);
    }

    function OnLoadComplete(e : Event) : Void {
        try {
            kongregate = e.target.content;
            kongregate.services.connect();
        } catch (msg : Dynamic)  {
            kongregate = null;
        }
    }
	
    public function submitScore (score : Int, gamemode : EGameMode) {
        if (kongregate != null) {
			if (gamemode == EGameMode.Classic) {
				kongregate.stats.submit("HighscoreNormal", score);
			} else if (gamemode == EGameMode.Rush) {
				kongregate.stats.submit("HighscoreRush", score);
			}
        }
    }
}