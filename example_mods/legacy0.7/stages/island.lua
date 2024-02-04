--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'island/waterNsky', 0, 0);
	setScrollFactor('stageback', 0.9, 0.9);	

	makeLuaSprite('sand', 'island/sand', 0, 0);
	setScrollFactor('sand', 0.9, 0.9);
	scaleObject('sand', 1.1, 1.1);
	
	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('trees', 'island/trees', 0, 0);
		scaleObject('trees', 1.1, 1.1);
	makeLuaSprite('sign', 'island/sign', 0, 0);
		setScrollFactor('sign', 1.3, 1.3);
		scaleObject('sign', 1.1, 1.1);
		makeLuaSprite('cloud', 'island/cloud', -300, 0);
	setScrollFactor('cloud', 1, 1);
	scaleObject('cloud', 0.5, 0.5);
	doTweenX('funnytween', 'cloud', 7000, 100, 0 ) 			
	end
	

	addLuaSprite('stageback', false);
	addLuaSprite('sand', false);
	addLuaSprite('trees', false);
	addLuaSprite('cloud', false)
	addLuaSprite('sign', false)

end
