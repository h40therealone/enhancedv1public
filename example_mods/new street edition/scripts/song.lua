function onCreate()
    setProperty('timeBarBG.visible', false)
    setProperty('timeBar.visible', false)
    makeLuaText('songName', songName:gsub('-', ' '), 0, 4)
    setProperty('songName.y', screenHeight - getProperty 'songName.height')
    setProperty('songName.borderSize', 1.25)
    setTextAlignment('songName', 'left')
    addLuaText 'songName'
        setProperty('songName.y', getProperty'songName.y' - 1)
end