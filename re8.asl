/*
--------------------------------------
	Resident Evil Village
	Load Remover & Auto Splitter
	
	Official timing method for RE8 speedruns for PC.
	https://www.speedrun.com/re8
	
	Scipt & offsets pre WW_1.5 by CursedToast 05.26.2021
	SoR script & offsets post WW_1.5 by TheDementedSalad 01/12/2022
	Last updated 21/11/2023
	Maintained & Revamped by TheDementedSalad
--------------------------------------
*/


startup
{
	Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Basic");
	vars.Helper.Settings.CreateFromXml("Components/RE8.Settings.xml");
	
	// Asks user to change to game time if LiveSplit is currently set to Real Time.
		if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show (
            "This game uses In Game Time as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | Resident Evil Village",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question
        );

        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
}

init
{
	vars.firstCutsceneFinished = false;
	vars.startControlFlag = false;
	vars.completedSplits = new List<string>();
	vars.arrowKnee = false;
	vars.chrisStart = false;
	
	switch (modules.First().ModuleMemorySize)
	{
		case (646139904):
			version = "WW_1.4";
			break;
		case (219160576):
			version = "WW_1.9";
			break;
	}
}

start
{
	// Start the timer
	if (vars.firstCutsceneFinished && current.PauseState == 0)
	{
		// Reset values here so the timer actually starts
		vars.firstCutsceneFinished = false;
		vars.startControlFlag = true;
		
		// Start the timer
		return true;
	}
}

update
{
	// Reset variables when the timer is reset.
	if (timer.CurrentPhase == TimerPhase.NotRunning)
	{
		vars.startControlFlag = false;
		vars.completedSplits.Clear();
		vars.arrowKnee = false;
		vars.chrisStart = false;
	}

	// Prevent initial time bleed by starting the timer only after the cutscene with Mia on the sofa (player gains control of Ethan)
	if (current.Chapter == "Chapter1" || current.Chapter == "Chapter10_1")
	{
		if (current.CutsceneState == 2 && old.CutsceneState == 15 && !vars.startControlFlag)
		{
			vars.firstCutsceneFinished = true;
		}
	}
	
	// Uncomment debug information in the event of an update.
	//print(modules.First().ModuleMemorySize.ToString());
}

split
{
	// Item splits
	if (current.NewestItemHash != old.NewestItemHash)
	{
		vars.hashString = current.NewestItemHash.ToString();
		if (settings[vars.hashString] && !vars.completedSplits.Contains(vars.hashString))
		{
			vars.completedSplits.Add(vars.hashString);
			return true;
		}
	}
	
	// Event splits
	if (current.Event != old.Event)
	{
		// Lycan Defense
		if (settings["arrowKnee"] && !vars.arrowKnee)
		{
			if (current.Event == "c21e160_02" || current.Event == "c21e160_00" || current.Event == "c21e160_01" || current.Event == "c21e160_03")
			{
				vars.arrowKnee = true;
				return true;
			}
		}
			
		// Chris Start
		if (settings["chrisStart"] && !vars.chrisStart)
		{
			if (current.Event == "c31e000_00" || current.Event == "c31e100_04")
			{
				vars.chrisStart = true;
				return true;
			}
		}

		// All other events without variant IDs
		if (settings[current.Event] && !vars.completedSplits.Contains(current.Event))
		{
			vars.completedSplits.Add(current.Event);
			return true;
		}
	}
	
	// Map splits
	if (settings[current.Map] && !vars.completedSplits.Contains(current.Map)){
		vars.completedSplits.Add(current.Map);
		return true;
	}
		
		// Propellerman Splits
		else if (current.Chapter == "Chapter2_5")
		{
			if (old.Map == "st15_010_Passage_In1B" && current.Map == "st15_074_ScrapArea_In5B" && settings["propellerOne"])
			{
				if (!vars.completedSplits.Contains("propellerOne"))
				{
					vars.completedSplits.Add("propellerOne");
					return true;
				}
			}
				
			if (old.Map == "st15_042_Passage7_In3B" && current.Map == "st15_072_HallArea_In5B" && settings["propellerTwo"])
			{
				if (!vars.completedSplits.Contains("propellerTwo"))
				{
					vars.completedSplits.Add("propellerTwo");
					return true;
				}
			}
				
			if (old.Map == "st15_022_PropellerManFinal_In1B" && current.Map == "st15_018_ControlRoom_In1B" && settings["controlRoom"])
			{
				if (!vars.completedSplits.Contains("controlRoom"))
				{
					vars.completedSplits.Add("controlRoom");
					return true;
				}
			}
		}
}

isLoading
{
	if(settings["Rose"]){
		return current.CutsceneState == 15 || current.PauseState == 1 || current.LoadState != 0 || current.TimeBleed == 3;
	}
	
	else return current.CutsceneState == 15 || current.PauseState == 1 || current.LoadState != 0;
}

reset
{
	return current.View == "MainMenu" || current.View == "DLCRoot_GE/DLC05/DLC05_2/Chapter10MainMenu";
}
