package;

import flixel.FlxSprite;
import flixel.math.FlxMath;
import lime.utils.Assets;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public var isPlayer:Bool = false;
	
	public var noAaChars:Array<String> = [
		'dave-angey',
		'dave-annoyed-3d',
		'bambi-3d',
		'bf-pixel',
		'gf-pixel',
		'bambi-unfair',
		'bambi-piss-3d',
		'bandu',
		'the-two-dunkers',
		'tunnel-dave',
		'split-dave-3d',
		'og-dave',
		'og-dave-angey',
		'garrett',
		'badai',
		'3d-bf',
		'RECOVERED_PROJECT',
		'RECOVERED_PROJECT_2',
		'RECOVERED_PROJECT_3',
		'bandu-candy',
		'bandu-origin',
		'bandu-scaredy',
		'sart-producer',
		'sart-producer-night',
		'bambom',
		'ringi',
		'bendu',
		'dave-wheels'
	];

	public var charPublic:String = 'bf';

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();

		this.isPlayer = isPlayer;

		charPublic = char;

		if(char != 'bandu-origin' && Assets.exists('assets/images/icons/$char.png')) {
			loadGraphic(Paths.image('icons/$char'), true, 150, 150);
			addIcon(char, 0);
			animation.play(char);
		} else if (char == 'bandu-origin' && Assets.exists('assets/images/icons/bandu_origin_icon.png') && Assets.exists('assets/images/icons/bandu_origin_icon.xml')) {
			frames = Paths.getSparrowAtlas('icons/bandu_origin_icon');
			animation.addByPrefix(char, char, 24, false, isPlayer, false);
		} else {
			loadGraphic(Paths.image('icons/face'), true, 150, 150);
			addIcon('face', 0);
			animation.play('face');
		}

		antialiasing = true;

		//animation.play(char);

		if (noAaChars.contains(char))
		{
			antialiasing = false;
		}
		scrollFactor.set();
	}

	function addIcon(char:String, startFrame:Int, singleIcon:Bool = false) {
		animation.add(char, !singleIcon ? [startFrame, startFrame + 1] : [startFrame], 0, false, isPlayer);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		offset.set(Std.int(FlxMath.bound(width - 150,0)),Std.int(FlxMath.bound(height - 150,0)));

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
