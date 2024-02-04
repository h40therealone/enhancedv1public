function onCreate()
    makeLuaText('txt', 'Original composition: In the Hall of the Mountain King by Edvard Grieg, dave sprites bf sprites and background by h40', 275, 0, 225)
    setTextFont('txt', 'pixel.otf')
    setTextColor('txt', '0xFFFF00')
    setTextSize('txt', 25);
    --setTextAlignment('txt', 'center')
    setObjectCamera("txt", 'hud');
    addLuaText('txt')
    makeLuaSprite("black", 'beep', 0, 200)
    addLuaSprite("black", false)
    setObjectCamera("black", 'hud');
    scaleObject("black", 1, 2.5)
    setProperty('black.alpha', 0.5)
end
function onSongStart()
    doTweenAlpha('txttween', 'txt', 0, 2, 0 )
    doTweenAlpha('fadeobjectA', 'black', 0, 2, 0 )
end
