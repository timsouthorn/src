package
{
	
	import org.flixel.FlxSprite;
	
	public class Bullet extends FlxSprite
	{
		public var damage:int = 1;
		public var speed:int = 200;
		
		public function Bullet()
		{
			super(0, 0, Assets.bulletPNG);
			exists = false;
		}
		
		public function fire(bx:int, by:int):void
		{
			x = bx;
			y = by;
			velocity.y = -speed;
			exists = true;
		}
	}
}