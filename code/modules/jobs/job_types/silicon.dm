/*
AI
*/
/datum/job/ai
	title = "AI"
	flag = AI_JF
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	selection_color = "#ccffcc"
	supervisors = "ur mom"
	req_admin_notify = 0
	minimal_player_age = 30
	exp_requirements = 180
	exp_type = EXP_TYPE_CREW

/datum/job/ai/equip(mob/living/carbon/human/H)
	return H.AIize(TRUE)

/datum/job/ai/after_spawn(mob/living/silicon/ai/AI, mob/M)
	AI.rename_self("ai", M.client)

	//we may have been created after our borg
	if(SSticker.current_state == GAME_STATE_SETTING_UP)
		for(var/mob/living/silicon/robot/R in GLOB.silicon_mobs)
			if(!R.connected_ai)
				R.TryConnectToAI()


/datum/job/ai/config_check()
	return CONFIG_GET(flag/allow_ai)

/*
Cyborg
*/
/datum/job/cyborg
	title = "Cyborg"
	flag = CYBORG
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 9999999
	spawn_positions = 1
	supervisors = "ur mom"	//Nodrak
	selection_color = "#ddffdd"
	minimal_player_age = 0
	exp_requirements = 120
	exp_type = EXP_TYPE_CREW

/datum/job/cyborg/equip(mob/living/carbon/human/H)
	if(!H)
		return 0
	return H.Robotize(TRUE, TRUE, 1)