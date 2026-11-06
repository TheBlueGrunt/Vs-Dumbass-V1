public var camMove:Bool = true;
public var camOffsetAmount:Float = 20;

function __updateCamOffset(character:Character) {
    switch(character.animation.curAnim.name) {
        case 'idle' | 'idle-loop' | 'idle-alt' | 'idle-alt-loop':
            if (camGame.angle != 0 && camAngling) camGame.angle = lerp(camGame.angle, 0, 0.05);
        case 'singLEFT' | 'singLEFT-loop' | 'singLEFT-alt' | 'singLEFT-alt-loop':
            camFollow.x -= camOffsetAmount;
            if (camGame.angle != -1 && camAngling) camGame.angle = lerp(camGame.angle, -1, 0.05);
        case 'singRIGHT' | 'singRIGHT-loop' | 'singRIGHT-alt' | 'singRIGHT-alt-loop':
            camFollow.x += camOffsetAmount;
            if (camGame.angle != 1 && camAngling) camGame.angle = lerp(camGame.angle, 1, 0.05);
        case 'singUP' | 'singUP-loop' | 'singUP-alt' | 'singUP-alt-loop':
            camFollow.y -= camOffsetAmount;
            if (camGame.angle != 0 && camAngling) camGame.angle = lerp(camGame.angle, 0, 0.05);
        case 'singDOWN' | 'singDOWN-loop' | 'singDOWN-alt' | 'singDOWN-alt-loop':
            camFollow.y += camOffsetAmount;
            if (camGame.angle != 0 && camAngling) camGame.angle = lerp(camGame.angle, 0, 0.05);
    }
}

function postUpdate() {
    if(!camMove) return;

    switch (curCameraTarget) {
        case 0:
            __updateCamOffset(dad);
        case 1:
            __updateCamOffset(boyfriend);
        case 2:
            __updateCamOffset(gf);
    }
}