/obj/item/clothing/under/pants/diaper
	name = "Diaper"
	desc = "shhhh don't tell anyone you found this."
	icon = 'icons/mob/uniform.dmi'
	icon_state = ""
	item_color = ""
	var/capacity = 0 //from 0 to 100 i guess
	var/divid = 15
	var/roundedcapyes = 6
	proc
		UpdateIcons(var/mob/living/carbon/human/H)
			var/roundedcap = round(capacity/divid) //Max capacity ? 6 states.
			if(roundedcap > roundedcapyes) //6 states I guess?
			else
				icon_state = "diaper[roundedcap]"
				item_color = "diaper[roundedcap]"
			H.update_inv_w_uniform()
		Pee(var/mob/living/carbon/human/gay,var/amount = 0)
			capacity = capacity + amount
			UpdateIcons(gay)
	New()
		..()
		sleep(world.tick_lag)
		qdel(src) //No More