local health = 1
local percent = 10

function onUpdate(elapsed)
    if sicon == true then 
        health = math.lerp(health, getProperty('health'), math.boundTo(elapsed * 10, 0, 1))
        percent = 1 - (health / 2)
    end
end

function onUpdatePost(elapsed)
    if sicon == true then 
        setProperty('iconP1.x', getProperty('healthBar.x') + (getProperty('healthBar.width') * percent) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
        setProperty('iconP2.x', getProperty('healthBar.x') + (getProperty('healthBar.width') * percent) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
    end
end

function math.lerp(a, b, ratio) 
    if sicon == true then 
        return a + ratio * (b - a) 
    end
end

function math.boundTo(value,min,max)
    if sicon == true then 
        local newValue = value
        if newValue < min then
            newValue = min
        elseif newValue > max then
            newValue = max
        end
        return newValue
    end
end