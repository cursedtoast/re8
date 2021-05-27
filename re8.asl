//Village Load Remover and Auto Splitter. 
//Official timing method for RE8 speedruns on PC.
//By CursedToast 05/26/2021
//Last updated 05/26/2021

state("re8", "1.0")
{
	int GameState : "re8.exe", 0xA19E058, 0x40;
	uint CutsceneState : "re8.exe", 0x0A17FAC8, 0x10;
	byte PauseState : "re8.exe", 0xA19E058, 0x48;
	string128 Chapter : "re8.exe", 0x0A1B1DE8, 0x60, 0x14;
	string128 View : "re8.exe", 0x0A1B1DE8, 0x58, 0x14;
	string128 Map : "re8.exe", 0x0A1B1B70, 0x90, 0x14;
	uint NewestItemHash : "re8.exe", 0xA1B1C70, 0x60, 0x18, 0x10, 0x20, 0x58, 0x3C;
        string128 Event : "re8.exe", 0x0A182B38, 0x58, 0x60, 0x40, 0x80, 0x10, 0x10, 0x20, 0x28, 0x14;
}

startup
{
	settings.Add("village", true, "Village 1");
	settings.Add("roseBed", false, "Put Rose to Bed", "village");
	settings.Add("carCrash", false, "Car Crash Site", "village");
	settings.Add("1664342338", false, "Bolt Cutters", "village");
	settings.Add("arrowKnee", false, "Arrow to the Knee", "village");
	settings.Add("3619364444", false, "Maiden Crest", "village");
	settings.Add("3219462766", false, "Screwdriver", "village");
	settings.Add("1132688171", false, "Demon Crest", "village");
	settings.Add("meetWalterWhite", false, "Meet Heisenberg Cutscene", "village");
	
	settings.Add("castle", true, "Castle");
	settings.Add("reachedCastle", false, "Reached Castle", "castle");
	settings.Add("2183898626", false, "Maroon Eye Ring", "castle");
	settings.Add("1787578325", false, "Maroon Eye", "castle");
	settings.Add("reachedPrison", false, "Reached Prison", "castle");
	settings.Add("2685023068", false, "Sanguis Virginis (Wine Bottle)", "castle");
	settings.Add("1354786552", false, "Courtyard Key", "castle");
	settings.Add("reachedCourtyard", false, "Reached Courtyard", "castle");
	settings.Add("reachedDistillery", false, "Reached Distillery", "castle");
	settings.Add("1738775830", false, "Dimitrescu's' Key", "castle");
	settings.Add("418018598", false, "Iron Insignia Key", "castle");
	settings.Add("3513834249", false, "Mask of Sorrow", "castle");
	settings.Add("ethanHand", false, "Ethan Loses Hand Cutscene", "castle");
	settings.Add("2365661828", false, "Mask of Joy", "castle");
	settings.Add("reachedRoof", false, "Reached Roof", "castle");
	settings.Add("314002296", false, "Mask of Rage", "castle");
	settings.Add("1344029762", false, "Mask of Pleasure", "castle");
	settings.Add("3784287352", false, "Mounted Animal Skull", "castle");
	settings.Add("3237773355", false, "Animal Skull", "castle");
	settings.Add("vampMommyStart", false, "Lady D. Boss Start", "castle");
	settings.Add("vampMommyDies", false, "Lady D. Defeated", "castle");
	settings.Add("2309731541", false, "Dirty Flask (Head)", "castle");
	
	settings.Add("villageTwo", true, "Village 2");
	settings.Add("808039580", false, "Winged Key", "villageTwo");
	settings.Add("meetDuke", false, "Meet Duke Cutscene", "villageTwo");
	settings.Add("1093531362", false, "Jack Handle", "villageTwo");
	settings.Add("185799830", false, "Four-Winged Key", "villageTwo");
	
	settings.Add("dollhouse", true, "Beneviento");
	settings.Add("miaGraveyard", false, "Mia Graveyard Cutscene", "dollhouse");
	settings.Add("reachedBeneviento", false, "Reached Beneviento House", "dollhouse");
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
	settings.Add("escapedBaby", false, "Escaped Baby", "dollhouse");
	settings.Add("360286557", false, "Four-Winged Unborn Key", "dollhouse");
	settings.Add("2563213816", false, "Leg Flask", "dollhouse");
	
	settings.Add("fish", true, "Moreau");
	settings.Add("reachedWerewolf", false, "Werewolf Cutscene", "fish");
	settings.Add("3720810444", false, "Arm Flask", "fish");
	settings.Add("2844148845", false, "Boat Key", "fish");
	settings.Add("chrisFish", false, "Meet Chris Cutscene", "fish");
	settings.Add("1142718375", false, "Crank", "fish");
	settings.Add("theBest", false, "Moreau (the best) Defeated", "fish");
	settings.Add("847933194", false, "Six-Winged Unborn Key", "fish");
	
	settings.Add("walterwhite", true, "Heisenberg");
	settings.Add("719654765", false, "Torso Flask", "walterwhite");
	settings.Add("158765264", false, "Giant's Chalice", "walterwhite");
	settings.Add("meetHeisenbergFactory", false, "Meet Heisenberg Cutscene", "walterwhite");
	settings.Add("propellerOne", false, "Escaped Propeller Man (First Time)", "walterwhite");
	settings.Add("castingMachine", false, "Reached Casting Machine Room (First Time)", "walterwhite");
	settings.Add("1911895058", false, "Relief Mold", "walterwhite");
	settings.Add("1152567186", false, "Relief of a Horse", "walterwhite");
	settings.Add("propellerTwo", false, "Escaped Propeller Man (Second Time)", "walterwhite");
	settings.Add("1629499072", false, "Cog Mold", "walterwhite");
	settings.Add("1858058345", false, "Large Cog", "walterwhite");
	settings.Add("bigFan", false, "Reached Big Fan (that will kill you)", "walterwhite");
	settings.Add("1876186812", false, "Key Mold", "walterwhite");
	settings.Add("4041096499", false, "Heisenberg's Key", "walterwhite");
	settings.Add("controlRoom", false, "Reached Control Room (after killing Propeller Man)", "walterwhite");
	settings.Add("tankElevator", false, "Got on Tank", "walterwhite");
	
	settings.Add("chris", true, "Chris Section");
	settings.Add("chrisStart", false, "Chris Start", "chris");
	settings.Add("reachedTarget", false, "'Reached Target Location'", "chris");
	settings.Add("uriasChrisReached", false, "Urias Start", "chris");
	settings.Add("reachedMega", false, "Reached Megamycete", "chris");
	settings.Add("chrisEnd", false, "Chris End", "chris");
	
	settings.Add("finale", true, "Finale");
	settings.Add("mirandaStart", false, "Miranda Start", "finale");
	settings.Add("mirandaEnd", false, "Miranda Defeated (END)", "finale");
}

init
{
	vars.firstCutsceneFinished = false;
	vars.startControlFlag = false;
	vars.checkMaps = true;
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
		vars.checkMaps = true;
		vars.startControlFlag = false;
		vars.completedSplits.Clear();
	}
	
	// Prevent initial time bleed by starting the timer only after the paused state is also false.
	if (current.Chapter == "Chapter1")
	{
		if (current.CutsceneState == 2 && old.CutsceneState == 15 && !vars.startControlFlag)
		{
			vars.firstCutsceneFinished = true;
		}
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
	if (current.NewestItemHash != old.NewestItemHash)
	{
		vars.hashString = current.NewestItemHash.ToString();
		if (!vars.completedSplits.Contains(vars.hashString) && settings[vars.hashString])
		{
			vars.completedSplits.Add(vars.hashString);
			return true;
		}
	}
	
	// Car Crash
	if (current.Chapter == "Chapter2_1" && settings["carCrash"])
	{
		if (!vars.completedSplits.Contains("carCrash"))
		{
			vars.completedSplits.Add("carCrash");
			return true;
		}
	}
	
	// Event stuff
	
	if (current.Event != old.Event)
	{
		if (current.Event == "ch09_0000_c10e050_00_A" && settings["roseBed"])
		{
			if (!vars.completedSplits.Contains("roseBed"))
			{
				vars.completedSplits.Add("roseBed");
				return true;
			}
		}
		
		else if (current.Event == "ch01_0000_c21e160_02_A" && settings["arrowKnee"] || current.Event == "ch01_0000_c21e160_00_A" && settings["arrowKnee"] || current.Event == "sm81_117_c21e160_01_B" && settings["arrowKnee"])
		
		{
			if (!vars.completedSplits.Contains("arrowKnee"))
			{
				vars.completedSplits.Add("arrowKnee");
				return true;
			}
		}
		
		if (current.Map == "st11_032_Chapel_In2F" && settings["vampMommyStart"])
		{
			if (!vars.completedSplits.Contains("vampMommyStart"))
			{
				vars.completedSplits.Add("vampMommyStart");
				return true;
			}
		}
		
		else if (current.Event == "sm84_196_c21e510_00_A" && settings["meetWalterWhite"])
		{
			if (!vars.completedSplits.Contains("meetWalterWhite"))
			{
				vars.completedSplits.Add("meetWalterWhite");
				return true;
			}
		}
		
		else if (current.Event == "it06_029_c22e550_00_A" && settings["ethanHand"])
		{
			if (!vars.completedSplits.Contains("ethanHand"))
			{
				vars.completedSplits.Add("ethanHand");
				return true;
			}
		}
		
		else if (current.Event == "ch02_1100_c22e800_00_A" && settings["vampMommyDies"])
		{
			if (!vars.completedSplits.Contains("vampMommyDies"))
			{
				vars.completedSplits.Add("vampMommyDies");
				return true;
			}
		}
		
		else if (current.Event == "ch01_0000_c26e200_00_A" && settings["meetDuke"])
		{
			if (!vars.completedSplits.Contains("meetDuke"))
			{
				vars.completedSplits.Add("meetDuke");
				return true;
			}
		}
		
		else if (current.Event == "ch01_0000_c23e050_00_A" && settings["miaGraveyard"])
		{
			if (!vars.completedSplits.Contains("miaGraveyard"))
			{
				vars.completedSplits.Add("miaGraveyard");
				return true;
			}
		}
		
		else if (current.Event == "ch05_3000_c23e660_00_A" && settings["escapedBaby"])
		{
			if (!vars.completedSplits.Contains("escapedBaby"))
			{
				vars.completedSplits.Add("escapedBaby");
				return true;
			}
		}
		
		else if (current.Event == "ch13_3000_c26e500_00_A" && settings["reachedWerewolf"])
		{
			if (!vars.completedSplits.Contains("reachedWerewolf"))
			{
				vars.completedSplits.Add("reachedWerewolf");
				return true;
			}
		}
		
		else if (current.Event == "sm84_159_c24e200_02_A" && settings["chrisFish"])
		{
			if (!vars.completedSplits.Contains("chrisFish"))
			{
				vars.completedSplits.Add("chrisFish");
				return true;
			}
		}
		
		else if (current.Event == "ch04_3500_c24e810_00_A" && settings["theBest"])
		{
			if (!vars.completedSplits.Contains("theBest"))
			{
				vars.completedSplits.Add("theBest");
				return true;
			}
		}
		
		else if (current.Event == "it06_008_c25e210_00_A" && settings["meetHeisenbergFactory"])
		{
			if (!vars.completedSplits.Contains("meetHeisenbergFactory"))
			{
				vars.completedSplits.Add("meetHeisenbergFactory");
				return true;
			}
		}
		
		else if (current.Event == "sm84_015_c25e710_00_A" && settings["tankElevator"])
		{
			if (!vars.completedSplits.Contains("tankElevator"))
			{
				vars.completedSplits.Add("tankElevator");
				return true;
			}
		}
		
		else if (current.Event == "sm84_141_c31e000_00_A" && settings["chrisStart"])
		{
			if (!vars.completedSplits.Contains("chrisStart"))
			{
				vars.completedSplits.Add("chrisStart");
				return true;
			}
		}
		
		else if (current.Event == "ch01_0000_c31e300_00_A" && settings["reachedTarget"])
		{
			if (!vars.completedSplits.Contains("reachedTarget"))
			{
				vars.completedSplits.Add("reachedTarget");
				return true;
			}
		}
		
		else if (current.Event == "sm84_200_c31e500_01_C" && settings["uriasChrisReached"])
		{
			if (!vars.completedSplits.Contains("uriasChrisReached"))
			{
				vars.completedSplits.Add("uriasChrisReached");
				return true;
			}
		}
		
		else if (current.Event == "it06_026_c31e600_00_A" && settings["reachedMega"])
		{
			if (!vars.completedSplits.Contains("reachedMega"))
			{
				vars.completedSplits.Add("reachedMega");
				return true;
			}
		}
		
		else if (current.Event == "sm84_187_c31e800_00_A" && settings["chrisEnd"])
		{
			if (!vars.completedSplits.Contains("chrisEnd"))
			{
				vars.completedSplits.Add("chrisEnd");
				return true;
			}
		}
		
		else if (current.Event == "sm84_200_c32e150_00_D" && settings["mirandaStart"])
		{
			if (!vars.completedSplits.Contains("mirandaStart"))
			{
				vars.completedSplits.Add("mirandaStart");
				return true;
			}
		}
		
		else if (current.Event == "ch01_0000_c32e400_00_A" && settings["mirandaEnd"])
		{
			if (!vars.completedSplits.Contains("mirandaEnd"))
			{
				vars.completedSplits.Add("mirandaEnd");
				return true;
			}
		}
	}
	
	if (vars.checkMaps && current.Map != old.Map)
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
	return current.CutsceneState == 15 || current.PauseState == 1 || current.GameState == 2;
}


reset
{
	return current.View == "MainMenu";
}
