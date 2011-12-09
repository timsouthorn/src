package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.filters.BitmapFilter;
	import flash.filters.BlurFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	
	public class BlurLayer extends FlxGroup
	{
		private var ether:BitmapData;
		private var etherLayer:BitmapData;
		private var blur:BlurFilter;
		
		
		public function BlurLayer():void
		{
			super();
			
			ether = new BitmapData(FlxG.width, FlxG.height, true, 0);
			etherLayer = new BitmapData(FlxG.width, FlxG.height, true, 0);			
			blur = new BlurFilter(2, 2);
		}
		
		override public function draw():void
		{
			//apply blur filter to ether buffer
			ether.applyFilter(ether, ether.rect, new Point(0, 0), blur);
			
			//save FlxG.buffer
			var tmp:BitmapData = FlxG.camera.buffer;
			
			//point FlxG.buffer at our ether sprite so the bullets gets drawn onto this instead of FlxG.buffer
			FlxG.camera.buffer = ether;
			
			super.draw();
			
			//put the buffer back
			FlxG.camera.buffer = tmp;
			
			// copy our ether buffer to the main flixel buffer
			FlxG.camera.buffer.copyPixels(ether, new Rectangle(0, 0, FlxG.width, FlxG.height), new Point(0, 0), null, null, true);
			//ether.fillRect(ether.rect, 0);
		}
	}
}
