package
{
	import flash.display.Sprite;
	import flash.sampler.Sample;
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.*;
	
	
	public class PlayState extends FlxState
	{
		
		private var starfield:StarfieldFX;
		private var stars:FlxSprite;
		private var map:FlxTilemap;
		
		private var exhaust1:Exhaust;
		private var blurLayer:BlurLayer;
		private var exX:Number = 0;
		private var exY:Number = 0;
		private var exDistance:Number = 7;

		
		override public function create():void
		{
			//Set level bounds
			FlxG.camera.setBounds(0, 0, 640, 480);
			FlxG.worldBounds = new FlxRect(0, 0, 640, 480);
			
			//Check to see if Special FX Plugin is loaded
			if (FlxG.getPlugin(FlxSpecialFX) == null)
			{
				FlxG.addPlugin(new FlxSpecialFX);
			}
			
			//Adds starfield background
			starfield = FlxSpecialFX.starfield();
			stars = starfield.create(0, 0, FlxG.width, FlxG.height, 100, 1, 20);
			starfield.setStarSpeed(0, 0);
			add(stars);
			
			//////////
			//Player//
			//////////
			
			Registry.player1 = new Player(Assets.blueShipPNG, 18, FlxG.height/2 -8);
			exhaust1 = new Exhaust(Registry.player1.x, Registry.player1.y + 7);
			
			//Add exhaust first so under ship
			blurLayer = new BlurLayer();
			blurLayer.add(exhaust1);
			add(blurLayer);			

			//Add player on top
			add(Registry.player1);
			
			//Add map
			map = new FlxTilemap();
			map.loadMap(new Assets.testMapCSV, Assets.testMapPNG, 16, 16, 0, 0, 1, 1);
			add(map);
		}
	
		
		override public function update():void
		{
			
			super.update();
			//turn on collision with map
			FlxG.collide(map, Registry.player1);
			FlxG.collide(map, exhaust1);

			exhaust1.moveExhaust(Registry.player1.x, Registry.player1.y, 7, Registry.player1.frame * 2);
		}
	}
}