function onCreate()
      if realityindic == true then
	makeLuaSprite('realityindicator','reality/666',0,550)
	scaleObject('realityindicator', 1, 1)
      setObjectCamera('realityindicator', 'hud')
      addLuaSprite('realityindicator',false)
else
  --aint gonna do nothin
end
function onSongStart()
      doTweenAlpha('change opacity', 'realityindicator', 0.5, 0.5, 0 )
end
end