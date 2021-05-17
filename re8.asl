//Village Load Removal - BETA. NO RUN IS WR WITH THIS TIMER YET!!!
//By CursedToast 05/16/2021
//Last updated 05/16/2021

state("re8", "1.0")
{
	int GameState : "re8.exe", 0xA19E058, 0x40;
	uint CutsceneState : "re8.exe", 0x0A17FAC8, 0x10;
	byte PauseState : "re8.exe", 0xA19E058, 0x48;
}

init
{
	vars.firstCutsceneFinished = 0;
}

start
{
	if (vars.firstCutsceneFinished == 1 && current.PauseState == 0)
	{
		vars.firstCutsceneFinished = 0;
		return true;
	}
}

update
{
	// Prevent initial time bleed by starting the timer only after the paused state is also false.
	if (current.CutsceneState == 2 && old.CutsceneState == 15)
	{
		vars.firstCutsceneFinished = 1;
	}
}

isLoading
{
	return current.CutsceneState == 15 || current.PauseState == 1 || current.GameState == 2;
}
