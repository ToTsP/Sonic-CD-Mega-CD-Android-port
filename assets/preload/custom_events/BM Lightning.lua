function onEvent(n,v1,v2)


	if n == 'BM Lightning' then

	   makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'ffffff')
	      addLuaSprite('flash', false);
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
	      setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,v1,'linear')

		makeLuaSprite('bm', 'batmanbglight', -840, -900);
		addLuaSprite('bm', false);
		setProperty('bm.alpha',1)
		scaleObject('bm', 1.3, 1.3);
		doTweenAlpha('bmlight','bm',0,0.2,'linear')
	end



end