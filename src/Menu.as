package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.StageDisplayState;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class Menu extends MovieClip
	{
		private var startButton : StartButton = new StartButton();
		private var fullScreenButton : FullScreenButton = new FullScreenButton();
		
		public function Menu() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//Starting "startMenu" function
			startMenu();
		}
		
		private function startMenu():void
		{
			//Adding and positioning startButton
			addChild(startButton);
			startButton.x = stage.stageWidth/2
			startButton.y = 200;
			
			//Adding and positioning fullscreenButton
			addChild(fullScreenButton);
			fullScreenButton.x = stage.stageWidth/2
			fullScreenButton.y = 400;
			
			var buttonHolder:MovieClip = new MovieClip();
			
			addChild(buttonHolder);
			buttonHolder.addChild(startButton);
			buttonHolder.addChild(fullScreenButton);
			buttonHolder.addEventListener(MouseEvent.CLICK, click);
		}
		
		private function click(e:MouseEvent):void
		{
			//Dispatching function if startbutton is clicked dispatch to "start" function in Main class
			if (e.target == startButton)
			{
				dispatchEvent(new Event("startgame"));
			}
			
			if (e.target == fullScreenButton)
			{
				stage.displayState = StageDisplayState.FULL_SCREEN;
			}
		}
		
	}

}