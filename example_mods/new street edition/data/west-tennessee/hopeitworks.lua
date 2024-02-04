local davemode = getPropertyFromClass('ClientPrefs', 'davemode', true);
function onCreate()
    if davemode == true then
     loadSong(roads, 1)
    end
end