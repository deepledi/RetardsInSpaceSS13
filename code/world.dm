//This file is just for the necessary /world definition
//Try looking in game/world.dm

/world
	mob = /mob/dead/new_player
	turf = /turf/open/space/basic
	area = /area/space
	view = "15x15"
	cache_lifespan = 1 //sorry I don't want to waste my time saving your 1GB files of orgasms
	hub = "Exadv1.spacestation13"
	name = "ROBLOX"
	fps = 30
#ifdef GC_FAILURE_HARD_LOOKUP
	loop_checks = FALSE
#endif
