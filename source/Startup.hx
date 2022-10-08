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
#end

using StringTools;

class Startup extends MusicBeatState
{
	var bg:FlxSprite;
	var pieEater:FlxSprite;
	var itdone:FlxSprite;
	var intro:FlxSprite;

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

		/*
		if (FlxG.save.data.preload) {
			//cache everything lol
		} */ //to do later!!! GO TO "SaveDataHander.hx" AND YOU'LL KNOW WHAT TO DO!!

		itdone = new FlxSprite(0, 0).loadGraphic(Paths.image('ITSLOAD'));
		itdone.screenCenter();
		add(itdone);

		intro = new FlxSprite(0, 0);
		intro.frames = Paths.getSparrowAtlas('startup');
		intro.animation.addByPrefix('idle', "startup yes0", 24);
		intro.animation.play('idle');
		intro.screenCenter();
		intro.updateHitbox();
		add(intro);
		remove(intro); //loads it so no lag!!

		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			remove(bg);
			remove(pieEater);
			remove(itdone);

			FlxG.sound.play(Paths.sound('junk'));
			intro.animation.play('idle');
			add(intro);
			new FlxTimer().start(5, function(tmr:FlxTimer)
			{
				FlxG.switchState(new TitleState()); //after the sound is done!
			});
		});
	}
}