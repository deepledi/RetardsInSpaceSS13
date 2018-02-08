/datum/game_mode/sandbox
	name = "sandbox"
	config_tag = "sandbox"
	required_players = 0

	announce_span = "info"
	announce_text = "Just have fun and enjoy the game!"

	allow_persistence_save = FALSE

/datum/game_mode/sandbox/pre_setup()
	return 1

/datum/game_mode/sandbox/post_setup()
	..()
	//SSshuttle.registerHostileEnvironment(src)

/datum/game_mode/sandbox/generate_report()
	return "Sensors indicate that crewmembers have been all given psychic powers from which they can manifest various objects.<br><br>This can only end poorly."


/datum/game_mode/sandbox/announced/generate_station_goals()
	for(var/T in subtypesof(/datum/station_goal))
		var/datum/station_goal/G = new T
		station_goals += G
		G.on_report()

/datum/game_mode/sandbox/announced/send_intercept(report = 0)
	priority_announce("Omg [station_name()] is cool!!", "Security Report", 'sound/ai/commandreport.ogg')

