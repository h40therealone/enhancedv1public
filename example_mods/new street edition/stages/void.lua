function onCreate()

	makeLuaSprite('background', 'secret/pad', -300, 0);
	setScrollFactor('background', 1, 1);
	
makeLuaSprite('lights', 'secret/lights', -300, 0);
	setScrollFactor('lights', 1, 1);
	

	if not lowQuality then
		makeLuaSprite('shader', 'secret/hudstuff', 0, 0);
		setScrollFactor('shader', 1, 1);
		setObjectCamera('shader', 'hud')
        scaleObject('shader',0.6667,0.6667)
	end
	addLuaSprite('background', false);
    addLuaSprite('lights', true);
	addLuaSprite('shader', true);
end