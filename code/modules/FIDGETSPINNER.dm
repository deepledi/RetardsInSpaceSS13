/obj/item/fidgetspinner
	name = "FIDGET SPINNER"
	icon = 'fidget.dmi'
	desc = "boss baby irl"
	icon_state = "0"
	var/mph = 0
	var/angle = 0
/obj/item/fidgetspinner/New()
	icon_state = "[rand(1,6)]"
	..()
	while(1)
		angle = angle + mph
		var/matrix/M = matrix()*0.5
		M.Turn(angle)
		src.transform = M
		sleep(world.tick_lag)
		mph = mph - 0.5
		if(mph<0)
			mph = 0
		embed_chance = min(mph,100)
		force = mph
		throwforce = mph

/obj/item/fidgetspinner/attack_self(mob/user)
	mph = mph + 10
	to_chat(user, "You spin the fidget spinner! It's spinning at [mph] RPM!")
