package
{
	
	
	import org.flixel.*;
		
	public class ExhaustParticle extends FlxParticle
	{
				
		public function ExhaustParticle()
		{
			super();
			
			loadGraphic(Assets.exhaustPNG, true, false, 1, 1);
			addAnimation("fadeOut", [0,1,2,3,4,5,6,7,8,9], 5, false);
			exists = false;
		}
		
		override public function onEmit():void
		{
			elasticity = 0.2;
			play("fadeOut");
			
			super.onEmit();
		}
	}
}