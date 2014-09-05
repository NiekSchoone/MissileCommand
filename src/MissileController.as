package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class MissileController extends MovieClip
	{
		private var missile : MovieClip;
		
		private var speed : Number = 1;
		
		public function MissileController() 
		{
			super();
			
			missile = new sCircle;
			
			addChild(missile);
			missile.scaleX = 0.15;
			missile.scaleY = 0.3;
		}
		
		public function update():void
		{
			this.y += 4 * speed;
		}
		
	}

}