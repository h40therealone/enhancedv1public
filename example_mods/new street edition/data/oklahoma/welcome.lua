function onCreate()
	makeLuaSprite('realityindicator','sign/sign2',0,0)
	scaleObject('realityindicator', 1, 1)
      setObjectCamera('realityindicator', 'hud')
      addLuaSprite('realityindicator',true)
      
      
end
function onSongStart()
      doTweenAlpha('change opacity', 'realityindicator', 0, 0.1, 0 )
end