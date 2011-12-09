package
{
	public class Assets
	{
		//	Bitmap Fonts
		//[Embed(source = '../assets/fonts/bloodFont.png')] public static var bloodFontPNG:Class;

		
		//Characters
		[Embed(source = '../assets/ships/blueShip.png')] public static var blueShipPNG:Class;
		[Embed(source = '../assets/exhaust.png')] public static var exhaustPNG:Class;

		
		//Bullets
		[Embed(source = '../assets/marker.png')] public static var bulletPNG:Class;

		
		//maps
		[Embed(source = '../assets/maps/testMap.csv', mimeType='application/octet-stream')] public static var testMapCSV:Class; 
		[Embed(source = '../assets/maps/testMap.png')] public static var testMapPNG:Class; 

		
		
		
		public function Assets():void
		{
		}
	}
}