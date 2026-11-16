import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxAxes;
import flixel.addons.transition.FlxTransitionableState;
import funkin.backend.utils.DiscordUtil;

var bg:FlxSprite;
var stars:FlxSprite;
var stars2:FlxSprite;
var tablet:FlxSprite;
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

    tablet = new FlxSprite(0, 0);
    tablet.frames = Paths.getSparrowAtlas('menus/storymode/tablet2');
    tablet.animation.addByPrefix('idle', 'tablet', 2, true);
    tablet.animation.play('idle');
    tablet.setGraphicSize(Std.int(tablet.width * (FlxG.height / tablet.height)), FlxG.height);
    tablet.updateHitbox();
    tablet.screenCenter();
    add(tablet);
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

    if (FlxG.keys.justPressed.ESCAPE || FlxG.keys.justPressed.BACKSPACE) {
        FlxG.switchState(new ModState('custom/mainmenu'));
    }
}