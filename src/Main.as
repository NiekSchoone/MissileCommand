package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	
	
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class Main extends Sprite 
	{
		private var game  : Game = new Game();
		private var menu  : Menu = new Menu();
		private var music : Sound = new BackgroundMusic();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			addChild(menu);
			menu.addEventListener("startgame", start);
			
			music.play(0, 99999);
		}
		
		private function start(e:Event):void
		{
			menu.visible = false;
			addChild(game);
		}
		
	}
	
}