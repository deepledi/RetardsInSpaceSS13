/datum/species/novakid
	name = "Novakid"
	id = "novakid"
	default_color = "FFFFFF"
	species_traits = list(MUTCOLORS,NOBREATH,RESISTHOT,RESISTPRESSURE,NOFIRE)
	mutant_bodyparts = list()
	default_features = list("mcolor" = "0F0")
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = null
	liked_food = JUNKFOOD | FRIED
	coldmod = 5		// multiplier for cold damage water or cold is bad for them
	heatmod = 0		// multiplier for heat damage
	burnmod = 0		// multiplier for burn damage theyre gas people how they suppose to die Lol
	punchdamagelow = 20       //lowest possible punch damage
	punchdamagehigh = 30      //highest possible punch damage
	brutemod = 0.5//Tough against firearms
	damage_overlay_type = ""//let's not show bloody wounds or burns over bones. they're gas people. ffs