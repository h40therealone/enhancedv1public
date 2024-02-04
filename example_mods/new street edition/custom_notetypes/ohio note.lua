function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'ohio note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'OHIONOTE_assets'); 
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '1'); --Health gained on note hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '#'); --Health lost on note miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false); --If true, hitting this note will cause a miss. If false, hitting this note will not cause a miss.
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --If you make a punishing note, set this to true to cause a miss to be added when this note is hit. Otherwise, set this to false.
			end
		end
	end
end
local add = 0
local subtract = 0
local divide = 0
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'ohio note' then
		if ohiotwn == true then
			playSound('notehit/osu', 0.6)

		add = add + 90
        doTweenAngle('NOOO', 'dad', add, 0.1, 0)
		subtract = subtract + math.random(1, 90)
		doTweenAngle('HUDS', 'camGame', subtract, 0.1, 0)
		divide = divide + 15
		doTweenAngle('HUDS2', 'camHUD', divide, 0.1, 0)
		else
			i = getRandomInt(1, 3)

      playSound('notehit/arcade'..i, 0.6)
		end
     end
  end