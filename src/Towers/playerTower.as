package Towers
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Niek Schoone
	 */
	
	public class playerTower extends Tower
	{
		public static const SHOOT : String = "shoot";
		
		private var tower : MovieClip;
		
		override internal function spawnTower():void
		{
			tower = new cannon();
			
			addChild(tower);
		}
		
		override internal function initTower():void
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, aimTower);
			
			stage.addEventListener(MouseEvent.CLICK, shoot);
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
		
		private function shoot(e:MouseEvent):void
		{
			dispatchEvent(new Event("shoot"));
		}
		
	}

}