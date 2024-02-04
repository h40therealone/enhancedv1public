local health = 1
local percent = 10
function onUpdate(elapsed)
	health = math.lerp(health, getProperty('health'), math.boundTo(elapsed * 10, 0, 1))
	percent = 1 - (health / 2)
end

function onUpdatePost(elapsed)
	setProperty('iconP1.x', getProperty('healthBar.x') + (getProperty('healthBar.width') * percent) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
	setProperty('iconP2.x', getProperty('healthBar.x') + (getProperty('healthBar.width') * percent) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
end

function math.lerp(a, b, ratio) 
    return a + ratio * (b - a) 
end

function math.boundTo(value,min,max)
    local newValue = value
    if newValue < min then
        newValue = min
    elseif newValue > max then
        newValue = max
    end
    return newValue
end