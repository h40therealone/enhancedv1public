function onCreate()

	makeLuaSprite('credit','credit_bars/misinfo',0,200)
	addLuaSprite('credit',false)
	scaleObject('credit', 1, 1)
      setObjectCamera('credit', 'hud')
end
function onSongStart()
      doTweenAlpha('credittween', 'credit', 0, 0.5, 0 )
	
end

