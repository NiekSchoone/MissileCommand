package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class Tower extends MovieClip
	{
		private var tower : MovieClip;
		
		public function Tower() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			tower = new cannon();
			
			addChild(tower);
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, aimTower);
			
			stage.addEventListener(MouseEvent.CLICK, Shoot);
			
		}
		private function aimTower(e:MouseEvent):void
		{
			var diffX :	Number = e.localX - this.x;
			var diffY :	Number = e.localY - this.y;
			
			var rotationInRadians : Number = Math.atan2(diffY, diffX);
			
			tower.rotation = rotationInRadians * (180 / Math.PI);
		}
		
		public function get turretRotation() : Number
		{
			return tower.rotation;
		}
		
		private function Shoot():void
		{
			
		}
	}

}