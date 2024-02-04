function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'stop note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'STOPNOTE_assets'); 
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '2'); --Health gained on note hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Health lost on note miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false); --If true, hitting this note will cause a miss. If false, hitting this note will not cause a miss.
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --If you make a punishing note, set this to true to cause a miss to be added when this note is hit. Otherwise, set this to false.
			end
		end
	end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'stop note' then
		end
     end