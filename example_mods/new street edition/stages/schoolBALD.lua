function onCreate()
	-- actual bg
	makeLuaSprite('background', 'kool', -300, 0);
	setScrollFactor('background', 1, 1);

scaleObject('background',1.5,1.5)
setProperty("tag.antialiasing", false)
	
	

	-- obselete so im gonna just remove the values
	if not lowQuality then
		makeLuaSprite('shader', '', -100, 0);
		setScrollFactor('', 1, 1);
		setObjectCamera("", 'hud')
	end

	addLuaSprite('background', false);
	addLuaSprite('shader', false);
end