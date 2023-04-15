package;

import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;
	public var furiosityScale:Float = 1.02;
	public var canDance:Bool = true;

	public var nativelyPlayable:Bool = false;

	public var globaloffset:Array<Float> = [0,0];

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');
			case 'gf-only':
				frames = Paths.getSparrowAtlas('characters/GF_ONLY');
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('sad');
				addOffset('danceLeft');
				addOffset('danceRight');

				playAnim('danceRight');
			case '3d-bf':
				frames = Paths.getSparrowAtlas('characters/3D_BF');
				animation.addByPrefix('idle', 'IDLE0', 24, false);
				animation.addByPrefix('singUP', 'UP0', 24, false);
				animation.addByPrefix('singLEFT', 'LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'MUP', 24, false);
				animation.addByPrefix('singLEFTmiss', 'MLEFT', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'MRIGHT', 24, false);
				animation.addByPrefix('singDOWNmiss', 'MDOWN', 24, false);
	
				addOffset('idle', 0, 0);
				addOffset("singUP", 110, 126);
				addOffset("singRIGHT", -59, 17);
				addOffset("singLEFT", 11, 17);
				addOffset("singDOWN", 2, -3);
	
				addOffset("singUPmiss", 114, 118);
				addOffset("singRIGHTmiss", 114, 118);
				addOffset("singLEFTmiss", 114, 118);
				addOffset("singDOWNmiss", 114, 118);

				nativelyPlayable = flipX = true;

				antialiasing = false;

				playAnim('idle');
			case '3d-bf-flipped':
				var tex = Paths.getSparrowAtlas('characters/3D_BF');
				frames = tex;
				animation.addByPrefix('idle', 'IDLE0', 24, false);
				animation.addByPrefix('singUP', 'UP0', 24, false);
				animation.addByPrefix('singLEFT', 'RIGHT0', 24, false);
				animation.addByPrefix('singRIGHT', 'LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'MUP', 24, false);
				animation.addByPrefix('singLEFTmiss', 'MLEFT', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'MRIGHT', 24, false);
				animation.addByPrefix('singDOWNmiss', 'MDOWN', 24, false);
	
				addOffset('idle', 0, 0);
				addOffset("singUP", 109, 129);
				addOffset("singLEFT", 58, 17);
				addOffset("singRIGHT", 11, 13);
				addOffset("singDOWN", -1, -3);
	
				addOffset("singUPmiss", 114, 118);
				addOffset("singRIGHTmiss", 114, 118);
				addOffset("singLEFTmiss", 114, 118);
				addOffset("singDOWNmiss", 114, 118);
	
				playAnim('idle');
	
				flipX = false;
			case 'bandu-scaredy':
				frames = Paths.getSparrowAtlas('characters/bandu_scaredy');
				animation.addByPrefix('idle', 'idle', 24, false);
				for (anim in ['left', 'down', 'up', 'right']) {
					animation.addByPrefix('sing${anim.toUpperCase()}', anim, 24, false);
				}

				addOffset('idle');
				addOffset('singLEFT');
				addOffset('singDOWN');
				addOffset('singUP');
				addOffset('singRIGHT');

				nativelyPlayable = flipX = true;

				antialiasing = false;

				setGraphicSize(1009);
				updateHitbox();

				playAnim('idle');
			case 'sart-producer-night':
				frames = Paths.getSparrowAtlas('characters/sart_producer');
				animation.addByPrefix('idle', 'idle', 24, false);
				for (anim in ['left', 'down', 'up', 'right']) {
					animation.addByPrefix('sing${anim.toUpperCase()}', anim, 24, false);
				}

				addOffset('idle');
				addOffset('singLEFT');
				addOffset('singDOWN');
				addOffset('singUP');
				addOffset('singRIGHT', -789);

				nativelyPlayable = flipX = true;

				setGraphicSize(811);
				updateHitbox();

				antialiasing = false;

				playAnim('idle');
			case 'sart-producer':
				frames = Paths.getSparrowAtlas('characters/sart-producer');
				animation.addByPrefix('idle', 'idle', 24, false);
				for (anim in ['left', 'down', 'up', 'right']) {
					animation.addByPrefix('sing${anim.toUpperCase()}', anim, 24, false);
				}

				addOffset('idle');
				addOffset('singLEFT');
				addOffset('singDOWN');
				addOffset('singUP');
				addOffset('singRIGHT');

				antialiasing = false;

				playAnim('idle');
			case 'playrobot':
				frames = Paths.getSparrowAtlas('characters/playrobot');

				animation.addByPrefix('idle', 'Idle', 24, true);
				animation.addByPrefix('singUP', 'Up', 24, false);
				animation.addByPrefix('singLEFT', 'Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Right', 24, false);
				animation.addByPrefix('singDOWN', 'Down', 24, false);

				addOffset('idle');
				addOffset('singLEFT', 110, -90);
				addOffset('singDOWN', -21, -218);
				addOffset('singUP');
				addOffset('singRIGHT', -55, -96);

				antialiasing = false;

				playAnim('idle');
			case 'playrobot-crazy':
				frames = Paths.getSparrowAtlas('characters/ohshit');

				animation.addByPrefix('idle', 'Idle', 24, true);
				animation.addByPrefix('singUP', 'Up', 24, false);
				animation.addByPrefix('singLEFT', 'Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Right', 24, false);
				animation.addByPrefix('singDOWN', 'Down', 24, false);

				addOffset('idle');
				addOffset('singLEFT', 255);
				addOffset('singDOWN', 203, -50);
				addOffset('singUP', -19);
				addOffset('singRIGHT', -20, 38);

				antialiasing = false;

				playAnim('idle');
			case 'hall-monitor':
				frames = Paths.getSparrowAtlas('characters/HALL_MONITOR');
				animation.addByPrefix('idle', 'gdj', 24, false);
				for (anim in ['left', 'down', 'up', 'right']) {
					animation.addByPrefix('sing${anim.toUpperCase()}', anim, 24, false);
				}

				addOffset('idle');
				addOffset('singLEFT', 436, 401);
				addOffset('singDOWN', 145, 25);
				addOffset('singUP', -150, 62);
				addOffset('singRIGHT', 201, 285);

				antialiasing = false;
				scale.set(1.5, 1.5);
				updateHitbox();

				playAnim('idle');
			case 'diamond-man':
				frames = Paths.getSparrowAtlas('characters/diamondMan');
				animation.addByPrefix('idle', 'idle', 24, true);
				for (anim in ['left', 'down', 'up', 'right']) {
					animation.addByPrefix('sing${anim.toUpperCase()}', anim, 24, false);
				}

				addOffset('idle');
				addOffset('singLEFT', 610);
				addOffset('singDOWN', 91, -328);
				addOffset('singUP', -12, 338);
				addOffset('singRIGHT', 4);

				scale.set(1.3, 1.3);
				updateHitbox();

				antialiasing = false;

				playAnim('idle');
			case 'dave-wheels':
				frames = Paths.getSparrowAtlas('characters/cool');
				animation.addByIndices('danceLeft', 'idle', [0, 1, 2, 3, 4, 5, 6], '', 24, false);
				animation.addByIndices('danceRight', 'idle', [7, 8, 9, 10, 11, 12, 13], '', 24, false);
				for (anim in ['left', 'down', 'up', 'right']) {
					animation.addByPrefix('sing${anim.toUpperCase()}', anim, 24, false);
				}

				addOffset('idle');
				addOffset('singLEFT', 12, -23);
				addOffset('singDOWN', -40, -23);
				addOffset('singUP', -40, 214);
				addOffset('singRIGHT', 9, -23);

				antialiasing = false;
				scale.set(1.8, 1.8);
				updateHitbox();

				playAnim('danceRight');
			case 'gf-wheels':
				loadGraphic(Paths.image('characters/best_gf'), true, 241, 231);
				animation.add('idle', [0], 0, false);

				scale.set(1.9, 1.9);
				antialiasing = false;
				updateHitbox();
				
				
				playAnim('idle');
			case 'ringi':
				frames = Paths.getSparrowAtlas('characters/ringi');
				animation.addByPrefix('idle', 'IDLE', 24, false);
				for (anim in ['LEFT', 'DOWN', 'UP', 'RIGHT']) {
					animation.addByPrefix('sing${anim.toUpperCase()}', anim, 24, false);
				}

				addOffset('idle');
				addOffset('singLEFT');
				addOffset('singDOWN');
				addOffset('singUP');
				addOffset('singRIGHT');

				setGraphicSize(Std.int(width * furiosityScale),Std.int(height * furiosityScale));
				updateHitbox();

				antialiasing = false;

				playAnim('idle');
			case 'bambom':
				frames = Paths.getSparrowAtlas('characters/bambom');
				animation.addByPrefix('idle', 'IDLE', 24, false);
				for (anim in ['LEFT', 'DOWN', 'UP', 'RIGHT']) {
					animation.addByPrefix('sing${anim.toUpperCase()}', anim, 24, false);
				}

				addOffset('idle');
				addOffset('singLEFT');
				addOffset('singDOWN');
				addOffset('singUP');
				addOffset('singRIGHT');

				furiosityScale = 0.75;

				setGraphicSize(Std.int(width * furiosityScale),Std.int(height * furiosityScale));
				updateHitbox();

				antialiasing = false;

				playAnim('idle');
			case 'bendu':
				frames = Paths.getSparrowAtlas('characters/bendu');
				animation.addByPrefix('idle', 'IDLE', 24, false);
				for (anim in ['LEFT', 'DOWN', 'UP', 'RIGHT']) {
					animation.addByPrefix('sing${anim.toUpperCase()}', anim, 24, false);
				}

				addOffset('idle');
				addOffset('singLEFT');
				addOffset('singDOWN');
				addOffset('singUP');
				addOffset('singRIGHT');

				setGraphicSize(Std.int(width * furiosityScale),Std.int(height * furiosityScale));
				updateHitbox();

				antialiasing = false;

				playAnim('idle');
			case 'dave-png':
				frames = Paths.getSparrowAtlas('characters/dave-png');
				animation.addByPrefix('idle', 'idle', 24, false);
				for (anim in ['left', 'down', 'up', 'right']) {
					animation.addByPrefix('sing${anim.toUpperCase()}', anim, 24, false);
				}

				addOffset('idle');
				addOffset('singLEFT', 45);
				addOffset('singDOWN', 28, -5);
				addOffset('singUP', -2, 29);
				addOffset('singRIGHT', 1);

				playAnim('idle');
			case 'split-dave-3d':
				// DAVE SHITE ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/split_dave_3d');
				frames = tex;
				animation.addByPrefix('idle', 'IDLE', 24, false);
				animation.addByPrefix('singUP', 'UP', 24, false);
				animation.addByPrefix('singRIGHT', 'RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'LEFT', 24, false);
		
				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				setGraphicSize(Std.int(width * furiosityScale),Std.int(height * furiosityScale));
				updateHitbox();
				antialiasing = false;
		
				playAnim('idle');

			case 'bandu-origin':
				tex = Paths.getSparrowAtlas('characters/bandu_origin');
				frames = tex;
				animation.addByPrefix('idle', 'IDLE', 24, false);
				animation.addByPrefix('singUP', 'UP', 24, false);
				animation.addByPrefix('singRIGHT', 'RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'LEFT', 24, false);
				animation.addByPrefix('cutscene', 'CUTSCENE', 24, false);
		
				addOffset('idle');
				addOffset("singUP", 69, -30);
				addOffset("singRIGHT", 10, -36);
				addOffset("singLEFT", -90, -10);
				addOffset("singDOWN", 80, 100);
				addOffset("cutscene", 0, -10);
				setGraphicSize(Std.int(width * furiosityScale),Std.int(height * furiosityScale));
				updateHitbox();
				antialiasing = false;
		
				playAnim('idle');

			case 'RECOVERED_PROJECT':
				tex = Paths.getSparrowAtlas('characters/RECOVERED_PROJECT_01');
				frames = tex;
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
		
				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				setGraphicSize(Std.int(width * furiosityScale),Std.int(height * furiosityScale));
				updateHitbox();
				antialiasing = false;
		
				playAnim('idle');

			case 'RECOVERED_PROJECT_2':
				tex = Paths.getSparrowAtlas('characters/recovered_project_2');
				frames = tex;
				animation.addByPrefix('idle', 'IDLE', 24, true);
				animation.addByPrefix('singUP', 'UP', 24, false);
				animation.addByPrefix('singRIGHT', 'RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'LEFT', 24, false);
		
				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				setGraphicSize(Std.int(765 * furiosityScale),Std.int(903 * furiosityScale));
				updateHitbox();
				antialiasing = false;
		
				playAnim('idle');

			case 'RECOVERED_PROJECT_3':
				tex = Paths.getSparrowAtlas('characters/recovered_project_3');
				frames = tex;
				animation.addByPrefix('idle', 'IDLE', 24, false);
				animation.addByPrefix('singUP', 'UP', 24, false);
				animation.addByPrefix('singRIGHT', 'RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'LEFT', 24, false);
		
				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				setGraphicSize(Std.int(765 * furiosityScale),Std.int(903 * furiosityScale));
				updateHitbox();
				antialiasing = false;
		
				playAnim('idle');

			case 'badai':
				// BADAI SHITE ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/badai');
				frames = tex;
				animation.addByPrefix('idle', 'IDLE', 24, false);
				animation.addByPrefix('singUP', 'UP', 24, false);
				animation.addByPrefix('singRIGHT', 'RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'LEFT', 24, false);
		
				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				setGraphicSize(Std.int(width * furiosityScale),Std.int(height * furiosityScale));
				updateHitbox();
				antialiasing = false;
		
				playAnim('idle');

			case 'tunnel-dave':
				// DAVE SHITE ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/tunnel_chase_dave');
				frames = tex;
				animation.addByPrefix('idle', 'IDLE', 24, false);
				animation.addByPrefix('singUP', 'UP', 24, false);
				animation.addByPrefix('singRIGHT', 'RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'LEFT', 24, false);
		
				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				setGraphicSize(Std.int(width * furiosityScale),Std.int(height * furiosityScale));
				updateHitbox();
				antialiasing = false;
		
				playAnim('idle');

			case 'og-dave':
				// DAVE SHITE ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/og_dave');
				frames = tex;
				animation.addByPrefix('idle', 'IDLE', 24, false);
				animation.addByPrefix('singUP', 'UP', 24, false);
				animation.addByPrefix('singRIGHT', 'RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'LEFT', 24, false);
				animation.addByPrefix('stand', 'STAND', 24, false);
		
				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN", -82, -24);
				addOffset("stand", -87, -29);

				setGraphicSize(Std.int(width * furiosityScale),Std.int(height * furiosityScale));
				updateHitbox();
				antialiasing = false;
		
				playAnim('idle');

			case 'og-dave-angey':
				// DAVE SHITE ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/og_dave_angey');
				frames = tex;
				animation.addByPrefix('idle', 'IDLE', 24, false);
				animation.addByPrefix('singUP', 'UP', 24, false);
				animation.addByPrefix('singRIGHT', 'RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'LEFT', 24, false);
				animation.addByPrefix('stand', 'STAND', 24, false);
		
				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("stand", -156, -45);

				setGraphicSize(Std.int(width * furiosityScale),Std.int(height * furiosityScale));
				updateHitbox();
				antialiasing = false;
		
				playAnim('idle');

			case 'garrett':
				// DAVE SHITE ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/garrett_algebra');
				frames = tex;
				animation.addByPrefix('idle', 'IDLE', 24, false);
				animation.addByPrefix('singUP', 'UP', 24, false);
				animation.addByPrefix('singRIGHT', 'RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'LEFT', 24, false);
				animation.addByPrefix('stand', 'STAND', 24, false);
				animation.addByPrefix('scared', 'SHOCKED', 24, false);
		
				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT", -45, 3);
				addOffset("singLEFT");
				addOffset("singDOWN", -48, -46);
				addOffset("stand", 20);
				addOffset("scared");

				furiosityScale = 1.3;

				setGraphicSize(Std.int(width * furiosityScale),Std.int(height * furiosityScale));
				updateHitbox();
				antialiasing = false;
		
				playAnim('idle');

			case 'bambi-piss-3d':
				// BAMBI SHITE ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/bambi_pissyboy');
				frames = tex;
				animation.addByIndices('danceLeft', 'idle', [for (i in 0...13) i], "", 24, false);
				animation.addByIndices('danceRight', 'idle', [for (i in 13...23) i], "", 24, false);
				for (anim in ['left', 'down', 'up', 'right']) {
					animation.addByPrefix('sing${anim.toUpperCase()}', anim, 24, false);
				}
		
				addOffset('danceLeft');
				addOffset('danceRight');
				addOffset("singUP", 10, 20);
				addOffset("singRIGHT", 30, 20);
				addOffset("singLEFT", 30);
				addOffset("singDOWN", 0, -10);
				globaloffset[0] = 150;
				globaloffset[1] = 450; //this is the y
				setGraphicSize(Std.int(width / furiosityScale));
				updateHitbox();
				antialiasing = false;
		
				playAnim('danceRight');

			case 'bandu':
				frames = Paths.getSparrowAtlas('characters/bandu');
				
				animation.addByPrefix('idle', 'idle', 24, true);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				
				animation.addByIndices('idle-alt', 'phones fall', [17], '', 24, false);
				animation.addByPrefix('singUP-alt', 'sad up', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'sad right', 24, false);
				animation.addByPrefix('singDOWN-alt', 'sad down', 24, false);
				animation.addByPrefix('singLEFT-alt', 'sad left', 24, false);

				animation.addByIndices('NOOMYPHONES', 'phones fall', [0, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 17], '', 24, false);
				
				addOffset('idle');
				addOffset("singUP", 0, 80);
				addOffset("singRIGHT", 140, -80);
				addOffset("singLEFT", 200);
				addOffset("singDOWN", 0, -30);
				
				addOffset('NOOMYPHONES');

				addOffset('idle-alt');
				addOffset("singUP-alt", 0, 100);
				addOffset("singRIGHT-alt", 30);
				addOffset("singLEFT-alt", -20, -38);
				addOffset("singDOWN-alt");

				globaloffset[0] = 150;
				globaloffset[1] = 450;

				setGraphicSize(Std.int(width / furiosityScale));
				updateHitbox();

				antialiasing = false;

				playAnim('idle');
			case 'bandu-candy':
				frames = Paths.getSparrowAtlas('characters/bandu_crazy');
				
				animation.addByIndices('danceLeft', 'IDLE', [0, 1, 2, 3, 4, 5], '', 24, false);
				animation.addByIndices('danceRight', 'IDLE', [9, 8, 7, 6, 5, 4], '', 24, false);
				animation.addByPrefix('singUP', 'UP', 24, false);
				animation.addByPrefix('singRIGHT', 'RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'LEFT', 24, false);
				animation.addByPrefix('singUP-alt', 'ALT-UP', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'ALT-RIGHT', 24, false);
				animation.addByPrefix('singDOWN-alt', 'ALT-DOWN', 24, false);
				animation.addByPrefix('singLEFT-alt', 'ALT-LEFT', 24, false);

				addOffset('danceLeft');
				addOffset('danceRight');
				addOffset("singUP");
				addOffset("singRIGHT", 120);
				addOffset("singLEFT", -63);
				addOffset("singDOWN");
				addOffset("singUP-alt");
				addOffset("singRIGHT-alt");
				addOffset("singLEFT-alt");
				addOffset("singDOWN-alt");

				setGraphicSize(Std.int(width / furiosityScale));
				updateHitbox();

				antialiasing = false;

				playAnim('danceLeft');
			case 'bambi-unfair':
				// BAMBI SHITE ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/unfair_bambi');
				frames = tex;
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'singUP', 24, false);
				animation.addByPrefix('singRIGHT', 'singRIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'singDOWN', 24, false);
				animation.addByPrefix('singLEFT', 'singLEFT', 24, false);
		
				addOffset('idle');
				addOffset("singUP", 140, 70);
				addOffset("singRIGHT", -180, -60);
				addOffset("singLEFT", 250, 0);
				addOffset("singDOWN", 150, 50);
				globaloffset[0] = 150 * 1.3;
				globaloffset[1] = 450 * 1.3; //this is the y
				setGraphicSize(Std.int((width * 1.3) / furiosityScale));
				updateHitbox();
				antialiasing = false;
		
				playAnim('idle');
			case 'bambi-good':
				// PLACEHOLDER! !  ! !
				frames = Paths.getSparrowAtlas('characters/bambiShip');
				animation.addByPrefix('idle', 'IDLE', 24, false);
				animation.addByPrefix('singUP', 'UP', 24, false);
				animation.addByPrefix('singRIGHT', 'RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'LEFT', 24, false);
				animation.addByPrefix('talk', 'TALK', 24, false);
				animation.addByPrefix('shit', 'HOLYSHIT', 24, false);

				addOffset('idle');
				addOffset("singUP", -10, 9);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 10, -5);
				addOffset("singDOWN", -15, -5);
				addOffset("talk", -4, 13);
				addOffset("shit", 0, 5);

				playAnim('idle');
			case 'dave-good':
				// allso uh placeholder
				tex = Paths.getSparrowAtlas('characters/daveShip');
				frames = tex;
				animation.addByPrefix('idle', 'IDLE', 24, false);
				animation.addByPrefix('singUP', 'UP', 24, false);
				animation.addByPrefix('singRIGHT', 'LEFT', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'RIGHT', 24, false);
				animation.addByPrefix('talk', 'TALK', 24, false);
	
				addOffset('idle');
				addOffset("singUP", -10, 9);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 10, -5);
				addOffset("singDOWN", -15, -5);
				addOffset("talk", -4, 13);

				flipX = true;

				playAnim('idle');
			case 'bamb-root':
				tex = Paths.getSparrowAtlas('characters/root_bamber');
				frames = tex;
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);

				addOffset('idle');
				addOffset("singUP", -10, 9);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 10, -5);
				addOffset("singDOWN", -15, -5);

				playAnim('idle');
			case 'insanidave':
				frames = Paths.getSparrowAtlas('characters/insanidave');
				animation.addByPrefix('idle', 'IDLE', 24, false);
				animation.addByPrefix('singUP', 'UP', 24, false);
				animation.addByPrefix('singRIGHT', 'RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'LEFT', 24, false);

				addOffset('idle');
				addOffset("singUP", -10, 9);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 10, -5);
				addOffset("singDOWN", -15, -5);

				playAnim('idle');
			case 'unfair-junker':
				frames = Paths.getSparrowAtlas('characters/UNFAIR_GUY_FAICNG_FORWARD');
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByIndices('singUP', 'up', [0, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2], '', 24, false);
				animation.addByIndices('singRIGHT', 'right', [0, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2], '', 24, false);
				animation.addByIndices('singDOWN', 'down', [0, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2], '', 24, false);
				animation.addByIndices('singLEFT', 'left', [0, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2], '', 24, false);
				animation.addByIndices('inhale', 'INHALE', [0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 1, 2, 1, 2, 1, 0, 0], '', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset('inhale');
				globaloffset[0] = 150 * 1.3;
				globaloffset[1] = 450 * 1.3; //this is the y
				setGraphicSize(Std.int((width * 1.3) / furiosityScale));
				updateHitbox();
				antialiasing = false;
		
				playAnim('idle');
			case 'bf':
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
				animation.addByPrefix('dodge', "boyfriend dodge", 24, false);
				animation.addByPrefix('scared', 'BF idle shaking', 24);
				animation.addByPrefix('hit', 'BF hit', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				nativelyPlayable = true;

				flipX = true;

			case 'tunnel-bf':
				var tex = Paths.getSparrowAtlas('characters/tunnel_bf');
				frames = tex;

				animation.addByPrefix('idle', 'IDLE', 24, false);
				animation.addByPrefix('singUP', 'UP', 24, false);
				animation.addByPrefix('singLEFT', 'LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN', 24, false);
				animation.addByPrefix('turn', 'TURN', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT", 90);
				addOffset("singDOWN");
				addOffset('turn');

				playAnim('idle');

				flipX = true;

				nativelyPlayable = true;
			//tunnel-bf-flipped cuz im STUPID
			case 'tunnel-bf-flipped':
				var tex = Paths.getSparrowAtlas('characters/tunnel_bf');
				frames = tex;

				animation.addByPrefix('idle', 'IDLE', 24, false);
				animation.addByPrefix('singUP', 'UP', 24, false);
				animation.addByPrefix('singRIGHT', 'LEFT', 24, false);
				animation.addByPrefix('singLEFT', 'RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'DOWN', 24, false);
				animation.addByPrefix('turn', 'TURN', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singLEFT");
				addOffset("singRIGHT", 13);
				addOffset("singDOWN");
				addOffset('turn');

				playAnim('idle');

				nativelyPlayable = true;
			case 'garrett-animal':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('funnyAnimal/garrett', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle0', 24);
				animation.addByPrefix('singUP', 'up0', 24);
				animation.addByPrefix('singRIGHT', 'right0', 24);
				animation.addByPrefix('singDOWN', 'down0', 24);
				animation.addByPrefix('singLEFT', 'left0', 24);
		
				addOffset('idle');
				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
		
				playAnim('idle');
			case 'playtime':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('funnyAnimal/playTimeTwoPointOh', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle0', 24);
				animation.addByPrefix('singUP', 'up0', 24);
				animation.addByPrefix('singRIGHT', 'right0', 24);
				animation.addByPrefix('singDOWN', 'down0', 24);
				animation.addByPrefix('singLEFT', 'left0', 24);
				animation.addByPrefix('garrett pulls out ass', 'CHECK OUT MY LIL FRIENDO0', 24, false);
			
				addOffset('idle', 0, -1);
				addOffset("singUP", -1, -1);
				addOffset("singRIGHT", -1, -1);
				addOffset("singLEFT", -1, -1);
				addOffset("singDOWN", -1, -1);
				addOffset("garrett pulls out ass", 601, 352);
			
				playAnim('idle');
			case 'palooseMen':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('funnyAnimal/palooseMen', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle0', 24);
				animation.addByPrefix('singUP', 'up0', 24);
				animation.addByPrefix('singRIGHT', 'right0', 24);
				animation.addByPrefix('singDOWN', 'down0', 24);
				animation.addByPrefix('singLEFT', 'left0', 24);
				
				addOffset('idle', 0, 0);
				addOffset("singUP", -24, 107);
				addOffset("singLEFT", 580, -40);
				addOffset("singRIGHT", -41, -51);
				addOffset("singDOWN", -27, -230);
					
				scale.set(1.3, 1.3);
				
			    playAnim('idle');
			case 'garrett-pad':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('funnyAnimal/garret_padFuture', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle0', 24);
				animation.addByPrefix('singUP', 'up0', 24);
				animation.addByPrefix('singRIGHT', 'right0', 24);
				animation.addByPrefix('singDOWN', 'down0', 24);
				animation.addByPrefix('singLEFT', 'left0', 24);

				addOffset('idle', -79, -144);
				addOffset("singUP", -77, -141);
				addOffset("singRIGHT", -56, -150);
				addOffset("singLEFT", -74, -150);
				addOffset("singDOWN", -78, -111);
			
				playAnim('idle');
			case 'bf-pad':
				var tex = Paths.getSparrowAtlas('funnyAnimal/garrett_bf', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle0', 24, false);
				animation.addByPrefix('singUP', 'up0', 24, false);
				animation.addByPrefix('singLEFT', 'left0', 24, false);
				animation.addByPrefix('singRIGHT', 'right0', 24, false);
				animation.addByPrefix('singDOWN', 'down0', 24, false);
		
				addOffset('idle', -79, -144);
				addOffset("singUP", -50, -98);
				addOffset("singRIGHT", -77, -133);
				addOffset("singLEFT", 38, -112);
				addOffset("singDOWN", -96, -193);
	
				animation.addByPrefix('singUPmiss', 'up0', 24, false);
				animation.addByPrefix('singLEFTmiss', 'left0', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'right0', 24, false);
				animation.addByPrefix('singDOWNmiss', 'down0', 24, false);
				addOffset("singUPmiss", -50, -98);
				addOffset("singRIGHTmiss", -77, -133);
				addOffset("singLEFTmiss", 38, -112);
				addOffset("singDOWNmiss", -96, -193);

				flipX = true;
		
				playAnim('idle');
	
				scale.set(0.6, 0.6);
			case 'wizard':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('funnyAnimal/wizard', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle0', 24);
				animation.addByPrefix('singUP', 'up0', 24);
				animation.addByPrefix('singRIGHT', 'right0', 24);
				animation.addByPrefix('singDOWN', 'down0', 24);
				animation.addByPrefix('singLEFT', 'left0', 24);
				
				addOffset('idle', 1, -1);
				addOffset("singUP", -1, -1);
				addOffset("singRIGHT", -42, -11);
				addOffset("singLEFT", -111, -21);
				addOffset("singDOWN", -1, -1);
				
				playAnim('idle');
			case 'piano-guy':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('funnyAnimal/mrMusic', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'YEA0', 24);
				animation.addByPrefix('singUP', 'up0', 24);
				animation.addByPrefix('singRIGHT', 'right0', 24);
				animation.addByPrefix('singDOWN', 'down0', 24);
				animation.addByPrefix('singLEFT', 'left0', 24);
				
				addOffset('idle', -79, -141);
				addOffset("singUP", -154, 48);
				addOffset("singRIGHT", -66, -162);
				addOffset("singLEFT", 182, -159);
				addOffset("singDOWN", 20, -240);
					
				scale.set(4, 4);
	
				playAnim('idle');
	
			case 'pedophile':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('funnyAnimal/do_you_accept', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle0', 24);
				animation.addByPrefix('singUP', 'up0', 24);
				animation.addByPrefix('singRIGHT', 'right0', 24);
				animation.addByPrefix('singDOWN', 'down0', 24);
				animation.addByPrefix('singLEFT', 'left0', 24);
						
				addOffset('idle', 0, 0);
				addOffset("singUP", -1, 1);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 0, -1);
				addOffset("singDOWN", 20, 0);
					
				playAnim('idle');
	
			case 'garrett-angry':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('funnyAnimal/garrett_piss', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle0', 24);
				animation.addByPrefix('singUP', 'up0', 24);
				animation.addByPrefix('singRIGHT', 'right0', 24);
				animation.addByPrefix('singDOWN', 'down0', 24);
				animation.addByPrefix('singLEFT', 'left0', 24);
			
				addOffset('idle', 0, 0);
				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 1, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				
				playAnim('idle');
			case 'garrett-car':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('funnyAnimal/carThing', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle0', 24);
				animation.addByPrefix('singUP', 'up0', 24);
				animation.addByPrefix('singRIGHT', 'right0', 24);
				animation.addByPrefix('singDOWN', 'down0', 24);
				animation.addByPrefix('singLEFT', 'left0', 24);
				
				addOffset('idle', 0, 0);
				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				
				playAnim('idle');
			case 'prealpha':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/prealpha_dude');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance0', 24);
				animation.addByPrefix('singUP', 'Dad Sing note UP0', 24);
				animation.addByPrefix('singLEFT', 'dad sing note right0', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN0', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT0', 24);
				
				addOffset('idle', 0, 0);
				addOffset("singUP", -6, 46);
				addOffset("singRIGHT", -1, 21);
				addOffset("singLEFT", -9, 4);
				addOffset("singDOWN", 2, -33);
				
				playAnim('idle');
		}
		dance();

		if(isPlayer)
		{
			flipX = !flipX;
		}
	}

	public var POOP:Bool = false; // https://cdn.discordapp.com/attachments/902006463654936587/906412566534848542/video0-14.mov

	override function update(elapsed:Float)
	{
		if (animation == null)
		{
			super.update(elapsed);
			return;
		}
		else if (animation.curAnim == null)
		{
			super.update(elapsed);
			return;
		}
		if (!nativelyPlayable && !isPlayer)
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				dance(POOP);
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR DANCING SHIT
	 */
	public function dance(alt:Bool = false)
	{
		if (!debugMode && canDance)
		{
			var poopInPants:String = alt ? '-alt' : '';
			switch (curCharacter)
			{
				case 'gf' | 'gf-christmas' | 'gf-pixel' | 'bandu-candy' | 'bambi-piss-3d' | 'gf-only' | 'dave-wheels':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight' + poopInPants, true);
						else
							playAnim('danceLeft' + poopInPants, true);
					}
				default:
					playAnim('idle' + poopInPants, true);
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		if (animation.getByName(AnimName) == null)
		{
			//WHY THE FUCK WAS THIS TRACE HERE
			//trace(AnimName);
			return; //why wasn't this a thing in the first place
		}
		if(AnimName.toLowerCase().startsWith('idle') && !canDance || debugMode)
		{
			return;
		}
		animation.play(AnimName, Force, Reversed, Frame);
	
		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			if (isPlayer)
			{
				if(!nativelyPlayable)
				{
					offset.set((daOffset[0] * -1) + globaloffset[0], daOffset[1] + globaloffset[1]);
				}
				else
				{
					offset.set(daOffset[0] + globaloffset[0], daOffset[1] + globaloffset[1]);
				}
			}
			else
			{
				if(nativelyPlayable)
				{
					offset.set((daOffset[0] * -1), daOffset[1]);
				}
				else
				{
					offset.set(daOffset[0], daOffset[1]);
				}
			}
		}
		else
			offset.set(0, 0);
	
		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}
	
			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
