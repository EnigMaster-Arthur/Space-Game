package states;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

class GameOverState extends FlxState
{
	public var text = new FlxText();
	public var OneShot:Bool = true;
	public var isSwitching:Bool = false;

	override public function create()
	{
		text.text = 'GAME OVER\n\npress Enter to\ncontinue.';
		text.size = 32;
		text.alpha = 0;
		text.color = FlxColor.RED;
		text.y = 200;
		text.x = 160;

		super.create();
		add(text);
		FlxTween.tween(text, {"alpha": 1}, 1, {ease: FlxEase.quadInOut});
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
		if (FlxG.keys.justPressed.ENTER)
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
