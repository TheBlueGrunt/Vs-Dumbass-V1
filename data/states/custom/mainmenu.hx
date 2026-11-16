import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxAxes;
import flixel.addons.transition.FlxTransitionableState;
import funkin.options.OptionsMenu;
import funkin.editors.EditorPicker;
import funkin.menus.ModSwitchMenu;
import funkin.backend.utils.DiscordUtil;
import funkin.backend.chart.Chart;

var bg:FlxSprite;
var stars:FlxSprite;
var stars2:FlxSprite;
var ref:FlxSprite;
var bfshit:FlxSprite;
var tablet:FlxSprite;

var btnPlay:FlxSprite;
var btnFreeplay:FlxSprite;
var btnSettings:FlxSprite;
var btnCosmic:FlxSprite;

var scrollSpeed:Float = 40;

function create() {
    FlxG.mouse.visible = true;

    bg = new FlxSprite(0, 0);
    bg.loadGraphic(Paths.image('menus/main/space'));
    bg.setGraphicSize(Std.int(bg.width * (FlxG.height / bg.height)), FlxG.height);
    bg.updateHitbox();
    bg.screenCenter();
    add(bg);

    stars = new FlxSprite(0, 0);
    stars.loadGraphic(Paths.image('menus/main/Stars'));
    stars.setGraphicSize(Std.int(stars.width * (FlxG.height / stars.height)), FlxG.height);
    stars.updateHitbox();
    stars.screenCenter(FlxAxes.Y);
    add(stars);

    stars2 = new FlxSprite(0, 0);
    stars2.loadGraphic(Paths.image('menus/main/Stars'));
    stars2.setGraphicSize(Std.int(stars2.width * (FlxG.height / stars2.height)), FlxG.height);
    stars2.updateHitbox();
    stars2.screenCenter(FlxAxes.Y);
    stars2.x = stars.x - stars.width;
    add(stars2);

    bfshit = new FlxSprite(0, 0);
    bfshit.loadGraphic(Paths.image('menus/main/bfshit'));
    bfshit.setGraphicSize(Std.int(bfshit.width * (FlxG.height / bfshit.height)), FlxG.height);
    bfshit.updateHitbox();
    bfshit.screenCenter();
    add(bfshit);

    tablet = new FlxSprite(0, 0);
    tablet.frames = Paths.getSparrowAtlas('menus/main/Tablet');
    tablet.animation.addByPrefix('idle', 'mainmenuhud', 2, true);
    tablet.animation.play('idle');
    tablet.setGraphicSize(Std.int(tablet.width * (FlxG.height / tablet.height)), FlxG.height);
    tablet.updateHitbox();
    tablet.screenCenter();
    add(tablet);

    btnPlay = new FlxSprite(0, 310);
    btnPlay.loadGraphic(Paths.image('menus/main/play'));
    btnPlay.screenCenter(FlxAxes.X);
    add(btnPlay);

    btnFreeplay = new FlxSprite(650, 440);
    btnFreeplay.loadGraphic(Paths.image('menus/main/freeplay'));
    add(btnFreeplay);

    btnSettings = new FlxSprite(650, 575);
    btnSettings.loadGraphic(Paths.image('menus/main/settings'));
    add(btnSettings);

    btnCosmic = new FlxSprite(350, 440);
    btnCosmic.loadGraphic(Paths.image('menus/main/play'));
    btnCosmic.scale.y = 2.1;
    btnCosmic.updateHitbox();
    btnCosmic.color = 0xFFFF0000;
    add(btnCosmic);
}

function update(elapsed:Float) {
    stars.x += scrollSpeed * elapsed;
    stars2.x += scrollSpeed * elapsed;

    if (stars.x >= FlxG.width) {
        stars.x = stars2.x - stars.width;
    }
    if (stars2.x >= FlxG.width) {
        stars2.x = stars.x - stars2.width;
    }

    if (FlxG.keys.justPressed.SEVEN)
        openSubState(new EditorPicker());

    if (controls.SWITCHMOD)
        openSubState(new ModSwitchMenu());

    if (FlxG.mouse.justPressed) {
        if (FlxG.mouse.overlaps(btnPlay)) {
            FlxG.sound.play(Paths.sound('confirmMenu'));
            FlxG.switchState(new ModState("custom/storymode"));
        } else if (FlxG.mouse.overlaps(btnFreeplay)) {
            FlxG.sound.play(Paths.sound('confirmMenu'));
            FlxG.switchState(new FreeplayState());
        } else if (FlxG.mouse.overlaps(btnSettings)) {
            FlxG.sound.play(Paths.sound('confirmMenu'));
            FlxG.switchState(new OptionsMenu());
        } else if (FlxG.mouse.overlaps(btnCosmic)) {
            FlxG.sound.play(Paths.sound('confirmMenu'));
            // FlxG.switchState(new CosmicState());
        }
    }
}