function onCreate()
    --creates light
    makeLuaSprite('lite', 'city/skyscraper_lights', -300, -35)
    setScrollFactor('lite', 0.5, 0.5)

    scaleLuaSprite("lite", 1.5, 1.5)

    addLuaSprite('lite', false)


end



function onEvent(name,value1,value2)
    if name == 'CITY_lights' then
        if value2 == '' then
            setProperty('lite.alpha', value1)
        else
            doTweenAlpha('alpha', 'lite', tonumber(value1), tonumber(value2), 'sineInOut')
        end
    end
end

function onTweenCompleted(name)
    if name == 'alpha' then
        setProperty('lite.alpha', getProperty('lite.alpha'))
    end
end