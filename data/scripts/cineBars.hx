var barTop:FlxSprite;
var barBottom:FlxSprite;

function create() {
    var camCinematics:FlxCamera = new FlxCamera();
    camCinematics.bgColor = 0;
    FlxG.cameras.remove(camHUD, false);
    FlxG.cameras.add(camCinematics, false);
    FlxG.cameras.add(camHUD, false);

    barTop = new FlxSprite(0, -FlxG.height).makeSolid(FlxG.width * 2, FlxG.height, FlxColor.BLACK);
    barBottom = new FlxSprite(0, FlxG.height).makeSolid(FlxG.width * 2, FlxG.height, FlxColor.BLACK);

    for (bars in [barTop, barBottom]) {
        bars.cameras = [camCinematics];
        bars.screenCenter(FlxAxes.X);
        add(bars);
    }
}

public static function cinematicBars(show:Bool = false, ?time:Float = 1, ?position:Float = 3.35) {
    FlxTween.cancelTweensOf(barTop);
    FlxTween.cancelTweensOf(barBottom);

    if (show) {
        FlxTween.tween(barTop, {y: -FlxG.height + ((FlxG.height / 2) / position)}, time, {ease: FlxEase.quadOut});
        FlxTween.tween(barBottom, {y: FlxG.height - ((FlxG.height / 2) / position)}, time, {ease: FlxEase.quadOut});
    } else {
        FlxTween.tween(barTop, {y: -FlxG.height}, time, {ease: FlxEase.quadOut});
        FlxTween.tween(barBottom, {y: FlxG.height}, time, {ease: FlxEase.quadOut});
    }
}