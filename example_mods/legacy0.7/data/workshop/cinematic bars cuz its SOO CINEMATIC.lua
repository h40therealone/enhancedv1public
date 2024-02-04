function onCreate()
	makeLuaSprite('bars', 'BARS', 0, 0);
	setScrollFactor('bars', 1, 1);
setObjectCamera("bars", 'hud')
	-- obselete so im gonna just remove the values
	if not lowQuality then
		makeLuaSprite('shader', '', -100, 0);
		setScrollFactor('', 1, 1);
		setObjectCamera("", 'hud')
	end

	addLuaSprite('bars', false);
	addLuaSprite('shader', false);
end