package Entities 
{
	import flash.events.*;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class Car extends Entity
	{
		
		private var car : MovieClip;
		
		private var direction : int = 0;
		
		override internal function spawnEntity():void
		{
			car = new sSquare();
			
			car.y = stage.stageHeight;
			
			addChild(car)
		}
		
		override internal function initEntity():void
		{
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		protected function update(e:Event):void
		{
			if (car.x >= stage.stageWidth)
			{
				direction = -1;
			}
			
			else if (car.x <= stage.stageWidth - stage.stageWidth)
			{
				direction = +1;
			}
			
			car.x += 7 * direction;
			
		}
		
	}

}