function onCreate()
    --creates the court sprites (foreground)
    makeLuaSprite('ground', 'city/ground', -700, -600)
    setScrollFactor('grass', 1.0, 1.0)


    --creates the gate sprites (midground)
    makeLuaSprite('gate', 'city/gate', -700, -300)
    setScrollFactor('gate', 0.8, 0.8)

    --creates the background city sprites (background)
    makeLuaSprite('city', 'city/city', -300, -35)
    setScrollFactor('city', 0.5, 0.5)

    --creates the sky sprites (far background)
    makeLuaSprite('sky', 'city/sky', -300, -300)
    setScrollFactor('sky', 0.2, 0.2)

    --scaling
    scaleLuaSprite("ground", 2.0, 2.0)
    scaleLuaSprite("gate", 2.0, 1.5)
    scaleLuaSprite("city", 1.5, 1.5)
    scaleLuaSprite("sky", 1.5, 1.5)

    -- add sprites lol
    addLuaSprite('sky', false)
    addLuaSprite('city', false)
    addLuaSprite('gate', false)
    addLuaSprite('ground', false)
end

