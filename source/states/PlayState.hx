package states;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	public var player = new FlxSprite();
	public var stamina:Int;
	public var staminaText = new FlxText();
	public var switchStuff:Int = 50;

	override public function create()
	{
		player.loadGraphic('assets/images/player.png');
		player.screenCenter(X);
		player.y = 540;
		player.angle = 0;

		staminaText.text = 'Life: ${stamina}';
		staminaText.size = 32;
		staminaText.y = 10;
		staminaText.x = 450;
		staminaText.color = FlxColor.WHITE;
		super.create();
		stamina = 1000;
		add(player);
		add(staminaText);
		FlxTween.tween(player, {x: player.x, y: 75}, 2, {ease: FlxEase.quartOut});
	}

	override public function update(elapsed:Float)
	{
		checkKeys();
		checkStamina();
		super.update(elapsed);
	}

	public function checkKeys()
	{
		if (FlxG.keys.pressed.UP)
		{
			player.angle = 0;
			player.y -= 2;
			stamina -= 2;
		}
		if (FlxG.keys.pressed.DOWN)
		{
			player.angle = 180;
			player.y += 2;
			stamina -= 2;
		}
		if (FlxG.keys.pressed.RIGHT)
		{
			player.angle = 90;
			player.x += 2;
			stamina -= 2;
		}
		if (FlxG.keys.pressed.LEFT)
		{
			player.angle = -90;
			player.x -= 2;
			stamina -= 2;
		}
		if (FlxG.keys.justPressed.SPACE)
		{
			stamina += 500;
		}
	}

	public function checkStamina()
	{
		staminaText.text = 'Life:${stamina}';
		if (stamina <= 0)
		{
			checkSwitch();
			staminaText.color = FlxColor.RED;
			FlxTween.tween(player, {x: player.x, y: 500}, 0.5, {ease: FlxEase.quadIn});
		}
	}

	public function checkSwitch()
	{
		if (switchStuff == 0)
		{
			FlxG.switchState(new GameOverState());
		}
		else
		{
			switchStuff -= 1;
		}
	}
}
