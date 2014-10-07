package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Vector3D;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class Game extends MovieClip
	{
		//private var backGround : sSwatsica = new sSwatsica;
		
		//Towers
		private var towerArray : Vector.<TowerClass> = new Vector.<TowerClass>;
		private var towerAmount : int = 3;
		
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
			
			//New missile array
			missileArray = [];
			
			//New tower array
			//towerArray = [];
			
			for (var t : int = 0; t < towerAmount; t++)
			{
				towerArray.push(new TowerClass());
				addChild(towerArray[t]);
				towerArray[t].x = stage.stageWidth / towerAmount * t + towerArray[t].width + 35;
				towerArray[t].y = stage.stageHeight;
				
			}
			
			//Missile spawn timer
			missileTimer = new Timer(Math.random()*1000);
			missileTimer.addEventListener(TimerEvent.TIMER, missileSpawner);
			missileTimer.start();
			
		}
		
		private function missileSpawner (e:TimerEvent):void
		{
			if (towerArray.length == 0) return;
			
			var spawnPos : Vector3D = new Vector3D (Math.random() * stage.stageWidth, -10);
			
			var randomIndex : int = Math.random() * towerArray.length;
			
			var target : TowerClass = towerArray[randomIndex];
			
			var targetPos : Vector3D = new Vector3D (target.x, target.y);
			
			missileTimer.delay = Math.random() * 1500 + 500;
			
			//Spawnig the missiles
			var newMissile:MissileWeapon = new MissileWeapon();
			
			newMissile.x = spawnPos.x; 
			newMissile.y = spawnPos.y;
			
			newMissile.setTarget(targetPos);
			
			missileArray.push(newMissile);
			addChild(newMissile);
			
		}
		
		
		private function update(e:Event):void
		{
			//Update missiles
			var l : int = missileArray.length;
			for (var i : int = 0 ; i < l ; i++ )
			{
				missileArray[i].update();
			}
			
			for (var i:int = missileArray.length - 1; i >= 0 ; i--)
			{
				for (var towerIndex:int = towerArray.length - 1; towerIndex >= 0; towerIndex--)
				{
					if (missileArray[i].hitTestObject(towerArray[towerIndex]))
					{
						removeChild(missileArray[i]);
						
						removeChild(towerArray[towerIndex]);
						
						missileArray.splice(i,1);
						
						towerArray.splice(towerIndex, 1);
						
						break;
					}
				}
			}
		
			
		}
		
	}
	
}