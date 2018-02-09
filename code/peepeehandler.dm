mob
	var/PeeRate = 0.2
	var/PeeMax = 100
	var/PeeColor = "#FFFF00"
	var/PeeAmount = -15

/obj/effect/decal/cleanable/pee
	icon = 'pee.dmi'
	icon_state = "1"
	name = "pee"
	desc = "Someone is nasty as fuck."
	gender = NEUTER
	canstillappeareventhoughbloodisdisabled = 1
	var/pp = 10
	Initialize(mapload, list/datum/disease/diseases)
		..()
		spawn()
			sleep(2)
			reagents.add_reagent("pee", pp) //lets add some pee