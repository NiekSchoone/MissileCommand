package Towers
{
	import flash.display.Sprite;
	import flash.events.*;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class Tower extends Sprite
	{
		
		// algemene method om het schip op een x en y te zetten
		internal function setLocation(xLocation:int, yLocation:int):void
		{
			x = xLocation;
			y = yLocation;
		}
		
		// ABSTRACT Method (deze wordt overschreven in een subclass)
		internal function spawnTower():void
		{
			
		}
		
		// ABSTRACT Method (deze wordt overschreven in een subclass)
		internal function initTower():void
		{
			
		}
		
	}

}