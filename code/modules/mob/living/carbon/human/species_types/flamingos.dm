/datum/species/flamingo //The only furries i'd allow tbh
	name = "Flamingo"
	id = "flamingo"
	default_color = "FFFFFF"
	canchangecolor = 0 //special var, we force flamingos to be white because of their colored sprite.
	species_traits = list(EYECOLOR,MUTCOLORS)
	mutant_bodyparts = list()
	default_features = list("mcolor" = "FFF")
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = null
	liked_food = JUNKFOOD | FRIED
	coldmod = 0.1		// multiplier for cold damage
	heatmod = 1		// multiplier for heat damage
	burnmod = 2		// multiplier for burn damage
	punchdamagelow = 1       //lowest possible punch damage
	punchdamagehigh = 5      //highest possible punch damage ITT : they suck
	brutemod = 0.35//Tough against firearms
	speedmod = -2//Fast
	warningwhitelist = 1