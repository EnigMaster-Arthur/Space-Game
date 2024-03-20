package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class InitState extends FlxState
{
	public var text = new FlxText();
	public var isSwitching:Bool;
	public var OneShot:Bool;

	override public function create()
	{
		text.text = 'Press SPACE to start!';
		text.screenCenter(Y);
		text.x = 0 + 160;
		text.size = 32;
		text.alpha = 1;
		super.create();
		isSwitching = false;
		OneShot = true;
		add(text);
	}

	override public function update(elapsed:Float)
	{
		if (isSwitching)
		{
			if (OneShot)
			{
				startExit();
			}
		}
		else
		{
			checkSwitch();
		}
		if (text.alpha == 0)
		{
			FlxG.switchState(new PlayState());
		}
	}

	public function checkSwitch()
	{
		if (FlxG.keys.justPressed.SPACE)
		{
			isSwitching = true;
		}
	}

	public function startExit()
	{
		OneShot = false;
		FlxTween.tween(text, {"alpha": 0}, 0.5, {ease: FlxEase.quadIn});
	}
}
