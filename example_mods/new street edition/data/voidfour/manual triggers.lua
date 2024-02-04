function onCreate()
    setProperty('healthBar.alpha', tonumber(0))
    setProperty('healthBarOverlay.alpha', tonumber(0))
    setProperty('iconP1.alpha', tonumber(0))
    setProperty('iconP2.alpha', tonumber(0))
    setProperty('timeBar.alpha', tonumber(0))    
    setProperty('timeBarBG.alpha', tonumber(0))    
        end
function onStartCountdown()
doTweenAlpha("camgametween", "camGame", 0, 0.6, "linear")
end
function onStepHit()
    if curStep == 128 then
        doTweenAlpha("camgametweenback", "camGame", 1, 0.1, "linear")
        setProperty('healthBar.alpha', tonumber(1))
        setProperty('healthBarOverlay.alpha', tonumber(1))
        setProperty('iconP1.alpha', tonumber(1))
        setProperty('iconP2.alpha', tonumber(1))                
    end
   end
