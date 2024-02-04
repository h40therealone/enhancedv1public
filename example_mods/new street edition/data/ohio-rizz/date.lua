function onCreate()
	makeLuaSprite('realityindicator','reality/63',0,550)
	scaleObject('realityindicator', 1, 1)
      setObjectCamera('realityindicator', 'hud')
      addLuaSprite('realityindicator',false)
      
end
function onSongStart()
      doTweenAlpha('change opacity', 'realityindicator', 0.5, 0.5, 0 )
end