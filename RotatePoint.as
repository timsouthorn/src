package
{
	import org.flixel.FlxPoint;

	public class RotatePoint
	{
		
		private static var x:Number;
		private static var y:Number;
		private static var rAngle:Number;

		private static var point:FlxPoint;

		public function RotatePoint()
		{
			
		}
		
		/**
		 * @param	X			The X-coordinate of the point in space.
		 * @param	Y			The Y-coordinate of the point in space.
		 * @param	Dist		Distance from center.
		 * @param	Angle		Angle of rotation.
		 * @param	Offset			Rotation offset
		 **/
		
		public static function rotate(X:Number, Y:Number, Dist:int, Angle:int, Offset:int):FlxPoint
		{
			//convert angle to radians + add 135 to match orientation of sprite
			rAngle = Offset + Angle * Math.PI / 180;
			
			point.x = (X + Dist * Math.cos(rAngle));
			point.y = (Y + Dist * Math.sin(rAngle));
			
			return point;	
		}
	}
}