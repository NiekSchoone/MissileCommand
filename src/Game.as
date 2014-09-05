package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class Game extends MovieClip
	{
		private var backGround : sSwatsica = new sSwatsica;
		
		//Towers
		private var towerArray : Array;
		
		//Missile
		private var missileTimer : Timer;
		private var missileArray : Array;
		
		
		public function Game()
		{
			super();
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			addEventListener(Event.ENTER_FRAME, update);
			
			
			//New Missile Array
			missileArray = [];
			
			towerArray = [];
			
			addChild(backGround);
			backGround.x = stage.stageWidth / 2;
			backGround.y = stage.stageHeight / 2;
			
			//Missile Spawn Timer
			missileTimer = new Timer(Math.random()*1000);
			missileTimer.addEventListener(TimerEvent.TIMER, missileSpawner);
			missileTimer.start();
			
		}
		
		private function missileSpawner (e:TimerEvent):void
		{
			missileTimer.delay = Math.random() * 1500 + 500;
			
			//Spawnig the missiles
			missileArray.push(new MissileController());
			stage.addChild(missileArray[missileArray.length - 1]);
			missileArray[missileArray.length - 1].x = Math.random() * 600; 
			
		}
		
		private function update(e:Event):void
		{
			
			
			//update Missiles
			var l : int = missileArray.length;
			for (var i : int = 0 ; i < l ; i++ )
			{
				missileArray[i].update();
			}
			
		}
		
	}

}