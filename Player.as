package
{
	import flash.display.Sprite;
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	
	public class Player extends FlxSprite
	{
		private var maxSpeed:int = 80;
		private var thrustSpeed:int = 150;
		private var decel:int = 100;
		private var rotSpeed:int = 800;
		private var rotMax:int = 300;
		private var rotDec:int = 800;
		
		private var bulletDelay:int = 75;
		private var lastFired:int;
		

		
		public function Player(png:Class, bx:Number = 0, by:Number = 0):void
		{
			super(bx, by);
			loadRotatedGraphic(png, 180, -1, true, true);
			
			
			//CONTROLS

			//Add Flixel power tools control plugin
			if (FlxG.getPlugin(FlxControl) == null) {
				FlxG.addPlugin(new FlxControl);
			}

			//Set control type
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, false, false);
			
			//Set movement properties
			FlxControl.player1.setThrust("W", thrustSpeed);
			FlxControl.player1.setMaximumSpeed(maxSpeed, maxSpeed);
			FlxControl.player1.setDeceleration(decel, decel);
			
			FlxControl.player1.setRotationType(FlxControlHandler.ROTATION_ACCELERATES, FlxControlHandler.ROTATION_STOPPING_DECELERATES);
			FlxControl.player1.setRotationSpeed(rotSpeed, rotSpeed, rotMax, rotDec);
			FlxControl.player1.setRotationKeys(false, false, "A", "D");


			//Gravity
			FlxControl.player1.setGravity(0, 40);
			
			//Bounce off walls
			this.elasticity = 0.3;
			
			//Fire bullets
			if(FlxG.keys.justPressed("SPACE"))
			{
				
			}
				
			
		}
		
	}
}