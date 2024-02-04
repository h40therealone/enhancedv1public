package options;

class SongSpecSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Song specific settings';
		rpcTitle = 'SS SETTINGS'; //for Discord Rich Presence
		//any one whos looking here to see how I did it, I copied the code form the other options also btw, song specific means the
		//options will only change if that specific song is playing.

		var option:Option = new Option('Ohio Tweens', //Name
		'(oklahoma) when enabled when you hit an ohio note in the song it will tween the camera at random and more.', //Description
		'ohiotwn', //Save data variable name
		'bool'); //Variable type
		addOption(option);

		var option:Option = new Option('Reality Indicator', //Name
		'(global) only visual, does not affect gameplay', //Description
		'realityindic', //Save data variable name
		'bool'); //Variable type
		addOption(option);

		var option:Option = new Option('smooth icons', //Name
		'(global) makes the icons move way smoother, probaly even more precise.', //Description
		'sicon', //Save data variable name
		'bool'); //Variable type
		addOption(option);
	
super();

	}
}
        