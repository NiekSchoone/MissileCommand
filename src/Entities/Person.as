package Entities 
{
	import flash.events.*;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class Person extends Entity
	{
		
		private var person : MovieClip;
		
		override internal function spawnEntity():void
		{
			person = new sSquare();
			
			addChild(person)
		}
		
		override internal function initEntity():void
		{
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		protected function update(e:Event):void
		{
			
		}
		
		protected function fire(event:MouseEvent):void
		{
			weapon.fire(HeroWeapon.CANNON, stage, x, y - 25);
			event.updateAfterEvent(); // process this event first }
		}
		
	}

}