package
{
	
	import org.flixel.*;
	
	public class Exhaust extends FlxGroup
	{
		
		public var em:FlxEmitter;
		public var particle:FlxParticle;
		
		private var rAngle:Number;
		private var distance:Number;
		private var xOffset:Number = 7;
		private var yOffset:Number = 7;

		
		
		public function Exhaust(bx:Number = 0, by:Number = 0, s:Number = 100):void
		{	
			em = new FlxEmitter(bx, by, s);
			em.setRotation(0, 0);
			
			//create particles and add them to the emitter array
			for(var i:int = 0; i < s; i++)
			{
				em.add(new ExhaustParticle);
			}
			
			add(em);
		}
		
		
		
		/**
		 * @param	X		The X-coordinate of the point in space.
		 * @param	Y		The Y-coordinate of the point in space.
		 * @param	D		Distance from center.
		 * @param	A		Angle of rotation.
		 */
		
		public function moveExhaust(X:Number, Y:Number, D:Number, A:Number):void
		{
			//convert angle to radians + add 135 to match orientation of sprite
			rAngle = 135 + A * Math.PI / 180;
			
			//position exhaust at back of sprite
			em.x = xOffset + (X + D * Math.cos(rAngle));
			em.y = yOffset + (Y + D * Math.sin(rAngle));
			
			//set directions of emitter
			em.setXSpeed(em.x - X - D, (em.x - X - D) * 6);
			em.setYSpeed(em.y - Y - D, (em.y - Y - D) * 6);
			
			//Start exhaust when thrusting
			if(!FlxG.keys.W)
			{
				em.start(false, 3, 0.02);
			}
		}
	}
}