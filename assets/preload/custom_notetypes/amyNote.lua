function onCreate()
    makeLuaSprite('pink', 'pinkthing', 0, 0);
    setProperty('pink.alpha', 0.000001);
    setObjectCamera('pink', 'other');
    setBlendMode('pink', 'ADD');
    addLuaSprite('pink', true);

    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'amyNote' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'ROSENOTE_assets') --Replace with your own graphics
            setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true) --Hitting increases miss count
            setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0) --Doesn't damage when missed (now when hit)
            setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true) --Doesn't add miss if you don't hit
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'ROSENOTE_splashes');
            setPropertyFromGroup('unspawnNotes', i, 'offsetX', 36)
        end
    end
end

function noteMiss(id, d, noteType, sus) --noteMiss because hitting acts as a miss instead of a hit
    if noteType == 'amyNote' then
        setProperty('boyfriend.stunned', true);
        playAnim('boyfriend', 'hurt', true);
        setProperty('boyfriend.specialAnim', true);
        runTimer('stunned', 2, 1);
        playSound('giggle', 1);	
        doTweenAlpha('pinkThingShowsUp', 'pink', 1, 0.35);
    end
end

function onTimerCompleted(tag)
    if tag == 'stunned' then
        setProperty('boyfriend.stunned', false);
        setProperty('boyfriend.specialAnim', false);
        doTweenAlpha('pinkThingByeBye', 'pink', 0, 0.2);
    end
end