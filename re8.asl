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

state("re8", "WW_1.9")
{
	byte LoadState		:	0xC4A2828, 0xE1;									//Same pointer as View & same offsets as old updates
	byte PauseState		:	0xC4EC0E8, 0x48;									//Does not change until you gain control of Ethan again						
	byte TimeBleed		:	0xC4A2820, 0x84;									//Fixes Some Timebleed in Shadows of Rose. 2 in game 3 during cutscene after Eveline in Ethans House
	uint CutsceneState	:	0xC4A02C0, 0x10;									//15 in cutscene, 2 not in cutscene
	uint NewestItemHash	:	0xC4A2690, 0x60, 0x18, 0x10, 0x20, 0x58, 0x3C;		//Find ammo count and pointerscan with 4C as final offset. Find closest pointers and then change them to the ones to the left of here from old updates
	string128 Chapter	:	0xC4A2828, 0x60, 0x14;								//Same pointer as View & same offsets as old updates
	string128 View		:	0xC4A2828, 0x58, 0x14;								//AOB Scan 4D 00 61 00 78 00 48 00 44 00 52 00 42 00 72 00 69 00 67 00 68 00 74 00 6E 00 65 00 73 00 73 when on the main menu, then move address forward until it says MainMenu
	string128 Map		:	0xC4A2588, 0x180, 0x248, 0x28, 0x14;				//First map is st01_000_Home1FGarden_00 (UTF-16 String), same offsets as old updates			
	string128 Event		:	0xC4A25A8, 0x58, 0x68, 0x40, 0x30, 0x14;			//AOB Scan 63 00 31 00 30 00 65 00 30 00 30 00 31 00 5F 00 30 00 30 00 00 00 00 00 00 00 00 00 one of these is the correct one
}

state("re8", "WW_1.4")
{
	byte LoadState		:	0xA06CA58, 0xE1;
	byte PauseState		:	0xA0583D8, 0x48;
	byte gameState		:	0xA067CB8, 0x8;
	uint CutsceneState	:	0xA0306D8, 0x10;
	uint NewestItemHash	:	0xA06C8E0, 0x60, 0x18, 0x10, 0x20, 0x58, 0x3C;
	string128 Chapter	:	0xA06CA58, 0x60, 0x14;
	string128 View		:	0xA06CA58, 0x58, 0x14;
	string128 Map		:	0xA06C7E0, 0x180, 0x248, 0x28, 0x14;
	string128 Event		:	0xA03D388, 0x58, 0x68, 0x40, 0x30, 0x14;
}

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
		case (628158464):
			version = "CeroD_1.0";
			break;
		case (620384256):
			version = "Promo_1.0";
			break;
		case (620728320):
			version = "WW_1.1";
			break;
		case (629379072):
			version = "WW_1.2";
			break;
		case (624750592):
			version = "WW_1.2";
			break;
		case (639950848):
			version = "WW_1.3";
			break;
		case (646139904):
			version = "WW_1.4";
			break;
		case (628748288):
			version = "WW_1.5";
			break;
		case (617246720):
			version = "WW_1.6";
			break;
		case (631308288):
			version = "WW_1.7";
			break;
		case (218947584):
		case (219156480):
			version = "WW_1.8";
			break;
		case (219160576):
			version = "WW_1.9";
			break;
		case (640962560):
		default:
			version = "WW_1.0";
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
