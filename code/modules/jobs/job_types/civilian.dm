k /*
Clown
*/
/datum/job/clown
	title = "clown"

	flag = CLOWN
	department_head = list("Head of Personnel")
	department_flag = CIVILIAN
	faction = "cool guys"
	total_positions = 9999999
	spawn_positions = 1
	supervisors = "cool guys"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/clown


/datum/job/clown/announce(mob/living/carbon/human/H)
	..()
	SSticker.OnRoundstart(CALLBACK(GLOBAL_PROC, .proc/minor_announce, "[H.real_name] is honk man. ass blast usa"))

/datum/job/clown/after_spawn(mob/living/carbon/human/H, mob/M)
	H.rename_self("clown", M.client)

/datum/outfit/job/clown
	name = "Clown"
	jobtype = /datum/job/clown

	suit_store = /obj/item/tank/internals/oxygen

	belt = /obj/item/device/pda/clown
	uniform = /obj/item/clothing/under/rank/clown
	shoes = /obj/item/clothing/shoes/clown_shoes
	mask = /obj/item/clothing/mask/gas/clown_hat
	l_pocket = /obj/item/bikehorn
	suit = /obj/item/clothing/suit/space/hardsuit/clown
	backpack_contents = list(
		/obj/item/stamp/clown = 1,
		/obj/item/reagent_containers/spray/waterflower = 1,
		/obj/item/reagent_containers/food/snacks/grown/banana = 1,
		/obj/item/device/instrument/bikehorn = 1,
		)

	implants = list(/obj/item/implant/adrenalin, /obj/item/implant/uplink, /obj/item/implant/freedom, /obj/item/implant/sad_trombone)

	backpack = /obj/item/storage/backpack/clown
	satchel = /obj/item/storage/backpack/clown
	duffelbag = /obj/item/storage/backpack/duffelbag/clown //strangely has a duffel

	box = /obj/item/storage/box/hug/survival


/datum/outfit/job/clown/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.fully_replace_character_name(H.real_name, pick(GLOB.clown_names))

/datum/outfit/job/clown/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.dna.add_mutation(CLOWNMUT)

/*
Mime
*/
/datum/job/mime
	title = "MASON KILLERS"

	flag = MIME
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

	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	outfit = /datum/outfit/job/mime

/datum/outfit/job/mime
	name = "MASON KILLER"
	jobtype = /datum/job/mime

	id = /obj/item/card/id/gold
	belt = /obj/item/storage/belt/champion/wrestling
	glasses = /obj/item/clothing/glasses/sunglasses
	ears = /obj/item/device/radio/headset/heads/captain/alt
	gloves = /obj/item/clothing/gloves/color/captain
	uniform =  /obj/item/clothing/under/rank/captain
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/elite
	shoes = /obj/item/clothing/shoes/magboots/syndie

	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1, /obj/item/grenade/plastic/c4=7)
	suit_store = /obj/item/tank/internals/oxygen
	backpack = /obj/item/storage/backpack/holding
	satchel = /obj/item/storage/backpack/holding
	duffelbag = /obj/item/storage/backpack/holding
	mask = /obj/item/clothing/mask/breath/medical
	implants = list(/obj/item/implant/mindshield, /obj/item/implant/adrenalin, /obj/item/implant/uplink, /obj/item/implant/freedom, /obj/item/implant/sad_trombone)
	accessory = /obj/item/clothing/accessory/medal/gold/captain

/*
Curator
*/
/datum/job/curator
	title = "Curator"
	flag = CURATOR
	department_head = list("Head of Personnel")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "the head of personnel"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/curator

	access = list(ACCESS_LIBRARY)
	minimal_access = list(ACCESS_LIBRARY, ACCESS_CONSTRUCTION,ACCESS_MINING_STATION)

/datum/outfit/job/curator
	name = "Curator"
	jobtype = /datum/job/curator

	belt = /obj/item/device/pda/curator
	uniform = /obj/item/clothing/under/rank/curator
	l_hand = /obj/item/storage/bag/books
	r_pocket = /obj/item/key/displaycase
	l_pocket = /obj/item/device/laser_pointer
	accessory = /obj/item/clothing/accessory/pocketprotector/full
	backpack_contents = list(
		/obj/item/melee/curator_whip = 1,
		/obj/item/soapstone = 1,
		/obj/item/barcodescanner = 1
	)


/datum/outfit/job/curator/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_all_languages(omnitongue=TRUE)

/*
Lawyer
*/
/datum/job/lawyer
	title = "Lawyer"
	flag = LAWYER
	department_head = list("Head of Personnel")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "the head of personnel"
	selection_color = "#dddddd"
	var/lawyers = 0 //Counts lawyer amount

	outfit = /datum/outfit/job/lawyer

	access = list(ACCESS_LAWYER, ACCESS_COURT, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_LAWYER, ACCESS_COURT, ACCESS_SEC_DOORS)

/datum/outfit/job/lawyer
	name = "Lawyer"
	jobtype = /datum/job/lawyer

	belt = /obj/item/device/pda/lawyer
	ears = /obj/item/device/radio/headset/headset_sec
	uniform = /obj/item/clothing/under/lawyer/bluesuit
	suit = /obj/item/clothing/suit/toggle/lawyer
	shoes = /obj/item/clothing/shoes/laceup
	l_hand = /obj/item/storage/briefcase/lawyer
	l_pocket = /obj/item/device/laser_pointer
	r_pocket = /obj/item/clothing/accessory/lawyers_badge


/datum/outfit/job/lawyer/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	var/datum/job/lawyer/J = SSjob.GetJobType(jobtype)
	J.lawyers++
	if(J.lawyers>1)
		uniform = /obj/item/clothing/under/lawyer/purpsuit
		suit = /obj/item/clothing/suit/toggle/lawyer/purple
