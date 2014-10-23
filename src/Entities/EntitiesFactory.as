package Entities
{
	import flash.display.Stage;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class EntitiesFactory 
	{
		public static const GUY : uint = 0;
		public static const CAR : uint = 0;
		
		public function addEntity(entityType:uint, target:Stage, xLocation:int, yLocation:int):Entity
		{
			var entity : Entity = this.createEntity(entityType);
			
			entity.spawnEntity();
			entity.setLocation(xLocation, yLocation);
			target.addChild(entity);
			entity.initEntity();
		}
		
		private function createEntity(entityType : uint):Entity
		{
			switch(entityType)
			{
				case CAR:
					trace("Creating new car");
					return new Car();
					break;
				case GUY:
					trace("Creating new person");
					return new Person();
					break;
				default:
					throw new Error("Invalid entity specified");
					return null;
			}
		}
		
	}

}