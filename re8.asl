//Village Load Removal - BETA. NO RUN IS WR WITH THIS TIMER YET!!!
//By CursedToast 05/22/2021
//Last updated 05/22/2021

state("re8", "1.0")
{
	int GameState : "re8.exe", 0xA19E058, 0x40;
	uint CutsceneState : "re8.exe", 0x0A17FAC8, 0x10;
	byte PauseState : "re8.exe", 0xA19E058, 0x48;
	string128 Chapter : "re8.exe", 0x0A1B1DE8, 0x60, 0x14;
	string128 View : "re8.exe", 0x0A1B1DE8, 0x58, 0x14;
	string128 Map : "re8.exe", 0x0A1B1B70, 0x90, 0x14;
	uint NewestItemHash : "re8.exe", 0xA1B1C70, 0x60, 0x18, 0x10, 0x20, 0x58, 0x3C;
}

startup
{
	settings.Add("items", true, "Item Splits");
	settings.Add("village", true, "Village", "items");
	settings.Add("1664342338", false, "Bolt Cutters", "village");
	settings.Add("3619364444", false, "Maiden Crest", "village");
	settings.Add("3219462766", false, "Screwdriver", "village");
	settings.Add("1132688171", false, "Demon Crest", "village");
	settings.Add("1093531362", false, "Jack Handle", "village");
	settings.Add("808039580", false, "Winged Key", "village");
	settings.Add("185799830", false, "Four-Winged Key", "village");
	
	settings.Add("castle", true, "Dimitrescu", "items");
	settings.Add("2183898626", false, "Maroon Eye Ring", "castle");
	settings.Add("1787578325", false, "Maroon Eye", "castle");
	settings.Add("2685023068", false, "Sanguis Virginis (Wine Bottle)", "castle");
	settings.Add("1354786552", false, "Courtyard Key", "castle");
	settings.Add("1738775830", false, "Dimitrescu's' Key", "castle");
	settings.Add("3513834249", false, "Mask of Sorrow", "castle");
	settings.Add("418018598", false, "Iron Insignia Key", "castle");
	settings.Add("2365661828", false, "Mask of Joy", "castle");
	settings.Add("314002296", false, "Mask of Rage", "castle");
	settings.Add("1344029762", false, "Mask of Pleasure", "castle");
	settings.Add("3784287352", false, "Mounted Animal Skull", "castle");
	settings.Add("3237773355", false, "Animal Skull", "castle");
	settings.Add("2309731541", false, "Dirty Flask (Head)", "castle");
	
	settings.Add("dollhouse", true, "Beneviento", "items");
	settings.Add("2896087978", false, "Blood Covered Ring", "dollhouse");
	settings.Add("2573570207", false, "Silver Key", "dollhouse");
	settings.Add("3856576850", false, "Winding Key", "dollhouse");
	settings.Add("895810843", false, "Wedding Ring", "dollhouse");
	settings.Add("2925641544", false, "Tweezers", "dollhouse");
	settings.Add("3542466670", false, "Film", "dollhouse");
	settings.Add("2554874516", false, "Scissors", "dollhouse");
	settings.Add("2564145014", false, "Brass Medallion", "dollhouse");
	settings.Add("1042056128", false, "Breaker Box Key", "dollhouse");
	settings.Add("988104371", false, "Relief of a Child", "dollhouse");
	settings.Add("709500517", false, "Fuse", "dollhouse");
	settings.Add("360286557", false, "Four-Winged Unborn Key", "dollhouse");
	settings.Add("2563213816", false, "Leg Flask", "dollhouse");
	
	
	settings.Add("fish", true, "Moreau", "items");
	settings.Add("3720810444", false, "Arm Flask", "fish");
	settings.Add("1142718375", false, "Crank", "fish");
	settings.Add("847933194", false, "Six-Winged Unborn Key", "fish");
	
	settings.Add("walterwhite", true, "Heisenberg", "items");
	settings.Add("719654765", false, "Torso Flask", "walterwhite");
	settings.Add("158765264", false, "Giant's Chalice", "walterwhite");
	settings.Add("1911895058", false, "Relief Mold", "walterwhite");
	settings.Add("1152567186", false, "Relief of a Horse", "walterwhite");
	settings.Add("1629499072", false, "Cog Mold", "walterwhite");
	settings.Add("1858058345", false, "Large Cog", "walterwhite");
	settings.Add("1876186812", false, "Key Mold", "walterwhite");
	settings.Add("4041096499", false, "Heisenberg's Key", "walterwhite");
	
	settings.Add("locations", true, "Location Splits");
	settings.Add("carCrash", false, "Car Crash Site", "locations");
	settings.Add("castlelocations", false, "Dimitrescu", "locations");
	settings.Add("reachedCastle", false, "Reached Castle", "castlelocations");
	settings.Add("reachedPrison", false, "Reached Prison", "castlelocations");
	settings.Add("reachedCourtyard", false, "Reached Courtyard", "castlelocations");
	settings.Add("reachedDistillery", false, "Reached Distillery", "castlelocations");
	settings.Add("reachedRoof", false, "Reached Roof", "castlelocations");
	settings.Add("reachedBeneviento", false, "Reached Beneviento House", "locations");
	
	settings.Add("factorylocations", false, "Factory", "locations");
	settings.Add("castingMachine", false, "Reached Casting Machine Room (First Time)", "factorylocations");
	settings.Add("bigFan", false, "Reached Big Fan (that will kill you)", "factorylocations");
	settings.Add("tankElevator", false, "Reached Elevator (with a TANK)", "factorylocations");
	
	
	settings.Add("events", true, "Event Splits");
	settings.Add("vampMommyStart", false, "Lady D. Boss Start", "events");
	settings.Add("propellerOne", false, "Escaped Propeller Man (First Time)", "events");
	settings.Add("propellerTwo", false, "Escaped Propeller Man (Second Time)", "events");
	settings.Add("controlRoom", false, "Reached Control Room (after killing Propeller Man)", "events");
	settings.Add("chrisEnd", false, "Chris Section Complete", "events");
	
	settings.Add("boss", true, "Boss Splits");
	settings.Add("understood", false, "I understand these splits won't work yet", "boss");
	settings.Add("vampMommyDies", false, "Lady D.", "understood");
	settings.Add("theBest", false, "Moreau (the best)", "understood");
	settings.Add("walterwhitefight", false, "Heisenberg", "understood");
	settings.Add("urias", false, "Urias", "understood");
	settings.Add("end", false, "Miranda (End)", "understood");
}

init
{
	vars.firstCutsceneFinished = false;
	vars.startControlFlag = false;
	vars.checkMaps = false;
	vars.completedSplits = new List<string>();
}

start
{
	if (vars.firstCutsceneFinished == true && current.PauseState == 0)
	{
		// Reset value here so the timer actually starts
		vars.firstCutsceneFinished = false;
		vars.startControlFlag = true;
		
		vars.checkMaps = true;
		
		// Start the timer
		return true;
	}
}

update
{
	// Reset variables when the timer is reset.
	if (timer.CurrentPhase == TimerPhase.NotRunning)
	{
		vars.checkMaps = false;
		vars.startControlFlag = false;
		vars.completedSplits.Clear();
	}
	
	// Prevent initial time bleed by starting the timer only after the paused state is also false.
	if (current.CutsceneState == 2 && old.CutsceneState == 15 && !vars.startControlFlag)
	{
		vars.firstCutsceneFinished = true;
	}
	
	// Chapter changed?
	if (current.Chapter != old.Chapter)
	{	
		// Should map checks process or be disabled to save unnecessary conditional checks?
		if (current.Chapter == "Chapter2_6" || current.Chapter == "Chapter2_7")
		{
			vars.checkMaps = false;
		}
		else if (current.Chapter == "Chapter2_2" || current.Chapter == "Chapter2_3" || current.Chapter == "Chapter2_4" || current.Chapter == "Chapter2_5")
		{
			vars.checkMaps = true;
		}
	}
}

split
{
	if (settings["items"] && current.NewestItemHash != old.NewestItemHash)
	{
		vars.hashString = current.NewestItemHash.ToString();
		if (current.NewestItemHash.ToString() == vars.hashString && !vars.completedSplits.Contains(vars.hashString) && settings[vars.hashString])
		{
			vars.completedSplits.Add(vars.hashString);
			return true;
		}
	}
	
	if (settings["locations"] && vars.checkMaps)
	{
		// Castle Location Splits
		if (current.Chapter == "Chapter2_2")
		{
			if (current.Map == "st11_010_EntranceHallB_In2F" && settings["reachedCastle"])
			{
				if (!vars.completedSplits.Contains("reachedCastle"))
				{
					vars.completedSplits.Add("reachedCastle");
					return true;
				}
			}
			
			if (current.Map == "st11_066_PrisonB_In1B" && settings["reachedPrison"])
			{
				if (!vars.completedSplits.Contains("reachedPrison"))
				{
					vars.completedSplits.Add("reachedPrison");
					return true;
				}
			}
			
			if (current.Map == "st11_092_Courtyard_Out" && settings["reachedCourtyard"])
			{
				if (!vars.completedSplits.Contains("reachedCourtyard"))
				{
					vars.completedSplits.Add("reachedCourtyard");
					return true;
				}
			}
			
			if (current.Map == "st11_074_BasementA_In1B" && settings["reachedDistillery"])
			{
				if (!vars.completedSplits.Contains("reachedDistillery"))
				{
					vars.completedSplits.Add("reachedDistillery");
					return true;
				}
			}
			
			if (current.Map == "st11_094_Roof_Out" && settings["reachedRoof"])
			{
				if (!vars.completedSplits.Contains("reachedRoof"))
				{
					vars.completedSplits.Add("reachedRoof");
					return true;
				}
			}
		}
		
		// Dollhouse Location Splits
		else if (current.Chapter == "Chapter2_3")
		{
			if (current.Map == "st14_001_Hall_In1F" && settings["reachedBeneviento"])
			{
				if (!vars.completedSplits.Contains("reachedBeneviento"))
				{
					vars.completedSplits.Add("reachedBeneviento");
					return true;
				}
			}
		}
		
		// Heisenberg Location Splits
		else if (current.Chapter == "Chapter2_5")
		{
			if (current.Map == "st15_060_CastingMachineRoom_In3B" && settings["castingMachine"])
			{
				if (!vars.completedSplits.Contains("castingMachine"))
				{
					vars.completedSplits.Add("castingMachine");
					return true;
				}
			}
			
			if (current.Map == "st15_030_BigFanArea_In2B" && settings["bigFan"])
			{
				if (!vars.completedSplits.Contains("bigFan"))
				{
					vars.completedSplits.Add("bigFan");
					return true;
				}
			}
			
			if (current.Map == "st15_005_TankShed_In1F" && old.Map == "st15_076_TankFactory_In5B" && settings["tankElevator"])
			{
				if (!vars.completedSplits.Contains("tankElevator"))
				{
					vars.completedSplits.Add("tankElevator");
					return true;
				}
			}
		}
		if (current.Chapter == "Chapter2_1" && settings["carCrash"] && !vars.completedSplits.Contains("carCrash"))
		{
			vars.completedSplits.Add("carCrash");
			return true;
		}
	}
	
	if (settings["events"])
	{
		// Castle Event Splits
		if (current.Chapter == "Chapter2_2")
		{
			if (current.Map == "st11_032_Chapel_In2F" && current.CutsceneState == 15 && settings["vampMommyStart"])
			{
				if (!vars.completedSplits.Contains("vampMommyStart"))
				{
					vars.completedSplits.Add("vampMommyStart");
					return true;
				}
			}
		}
		// Factory Event Splits
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
	else if (current.Chapter == "Chapter3_122" && settings["chrisEnd"])
	{
		if (!vars.completedSplits.Contains("chrisEnd"))
		{
			vars.completedSplits.Add("chrisEnd");
			return true;
		}
	}
}

isLoading
{
	return current.CutsceneState == 15 || current.PauseState == 1 || current.GameState == 2;
}


reset
{
	return current.View == "MainMenu";
}
