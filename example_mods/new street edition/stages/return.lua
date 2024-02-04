function onCreate()

	makeLuaSprite('background', 'return/returnBG', 0, 100);
	setScrollFactor('background', 0.9, 0.9);
      scaleObject('background',1.2,1.2)
	
	if not lowQuality then
		makeLuaSprite('shader', 'return/returnShader', 0, 0);
		setScrollFactor('shader', 1, 1);
		setObjectCamera('shader', 'hud')
	end
	addLuaSprite('background', false);
	addLuaSprite('shader', true);
end