function onCreate()

	makeLuaSprite('background', 'house', -400, 100);
	setScrollFactor('background', 0.9, 0.9);
      scaleObject('background',1.5,1.5)
	
	addLuaSprite('background', false);
end