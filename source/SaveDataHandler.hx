package;

import flixel.input.gamepad.FlxGamepad;
import flixel.input.keyboard.FlxKey;
import openfl.Lib;
import flixel.FlxG;

/**
 * handles save data initialization
*/
class SaveDataHandler
{
    public static function initSave()
    {
        if (FlxG.save.data.newInput == null)
			FlxG.save.data.newInput = true;

		if (FlxG.save.data.downscroll == null)
			FlxG.save.data.downscroll = false;

		if (FlxG.save.data.dfjk == null)
			FlxG.save.data.dfjk = false;

		if (FlxG.save.data.freeplayCuts == null)
			FlxG.save.data.freeplayCuts = false;

		if (FlxG.save.data.accuracyDisplay == null)
			FlxG.save.data.accuracyDisplay = true;

		if (FlxG.save.data.eyesores == null)
			FlxG.save.data.eyesores = true;

		if (FlxG.save.data.donoteclick == null)
			FlxG.save.data.donoteclick = false;

		if (FlxG.save.data.newInput != null && FlxG.save.data.lastversion == null)
			FlxG.save.data.lastversion = "pre-beta2";
		
		if (FlxG.save.data.newInput == null && FlxG.save.data.lastversion == null)
			FlxG.save.data.lastversion = "beta2";

		if (FlxG.save.data.leftKey == null)
			FlxG.save.data.leftKey = FlxKey.A;

		if (FlxG.save.data.downKey == null)
			FlxG.save.data.downKey = FlxKey.S;

		if (FlxG.save.data.upKey == null)
			FlxG.save.data.upKey = FlxKey.W;

		if (FlxG.save.data.rightKey == null)
			FlxG.save.data.rightKey = FlxKey.D;

		if (FlxG.save.data.practicemode == null)
			FlxG.save.data.practicemode = false;

		if (FlxG.save.data.botplay == null)
			FlxG.save.data.botplay = false;

		if (FlxG.save.data.preload == null)
			FlxG.save.data.preload = 1;
    }
}
