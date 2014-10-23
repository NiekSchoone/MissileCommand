package  
{
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class EnemyMissileFactory extends MissileWeapon
	{
		public static const ENEMY_MISSILE : uint = 0;
		
		public function PlayerMissileFactory(missileWeaponType:uint) 
		{
			switch(missileWeaponType)
				case ENEMY_MISSILE:
				trace("Creating new missile for the enemy");
				return new MissileWeapon();
				break;
			default:
				throw new Error("Invalid kind of missile specified");
				return null;
			
		}
	}

}