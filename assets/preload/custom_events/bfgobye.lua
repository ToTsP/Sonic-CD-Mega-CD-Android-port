bfidle = 0

function onEvent(name, value1, value2)
    if name == "bfgobye" then
        makeAnimatedLuaSprite('bff', 'characters/bfgobye', 900, 510);
	    addAnimationByPrefix('bff', 'idle', 'bf idle', 12, false);
        addAnimationByPrefix('bff', 'hit', 'bf hit', 12, false);
        scaleObject('bff', 9, 9)
        setProperty('bff.antialiasing', false);
        addLuaSprite('bff', true);
        runTimer('thingy', 2.2, 1)
    end
end

function onTimerCompleted(tag, loops, loopsleft)
    objectPlayAnimation('bff', 'hit');
    doTweenX('thingy', 'bff', 1300, 0.6, elasticIn)
end

function onTweenCompleted(tag)
    bfidle = 1
end


function onBeatHit()
    if bfidle == 1 then
        if curBeat % 2 == 0 then
         objectPlayAnimation('bff', 'idle');
        end
    end
end