package
{
	import org.flixel.*;
	[SWF(width="1024", height="768", backgroundColor="#000000")]
	public class Shooter extends FlxGame
	{
		public function Shooter()
		{
			super(512, 384, PlayState, 2, 60, 30);
			
			forceDebugger = true;
		}
	}
}