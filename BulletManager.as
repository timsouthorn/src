package
{
	import org.flixel.*;
	
	public class BulletManager extends FlxGroup
	{
		
		public function BulletManager()
		{
			super();
			
			//	There are 40 bullets in our pool
			for (var i:int = 0; i < 40; i++)
			{
				add(new Bullet);
			}
		}
		
		public function fire(bx:int, by:int):void
		{
			if(getFirstAvailable())
			{
				Bullet(getFirstAvailable()).fire(bx, by);
			}	
		}	
	}
}
