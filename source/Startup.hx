package;

import lime.app.Application;
import flash.text.TextField;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.system.FlxSound;
import openfl.display.BitmapData;
import openfl.utils.Assets as OpenFlAssets;
import flixel.graphics.FlxGraphic;
#if desktop
import Discord.DiscordClient;

import vlc.MP4Handler;
#end

using StringTools;

class Startup extends MusicBeatState
{
	var bg:FlxSprite;
	var pieEater:FlxSprite;
	var itdone:FlxSprite;
	var intro:FlxSprite;
	var cacheStuff:Array<String> = ['characters/badai', 'characters/HALL_MONITOR', 'characters/diamondMan', 'characters/playrobot', 'characters/ohshit', 'characters/garrett_algebra', 
	'characters/og_dave_angey', 'funnyAnimal/playTimeTwoPointOh', 'funnyAnimal/palooseMen', 'funnyAnimal/garret_padFuture', 'funnyAnimal/garrett_bf', 'funnyAnimal/wizard', 'funnyAnimal/mrMusic', 
	'funnyAnimal/do_you_accept', 'funnyAnimal/garrett_piss', 'funnyAnimal/carThing', 'characters/recovered_project_2', 'characters/recovered_project_3'];

	override function create()
	{
		PlayerSettings.init();
		FlxG.save.bind('funkin', 'ninjamuffin99');
		SaveDataHandler.initSave();
		Highscore.load();

		#if desktop
		DiscordClient.initialize();
		#end

		bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		bg.scale.set(10, 10);
		bg.screenCenter();
		add(bg);

		pieEater = new FlxSprite(0, 0).loadGraphic(Paths.image('PIE_EATER'));
		pieEater.angularVelocity = 30;
		pieEater.screenCenter();
		add(pieEater);

		itdone = new FlxSprite(0, 0).loadGraphic(Paths.image('ITSLOAD'));
		itdone.screenCenter();
		add(itdone);

		new FlxTimer().start(0.2, function(tmr:FlxTimer) {
			if (FlxG.save.data.preload == 1) {
				for (i in 0...cacheStuff.length) {
					preload(cacheStuff[i]);
					
					if (i == cacheStuff.length -1)
						startVid();
				}
			} else {
				startVid();
			}
		});
	}

	function startVid() {
		new FlxTimer().start(1, function(tmr:FlxTimer) {
			remove(bg);
			remove(pieEater);
			remove(itdone);
			var video:MP4Handler = new MP4Handler();
			video.playVideo(Paths.video('startupIntro'));
			video.finishCallback = function()
			{
				FlxG.switchState(new TitleState()); //after the sound is done!
			}
		});
	}

	public function preload(graphic:String) //preload assets
	{
		trace('cached $graphic');
		var newthing:FlxSprite = new FlxSprite(9000,-9000).loadGraphic(Paths.image(graphic));
		add(newthing);
		remove(newthing);
	}
}