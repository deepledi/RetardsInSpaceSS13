/datum/symptom/peemore

	name = "Pee Increease"
	desc = "Pee More"
	stealth = -1
	resistance = 4
	stage_speed = 2
	transmittable = 0
	level = 1
	severity = 1
	base_message_chance = 100
	symptom_delay_min = 15
	symptom_delay_max = 30
	threshold_desc = ""

/datum/symptom/peemore/Start(datum/disease/advance/A)
	if(!..())
		return

/datum/symptom/peemore/Activate(datum/disease/advance/A)
	if(!..())
		return
	var/mob/living/M = A.affected_mob
	M.PeeAmount = M.PeeAmount + 0.5