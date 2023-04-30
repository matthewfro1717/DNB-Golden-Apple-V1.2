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

		changeIcon(char);

		scrollFactor.set();
	}

	function addIcon(char:String, startFrame:Int, singleIcon:Bool = false) {
		animation.add(char, !singleIcon ? [startFrame, startFrame + 1] : [startFrame], 0, false, isPlayer);
	}

	public function changeIcon(char:String = 'face')
	{
		charPublic = char;

		if(char != 'bandu-origin')
		{
			loadGraphic(Paths.image('icons/$char'), true, 150, 150);

			addIcon(char, 0);
		}
		else
		{
			frames = Paths.getSparrowAtlas('icons/bandu_origin_icon');
			animation.addByPrefix(char, char, 24, false, isPlayer, false);
		}

		antialiasing = !noAaChars.contains(char);

		animation.play(char);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		offset.set(Std.int(FlxMath.bound(width - 150,0)),Std.int(FlxMath.bound(height - 150,0)));

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}