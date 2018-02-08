//Why?
/datum/species/vulpkanin //No. Fucking stop.
	name = "Vulpkanin"
	id = "vulpkanin"
	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,MUTCOLORS,HAIR)
	mutant_bodyparts = list()
	default_features = list("mcolor" = "FFF")
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = null
	liked_food = JUNKFOOD | FRIED
	coldmod = 0.1		// multiplier for cold damage their fur is pretty robust because heat...........
	heatmod = 2		// multiplier for heat damage sorry   FURRIES HAVE FUR SO THEY BURN!!!!!!!!!!1
	burnmod = 4		// multiplier for burn damage
	punchdamagelow = 20       //lowest possible punch damage
	punchdamagehigh = 30      //highest possible punch damage ITT : they suck
	brutemod = 0.35//Tough against firearms
	speedmod = -1//Fast
	warningwhitelist = 1