package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class MissileWeapon extends MovieClip
	{
		private var missileVar : MovieClip;
		
		private var speed : Number = 4;
		
		private var velocity : Vector3D;
		
		
		public function MissileWeapon() 
		{
			super();
			
			missileVar = new sCircle;
			
			addChild(missileVar);
			missileVar.rotation = 90;
			missileVar.scaleX = 0.15;
			missileVar.scaleY = 0.3;
			
			
		}
		
		public function update():void
		{
			this.x += velocity.x * speed;
			this.y += velocity.y * speed;
		}
		
		public function setTarget(target:Vector3D):void 
		{
			velocity = new Vector3D(target.x - this.x, target.y - this.y);
			velocity.normalize();
			
			var rotation : Number = Math.atan2 (velocity.y, velocity.x);
			this.rotation = rotation * 180 / Math.PI;
		}
		
	}

}