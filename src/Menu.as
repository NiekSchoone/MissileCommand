package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class Menu extends MovieClip
	{
		private var startButton : sSquare = new sSquare;
		
		public function Menu() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			startMenu();
		}
		
		private function startMenu():void
		{
			addChild(startButton);
			startButton.x = stage.stageWidth/2 //<- change to size of button;
			startButton.y = 300;
			
			var buttonHolder:MovieClip = new MovieClip();
			
			addChild(buttonHolder);
			buttonHolder.addChild(startButton);
			buttonHolder.addEventListener(MouseEvent.CLICK, click);
		}
		
		private function click(e:MouseEvent):void
		{
			if (e.target == startButton)
			{
				dispatchEvent(new Event("startgame"));
			}
		}
		
	}

}