package  
{
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class PlayerMissileFactory extends MissileWeapon
	{
		public static const PLAYER_MISSILE : uint = 0;
		
		public function PlayerMissileFactory(missileWeaponType:uint) 
		{
			switch(missileWeaponType)
				case PLAYER_MISSILE:
				trace("Creating new missile for the player");
				return new MissileWeapon();
				break;
			default:
				throw new Error("Invalid kind of missile specified");
				return null;
			
		}
	}

}