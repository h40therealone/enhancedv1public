function onCreate()
    --creates the grass sprites (foreground)
    makeLuaSprite('grass', 'backyard/ground', -300, -300)
    setScrollFactor('grass', 1.0, 1.0)

    --creates the gate sprites (midground)
    makeLuaSprite('gate', 'backyard/gate', -300, -300)
    setScrollFactor('gate', 0.8, 0.8)

    --creates the background hills sprites (background)
    makeLuaSprite('hills', 'backyard/hills', -300, -300)
    setScrollFactor('hills', 0.5, 0.5)

    --creates the sky sprites (far background)
    makeLuaSprite('sky', 'backyard/sky', -300, -300)
    setScrollFactor('sky', 0.2, 0.2)

    --scaling so it can fit.
    scaleObject('grass',0.9,0.9)
    scaleObject('sky',0.9,0.9)
    scaleObject('gate',0.9,0.9)
    scaleObject('hills',0.9,0.9)

    -- add sprites lol
    addLuaSprite('sky', false)
    addLuaSprite('hills', false)
    addLuaSprite('gate', false)
    addLuaSprite('grass', false)
end