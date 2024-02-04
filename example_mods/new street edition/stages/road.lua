function onCreate()
	-- actual bg
	makeLuaSprite('background', 'reality1/street', -300, 0);
	setScrollFactor('background', 1, 1);

scaleObject('background',1.5,1.5)
setProperty("tag.antialiasing", false)
	
	addLuaSprite('background', false);
end