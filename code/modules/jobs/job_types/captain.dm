/*
Captain
*/
/datum/job/captain
	title = "cool guys high class"
	flag = CAPTAIN
	department_head = list("CentCom")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 9999999
	spawn_positions = 9999999
	supervisors = "Administrators"
	selection_color = "#ccccff"
	req_admin_notify = 0
	minimal_player_age = 0
	exp_requirements = 0
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/captain

	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()

/datum/job/captain/get_access()
	return get_all_accesses()

/datum/job/captain/announce(mob/living/carbon/human/H)
	..()
	SSticker.OnRoundstart(CALLBACK(GLOBAL_PROC, .proc/minor_announce, "[H.real_name] has joined the crew"))

/datum/outfit/job/captain
	name = "Captain"
	jobtype = /datum/job/captain

	id = /obj/item/card/id/gold
	belt = /obj/item/storage/belt/champion/wrestling
	glasses = /obj/item/clothing/glasses/sunglasses
	ears = /obj/item/device/radio/headset/heads/captain/alt
	gloves = /obj/item/clothing/gloves/color/captain
	uniform =  /obj/item/clothing/under/rank/captain
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/elite
	shoes = /obj/item/clothing/shoes/magboots/syndie
	//head = /obj/item/clothing/head/caphat
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1, /obj/item/grenade/plastic/c4=3)
	suit_store = /obj/item/tank/internals/oxygen
	backpack = /obj/item/storage/backpack/holding
	satchel = /obj/item/storage/backpack/holding
	duffelbag = /obj/item/storage/backpack/holding
	mask = /obj/item/clothing/mask/breath/medical
	implants = list(/obj/item/implant/mindshield, /obj/item/implant/adrenalin, /obj/item/implant/uplink, /obj/item/implant/freedom, /obj/item/implant/sad_trombone)
	accessory = /obj/item/clothing/accessory/medal/gold/captain

/*
Head of Personnel
*/
/datum/job/hop
	title = "cool guys medium class"
	flag = HOP
	department_head = list("Captain")
	department_flag = ENGSEC
	head_announce = list("Supply", "Service")
	faction = "Station"
	total_positions = 9999999
	spawn_positions = 9999999
	supervisors = "high class cool guys"
	selection_color = "#ddddff"
	req_admin_notify = 0
	minimal_player_age = 0
	exp_requirements = 0
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/hop


/datum/job/hop/get_access()
	return get_all_accesses()

/datum/job/hop/announce(mob/living/carbon/human/H)
	..()
	SSticker.OnRoundstart(CALLBACK(GLOBAL_PROC, .proc/minor_announce, "[H.real_name] has joined the crew"))

/datum/outfit/job/hop
	name = "cool guys shitty class"
	jobtype = /datum/job/hop

	id = /obj/item/card/id/gold
	belt = /obj/item/storage/belt/champion/wrestling
	glasses = /obj/item/clothing/glasses/sunglasses
	ears = /obj/item/device/radio/headset/heads/captain/alt
	gloves = /obj/item/clothing/gloves/color/captain
	uniform =  /obj/item/clothing/under/rank/captain
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/owl
	shoes = /obj/item/clothing/shoes/magboots/syndie
	//head = /obj/item/clothing/head/caphat
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1, /obj/item/grenade/plastic/c4=1)
	suit_store = /obj/item/tank/internals/oxygen
	backpack = /obj/item/storage/backpack/holding
	satchel = /obj/item/storage/backpack/holding
	duffelbag = /obj/item/storage/backpack/holding
	mask = /obj/item/clothing/mask/breath/medical
	implants = list(/obj/item/implant/mindshield, /obj/item/implant/adrenalin, /obj/item/implant/uplink, /obj/item/implant/freedom, /obj/item/implant/sad_trombone)
	accessory = /obj/item/clothing/accessory/medal/gold/captain