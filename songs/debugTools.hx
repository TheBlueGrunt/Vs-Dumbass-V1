// THIS IS USED JUST FOR TESTING EVENTS QUICKLY
// IT WILL BE DISABLED IN THE FINAL BUILD
import funkin.game.PlayState;
import funkin.editors.charter.Charter;
import funkin.editors.character.CharacterEditor;

import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;

static var curBotplay:Bool = false;
public var botplayTxt:FlxText;

function postCreate() {
    botplayTxt = new FlxText(400, strumLines.members[0].members[0].y + 35, FlxG.width - 800, "BOTPLAY", 32);
    botplayTxt.setFormat(scoreTxt.font, 32, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    botplayTxt.visible = curBotplay;
    botplayTxt.borderSize = 1.25;
    botplayTxt.camera = camHUD;
    add(botplayTxt);
}

var shizz:Float = 1;
function update(elapsed:Float) {
    updateBotplay(elapsed);
    
    if (startingSong || !canPause || paused || health <= 0) return;

    if (generatedMusic && FlxG.keys.justPressed.ONE)
		endSong();

    if (FlxG.keys.pressed.TWO) updateSpeed(true);
    if (FlxG.keys.justReleased.TWO) {
        updateSpeed(false);
        player.cpu = true;
    }
    if (FlxG.keys.justReleased.THREE)
        FlxG.timeScale = Conductor.pitch = 0.4;

    if (FlxG.keys.justPressed.SEVEN)
        FlxG.switchState(new Charter(PlayState.SONG.meta.name, PlayState.difficulty, PlayState.variation, true));
    if (FlxG.keys.justPressed.EIGHT)
        FlxG.switchState(new CharacterEditor(dad.curCharacter));
}

public var botplaySine:Float = 0;
function updateBotplay(elapsed:Float) {
    if (FlxG.keys.justPressed.FOUR) curBotplay = !curBotplay;
    for(strumLine in strumLines)
        if(!strumLine.opponentSide)
            strumLine.cpu = FlxG.keys.pressed.TWO || curBotplay;

    botplayTxt.visible = curBotplay;
    
    if (!curBotplay) return;

    botplaySine += 180 * elapsed;
    botplayTxt.alpha = 1 - Math.sin((Math.PI * botplaySine) / 180);
}

function updateSpeed(fast:Bool) {
    FlxG.timeScale = Conductor.pitch = (player.cpu = fast) ? 3 : shizz;

    for (i in 0...strumLines.length) 
        strumLines.members[i].vocals.pitch = FlxG.timeScale;
}

function onGamePause() updateSpeed(false);
function onSongEnd() updateSpeed(false);
function destroy() {FlxG.timeScale = 1;}

if (release) disableScript();