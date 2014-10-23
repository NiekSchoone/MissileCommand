package Towers
{
	import flash.display.Stage;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class TowerFactory 
	{
		public static const TOWER : uint = 0;
		
		public function addTower(towerType:uint, target:Stage, xLocation:int, yLocation:int):Tower
		{
			var tower : Tower = this.createTower(towerType);
			
			tower.spawnTower();
			tower.setLocation(xLocation, yLocation);
			target.addChild(tower);
			tower.initTower();
			return tower;
		}
		
		private function createTower(towerType : uint):Tower
		{
			switch(towerType)
			{
				case TOWER:
					trace("Creating new tower");
					return new playerTower();
					break;
				default:
					throw new Error("Invalid tower specified");
					return null;
			}
		}
	}

}