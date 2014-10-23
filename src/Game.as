package  
{
	import Entities.EntitiesFactory;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Vector3D;
	import flash.utils.Timer;
	import Towers.*;
	import Entities.*;
	
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class Game extends Sprite
	{
		
		//Towers
		private var towerArray 			: 	Vector.<playerTower> = new Vector.<playerTower>;
		private var towerAmount 		: 	uint = 3;
		
		//Missile
		private var missileTimer 		: 	Timer;
		private var enemyMissileArray 	: 	Array;
		
		private var playerMissileArray 	: 	Array;
		
		private var entitiesArray		:	Array;
		
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
			
			var towerFactory : TowerFactory = new TowerFactory();
			
			
			//New missile array
			enemyMissileArray 	= 	[];
			
			playerMissileArray 	= 	[];
			
			entitiesArray		=	[];
			
			//Spawning all the towers in from the factory
			for (var t : int = 0; t < towerAmount; t++)
			{
				var newTower = towerFactory.addTower(TowerFactory.TOWER, this.stage, stage.stageWidth / towerAmount * t + 125, stage.stageHeight);
				
				var towerVar	:	playerTower = new playerTower();
				towerVar.addEventListener("shoot", shoot);
				
				towerArray.push(newTower);
				addChild(newTower);
			}
			
			//Missile spawn timer
			missileTimer = new Timer(Math.random()*1000);
			missileTimer.addEventListener(TimerEvent.TIMER, enemyMissileSpawner);
			missileTimer.start();
			
		}
		
		private function addEntities():void
		{
			var entitiesFactory : EntitiesFactory = new EntitiesFactory();
			var newEntity = entitiesFactory.addEntity(EntitiesFactory.CAR, this.stage);
			addChild(newEntity);
		}
		
		private function enemyMissileSpawner(e:TimerEvent):void
		{
			if (towerArray.length == 0) return;
			
			var spawnPos : Vector3D = new Vector3D (Math.random() * stage.stageWidth, -10);
			
			var randomIndex : int = Math.random() * towerArray.length;
			
			var target : playerTower = towerArray[randomIndex];
			
			var targetPos : Vector3D = new Vector3D (target.x, target.y);
			
			missileTimer.delay = Math.random() * 1500 + 500;
			
			//Spawnig the missiles
			var newEnemyMissile : MissileWeapon = new MissileWeapon();
			
			newEnemyMissile.x = spawnPos.x; 
			newEnemyMissile.y = spawnPos.y;
			
			newEnemyMissile.setTarget(targetPos);
			
			enemyMissileArray.push(newEnemyMissile);
			addChild(newEnemyMissile);
			
		}
		
		private function shoot(e:Event):void
		{
			var newPlayerMissile : MissileWeapon = new MissileWeapon();
			
			playerMissileArray.push(newPlayerMissile);
			addChild(newPlayerMissile);
			
			trace("shotsfired");
		}
		
		private function update(e:Event):void
		{
			//Update missiles
			var l : int = enemyMissileArray.length;
			for (var i : int = 0 ; i < l ; i++ )
			{
				enemyMissileArray[i].update(e);
			}
			
			//Destroy tower when hit by missile
			for (var i:int = enemyMissileArray.length - 1; i >= 0 ; i--)
			{
				for (var towerIndex:int = towerArray.length - 1; towerIndex >= 0; towerIndex--)
				{
					if (enemyMissileArray[i].hitTestObject(towerArray[towerIndex]))
					{
						removeChild(enemyMissileArray[i]);
						
						removeChild(towerArray[towerIndex]);
						
						enemyMissileArray.splice(i,1);
						
						towerArray.splice(towerIndex, 1);
						
						break;
					}
				}
			}
		}
	}
}