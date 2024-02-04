package states;
import flixel.text.FlxText;
import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;
class MenuItem extends FlxSprite {
    public var text:FlxText;

    public function new(x:Float, y:Float, label:String) {
        super(x, y);
        makeGraphic(150, 150, FlxColor.BLACK);
        text = new FlxText(0, 0, width, label);
        text.setFormat(null, 16, FlxColor.WHITE, "center", FlxColor.BLACK);
        text.screenCenter();
    }

    override public function draw():Void {
        super.draw();
        text.draw();
    }
}

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.7.2h'; // This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;

	var optionShit:Array<String> = [
		'story mode',
		'freeplay',
		'credits',
		//'awards', to be added later with proper implementation
		'options',
		'versions'

	];

	var magenta:FlxSprite;
	var camFollow:FlxObject;

	override function create()
	{
		#if MODS_ALLOWED
		Mods.pushGlobalMods();
		#end
		Mods.loadTopMod();

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		var logoBl:FlxSprite;
		bg.antialiasing = ClientPrefs.data.antialiasing;
		bg.scrollFactor.set(0, yScroll);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.antialiasing = ClientPrefs.data.antialiasing;
		magenta.scrollFactor.set(0, yScroll);
		magenta.setGraphicSize(Std.int(magenta.width * 1.175));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.color = 0xFFfd719b;
		add(magenta);
		
		logoBl = new FlxSprite(500, -150);
   logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
       logoBl.antialiasing = ClientPrefs.data.antialiasing;

    logoBl.animation.addByPrefix('bump', 'logo bumpin', 24, false);
    logoBl.animation.play('bump');
logoBl.updateHitbox();
logoBl.screenCenter(X);
logoBl.scale.set(0.7, 0.7);
add(logoBl);



		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		for (i in 0...optionShit.length)
		{
			var offset:Float = 200 - (Math.max(optionShit.length, 4) - 4) * 80;
			var spacing:Float = 200;
			var x:Float = (i * spacing) + offset;
			var y:Float = 0;

			var menuItemText:FlxText = new FlxText(x, y, 150, optionShit[i]);
			menuItemText.setFormat("VCR OSD Mono", 20, FlxColor.WHITE, "center");
            menuItemText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
			menuItems.add(menuItemText);
			menuItemText.screenCenter(Y);
			
		}

		var psychVer:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
		psychVer.scrollFactor.set();
		psychVer.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(psychVer);
		var fnfVer:FlxText = new FlxText(12, FlxG.height - 24, 0, "Street Edition Enhanced V1");
		fnfVer.scrollFactor.set();
		fnfVer.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(fnfVer);
		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		// Unlocks "Freaky on a Friday Night" achievement if it's a Friday and between 18:00 PM and 23:59 PM
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18)
			Achievements.unlock('friday_night_play');

		#if MODS_ALLOWED
		Achievements.reloadList();
		#end
		#end

		super.create();

		FlxG.camera.follow(camFollow, null, 0.15);
	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * elapsed;
			if (FreeplayState.vocals != null)
				FreeplayState.vocals.volume += 0.5 * elapsed;
		}

		if (!selectedSomethin)
		{
			if (controls.UI_LEFT_P)
				changeItem(-1);

			if (controls.UI_RIGHT_P)
				changeItem(1);

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'));
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{
					selectedSomethin = true;

					//if (ClientPrefs.data.flashing)
						//FlxFlicker.flicker(magenta, 0, 0, false);

					//FlxFlicker.flicker(menuItems.members[curSelected],0, 0, false, false, function(flick:FlxFlicker)
					{
						switch (optionShit[curSelected])
						{
							case 'story mode':
								MusicBeatState.switchState(new StoryMenuState());
							case 'freeplay':
								MusicBeatState.switchState(new FreeplayState());

							#if MODS_ALLOWED
							case 'versions':
								MusicBeatState.switchState(new ModsMenuState());
							#end

							#if ACHIEVEMENTS_ALLOWED
							case 'awards':
								MusicBeatState.switchState(new AchievementsMenuState());
							#end

							case 'credits':
								MusicBeatState.switchState(new CreditsState());
								case 'reborn':
								MusicBeatState.switchState(new OptionsState());
							case 'options':
								MusicBeatState.switchState(new OptionsState());
								OptionsState.onPlayState = false;
								if (PlayState.SONG != null)
								{
									PlayState.SONG.arrowSkin = null;
									PlayState.SONG.splashSkin = null;
									PlayState.stageUI = 'normal';
								}
						}
					};

					for (i in 0...menuItems.members.length)
					{
						if (i == curSelected)
							continue;
						FlxTween.tween(menuItems.members[i], {alpha: 0}, 0.4, {
							ease: FlxEase.quadOut,
							onComplete: function(twn:FlxTween)
							{
								menuItems.members[i].kill();
							}
						});
					}
				}
			}
			#if desktop
			if (controls.justPressed('debug_1'))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);
	}

	function changeItem(huh:Int = 0)
{
    FlxG.sound.play(Paths.sound('scrollMenu'));

    var currentItem:FlxSprite = menuItems.members[curSelected];
    currentItem.animation.play('idle');
    currentItem.scale.set(1, 1);
    currentItem.updateHitbox();
    currentItem.screenCenter(Y);

    curSelected += huh;

    if (curSelected >= menuItems.length)
        curSelected = 0;
    if (curSelected < 0)
        curSelected = menuItems.length - 1;
 
    var newItem:FlxSprite = menuItems.members[curSelected];
    newItem.animation.play('selected');
    newItem.scale.set(2.0, 2.0);
    newItem.centerOffsets();
    newItem.screenCenter(Y);

    camFollow.setPosition(newItem.getGraphicMidpoint().x,
        newItem.getGraphicMidpoint().y - (menuItems.length > 4 ? menuItems.length * 8 : 0));
}
}
