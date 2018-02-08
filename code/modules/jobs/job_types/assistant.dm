/*
Assistant
*/
/datum/job/assistant
	title = "cool guys low class"
	flag = ASSISTANT
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "high class cool guys"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	outfit = /datum/outfit/job/assistant


/datum/job/assistant/get_access()
	return get_all_accesses()

/datum/job/assistant/announce(mob/living/carbon/human/H)
	..()
	SSticker.OnRoundstart(CALLBACK(GLOBAL_PROC, .proc/minor_announce, "[H.real_name] has joined the crew"))

/datum/job/assistant/config_check()
	var/ac = CONFIG_GET(number/assistant_cap)
	if(ac != 0)
		total_positions = ac
		spawn_positions = ac
		return 1
	return 0


/datum/outfit/job/assistant
	name = "Assistant"
	jobtype = /datum/job/assistant


	id = /obj/item/card/id/gold
	belt = /obj/item/storage/belt/champion/wrestling
	glasses = /obj/item/clothing/glasses/sunglasses
	ears = /obj/item/device/radio/headset/heads/captain/alt
	gloves = /obj/item/clothing/gloves/chameleon
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/owl
	shoes = /obj/item/clothing/shoes/magboots/syndie
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1, /obj/item/grenade/plastic/c4=3)
	suit_store = /obj/item/tank/internals/oxygen
	backpack = /obj/item/storage/backpack/holding
	satchel = /obj/item/storage/backpack/holding
	duffelbag = /obj/item/storage/backpack/holding
	mask = /obj/item/clothing/mask/breath/medical
	implants = list(/obj/item/implant/mindshield, /obj/item/implant/adrenalin, /obj/item/implant/uplink, /obj/item/implant/freedom, /obj/item/implant/sad_trombone)
	accessory = /obj/item/clothing/accessory/medal/gold/captain

/datum/outfit/job/assistant/pre_equip(mob/living/carbon/human/H)
	..()
	if (CONFIG_GET(flag/grey_assistants))
		uniform = /obj/item/clothing/under/color/grey
	else
		uniform = /obj/item/clothing/under/color/random
