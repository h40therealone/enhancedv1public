function onEvent(name,value1,value2)
    if name == "Set Cam Angle" then       
            doTweenAngle('angle','camHUD',tonumber(value1),tonumber(value2),'sineInOut')
            doTweenAngle('angle2','camGame',tonumber(value1),tonumber(value2),'sineInOut')
    end     
end
function onTweenCompleted(name)
if name == 'angle2' then
       setProperty("defaultCamAngle",getProperty('camGame.angle')) 
       if name == 'angle' then
       setProperty("defaultCamAngle",getProperty('camHUD.angle')) 
end
end
end