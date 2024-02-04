function onUpdate(elapsed)
    misses = getProperty('songMisses')
        if misses >4 then
            setProperty('health', 0)
        end
    end