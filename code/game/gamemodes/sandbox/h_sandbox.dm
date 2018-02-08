
GLOBAL_VAR_INIT(hsboxspawn, TRUE)

var/alloweditemspawn = 1
var/bloodenabled = 0

/mob
	var/datum/hSB/sandbox = null
	verb
		EnableBuild()
			set name = "Sandbox Commands Enable"
			src.CanBuild()

/mob/proc/CanBuild()
	sandbox = new/datum/hSB
	sandbox.owner = src.ckey
	if(src.client.holder)
		sandbox.admin = 1
	verbs += new/mob/proc/sandbox_panel
	verbs += new/mob/proc/sandbox_spawnpanel

/client/proc/toggle_sandbox()
	set name = "Toggle Sandbox"
	if(alloweditemspawn==1)
		alloweditemspawn = 0
		message_admins("[key_name_admin(usr)] has toggled the special sandbox spawn to off.")
		to_chat(world, "<font color='red'>Item spawning has been disabled.</font>")
	else
		alloweditemspawn = 1
		message_admins("[key_name_admin(usr)] has toggled the special sandbox spawn to on.")
		to_chat(world, "<font color='blue'>Item spawning has been enabled!</font>")

/client/proc/toggle_blood()
	set name = "Toggle Blood"
	if(key != world.host)
		to_chat(src, "Only the host may toggle blood.")
		return
	message_admins("[key_name_admin(usr)] has toggled blood.")
	if(bloodenabled == 0)
		bloodenabled = 1
		for(var/obj/effect/decal/cleanable/i in world)
			qdel(i)
		to_chat(world, "Blood ON")
	else
		bloodenabled = 0
		for(var/obj/effect/decal/cleanable/i in world)
			qdel(i)
		to_chat(world, "Blood OFF")

/mob/proc/sandbox_panel()
	set name = "Sandbox Panel"
	if(sandbox)
		sandbox.update()

/mob/proc/sandbox_spawnpanel(object as text)
	set name = "Sandbox Spawn"
	if(alloweditemspawn == 0)
		to_chat(src,"Sandbox spawn is admin-disabled.")
		return
	var/list/donotspawn = list(
		/obj/item/tk_grab, /obj/item/implant, // not implanter, the actual thing that is inside you
		/obj/item/assembly, /obj/item/device/onetankbomb, /obj/item/radio, /obj/item/device/pda/ai,
		/obj/item/device/uplink, /obj/item/smallDelivery, /obj/item/projectile,
		/obj/item/borg/sight, /obj/item/borg/stun, /obj/item/robot_module, /obj/item/fireball_staff) //I dont think the boys should get fireball staffs

	var/chosen = pick_closest_path(object)
	if(!chosen)
		return
	for(var/typekey in donotspawn)
		if(ispath(chosen, typekey))
			to_chat(src,"<font color='red'>You cannot spawn this item (Blacklisted).</font>")
			return //No spawning these items plz

	if(ispath(chosen, /obj/item))
		var/atom/A = new chosen(usr.loc)
		message_admins("[key_name(usr)] spawned [A.name] at ([usr.x],[usr.y],[usr.z])")
	else
		to_chat(src,"<font color='red'>You cannot spawn this.</font>")
		return

/datum/hSB
	var/owner = null
	var/admin = 0

	var/static/clothinfo = null
	var/static/reaginfo = null
	var/static/objinfo = null
	var/canisterinfo = null
	var/hsbinfo = null
	//items that shouldn't spawn on the floor because they would bug or act weird
	var/global/list/spawn_forbidden = list(
		/obj/item/tk_grab, /obj/item/implant, // not implanter, the actual thing that is inside you
		/obj/item/assembly, /obj/item/device/onetankbomb, /obj/item/radio, /obj/item/device/pda/ai,
		/obj/item/device/uplink, /obj/item/smallDelivery, /obj/item/projectile,
		/obj/item/borg/sight, /obj/item/borg/stun, /obj/item/robot_module, /obj/item/fireball_staff)

/datum/hSB/proc/update()
	var/global/list/hrefs = list(
			"Space Gear",
			"Suit Up (Space Travel Gear)"		= "hsbsuit",
			"Spawn Gas Mask"					= "hsbspawn&path=[/obj/item/clothing/mask/gas]",
			"Spawn Emergency Air Tank"			= "hsbspawn&path=[/obj/item/tank/internals/emergency_oxygen/double]",

			"Standard Tools",
			"Spawn Flashlight"					= "hsbspawn&path=[/obj/item/device/flashlight]",
			"Spawn Toolbox"						= "hsbspawn&path=[/obj/item/storage/toolbox/mechanical]",
			"Spawn Light Replacer"				= "hsbspawn&path=[/obj/item/device/lightreplacer]",
			"Spawn Medical Kit"					= "hsbspawn&path=[/obj/item/storage/firstaid/regular]",
			"Spawn All-Access ID"				= "hsbaaid",

			"Building Supplies",
			"Spawn 50 Wood"                     = "hsbwood",
			"Spawn 50 Metal"					= "hsbmetal",
			"Spawn 50 Plasteel"					= "hsbplasteel",
			"Spawn 50 Reinforced Glass"         = "hsbrglass",
			"Spawn 50 Glass"					= "hsbglass",
			"Spawn Full Cable Coil"				= "hsbspawn&path=[/obj/item/stack/cable_coil]",
			"Spawn Hyper Capacity Power Cell"	= "hsbspawn&path=[/obj/item/stock_parts/cell/hyper]",
			"Spawn Inf. Capacity Power Cell"	= "hsbspawn&path=[/obj/item/stock_parts/cell/infinite]",
			"Spawn Rapid Construction Device"	= "hsbrcd",
			"Spawn RCD Ammo"					= "hsb_safespawn&path=[/obj/item/rcd_ammo]",
			"Spawn Airlock"						= "hsbairlock",

			"Bots",
			"Spawn Cleanbot"					= "hsbspawn&path=[/mob/living/simple_animal/bot/cleanbot]",
			"Spawn Floorbot"					= "hsbspawn&path=[/mob/living/simple_animal/bot/floorbot]",
			"Spawn Medbot"						= "hsbspawn&path=[/mob/living/simple_animal/bot/medbot]")


	if(!hsbinfo)
		hsbinfo = "<center><b>Sandbox Panel</b></center><hr>"
		for(var/T in hrefs)
			var/href = hrefs[T]
			if(href)
				hsbinfo += "- <a href='?[REF(src)];hsb=[hrefs[T]]'>[T]</a><br>"
			else
				hsbinfo += "<br><b>[T]</b><br>"
		hsbinfo += "<hr>"
		hsbinfo += "- <a href='?[REF(src)];hsb=hsbcloth'>Spawn Clothing...</a><br>"
		hsbinfo += "- <a href='?[REF(src)];hsb=hsbreag'>Spawn Reagent Container...</a><br>"
		hsbinfo += "- <a href='?[REF(src)];hsb=hsbobj'>Spawn Other Item...</a><br><br>"
		hsbinfo += "<b>Important (If spawning (clothing, reagent, other item) broken)</b><br>"
		hsbinfo += "If any of these are broken, It's recommended that you copy the path (example : /item/lava_staff) and paste it onto the 'Sandbox Spawn' command in your commands tab."
	usr << browse(hsbinfo, "window=hsbpanel")

/datum/hSB/Topic(href, href_list)

	if(href_list["hsb"])
		switch(href_list["hsb"])
			//
			// Spacesuit with full air jetpack set as internals
			//
			if("hsbsuit")
				var/mob/living/carbon/human/P = usr
				if(!istype(P)) return
				if(P.wear_suit)
					P.wear_suit.forceMove(P.drop_location())
					P.wear_suit.layer = initial(P.wear_suit.layer)
					P.wear_suit.plane = initial(P.wear_suit.plane)
					P.wear_suit = null
				P.wear_suit = new/obj/item/clothing/suit/space(P)
				P.wear_suit.layer = ABOVE_HUD_LAYER
				P.wear_suit.plane = ABOVE_HUD_PLANE
				P.update_inv_wear_suit()
				if(P.head)
					P.head.forceMove(P.drop_location())
					P.head.layer = initial(P.head.layer)
					P.head.plane = initial(P.head.plane)
					P.head = null
				P.head = new/obj/item/clothing/head/helmet/space(P)
				P.head.layer = ABOVE_HUD_LAYER
				P.head.plane = ABOVE_HUD_PLANE
				P.update_inv_head()
				if(P.wear_mask)
					P.wear_mask.forceMove(P.drop_location())
					P.wear_mask.layer = initial(P.wear_mask.layer)
					P.wear_mask.plane = initial(P.wear_mask.plane)
					P.wear_mask = null
				P.wear_mask = new/obj/item/clothing/mask/gas(P)
				P.wear_mask.layer = ABOVE_HUD_LAYER
				P.wear_mask.plane = ABOVE_HUD_PLANE
				P.update_inv_wear_mask()
				if(P.back)
					P.back.forceMove(P.drop_location())
					P.back.layer = initial(P.back.layer)
					P.back.plane = initial(P.back.plane)
					P.back = null
				P.back = new/obj/item/tank/jetpack/oxygen(P)
				P.back.layer = ABOVE_HUD_LAYER
				P.back.plane = ABOVE_HUD_PLANE
				P.update_inv_back()
				P.internal = P.back
				P.update_internals_hud_icon(1)

			if("hsbscrubber") // This is beyond its normal capability but this is sandbox and you spawned one, I assume you need it
				var/obj/hsb = new/obj/machinery/portable_atmospherics/scrubber{volume_rate=50*ONE_ATMOSPHERE;on=1}(usr.loc)
				hsb.update_icon() // hackish but it wasn't meant to be spawned I guess?
				message_admins("[key_name(usr)] spawned a scrubber at ([usr.x],[usr.y],[usr.z])")
			//
			// Stacked Materials
			//

			if("hsbrglass")
				new/obj/item/stack/sheet/rglass{amount=50}(usr.loc)
				message_admins("[key_name(usr)] spawned reinforced glass at ([usr.x],[usr.y],[usr.z])")
			if("hsbmetal")
				new/obj/item/stack/sheet/metal{amount=50}(usr.loc)
				message_admins("[key_name(usr)] spawned metal at ([usr.x],[usr.y],[usr.z])")
			if("hsbplasteel")
				new/obj/item/stack/sheet/plasteel{amount=50}(usr.loc)
				message_admins("[key_name(usr)] spawned plasteel at ([usr.x],[usr.y],[usr.z])")
			if("hsbglass")
				new/obj/item/stack/sheet/glass{amount=50}(usr.loc)
				message_admins("[key_name(usr)] spawned glass at ([usr.x],[usr.y],[usr.z])")
			if("hsbwood")
				new/obj/item/stack/sheet/mineral/wood{amount=50}(usr.loc)
				message_admins("[key_name(usr)] spawned wood at ([usr.x],[usr.y],[usr.z])")
			//
			// All access ID
			//
			if("hsbaaid")
				var/obj/item/card/id/gold/ID = new(usr.loc)
				ID.registered_name = usr.real_name
				ID.assignment = "Sandbox"
				ID.access = get_all_accesses()
				ID.update_label()
				message_admins("[key_name(usr)] has gotten full access card.")
			//
			// RCD - starts with full clip
			// Spawn check due to grief potential (destroying floors, walls, etc)
			//
			if("hsbrcd")
				if(!GLOB.hsboxspawn) return

				new/obj/item/construction/rcd/combat(usr.loc)
				message_admins("[key_name(usr)] spawned rcd at ([usr.x],[usr.y],[usr.z])")
			//
			// New sandbox airlock maker
			//
			if("hsbairlock")
				new /datum/airlock_maker(usr.loc)
				message_admins("[key_name(usr)] spawned airlock maker at ([usr.x],[usr.y],[usr.z])")

			//
			// Object spawn window
			//

			// Clothing
			if("hsbcloth")
				if(!GLOB.hsboxspawn) return

				if(!clothinfo)
					clothinfo = "<b>Clothing</b> <a href='?[REF(src)];hsb=hsbreag'>(Reagent Containers)</a> <a href='?[REF(src)];hsb=hsbobj'>(Other Items)</a><hr><br>"
					var/list/all_items = subtypesof(/obj/item/clothing)
					for(var/typekey in spawn_forbidden)
						all_items -= typesof(typekey)
					for(var/O in reverseRange(all_items))
						clothinfo += "<a href='?src=[REF(src)];hsb=hsb_safespawn&path=[O]'>[O]</a><br>"

				usr << browse(clothinfo,"window=sandbox")

			// Reagent containers
			if("hsbreag")
				if(!GLOB.hsboxspawn) return

				if(!reaginfo)
					reaginfo = "<b>Reagent Containers</b> <a href='?[REF(src)];hsb=hsbcloth'>(Clothing)</a> <a href='?[REF(src)];hsb=hsbobj'>(Other Items)</a><hr><br>"
					var/list/all_items = subtypesof(/obj/item/reagent_containers)
					for(var/typekey in spawn_forbidden)
						all_items -= typesof(typekey)
					for(var/O in reverseRange(all_items))
						reaginfo += "<a href='?src=[REF(src)];hsb=hsb_safespawn&path=[O]'>[O]</a><br>"

				usr << browse(reaginfo,"window=sandbox")

			// Other items
			if("hsbobj")
				if(!GLOB.hsboxspawn) return

				if(!objinfo)
					objinfo = "<b>Other Items</b> <a href='?[REF(src)];hsb=hsbcloth'>(Clothing)</a> <a href='?[REF(src)];hsb=hsbreag'>(Reagent Containers)</a><hr><br>"
					var/list/all_items = subtypesof(/obj/item/) - typesof(/obj/item/clothing) - typesof(/obj/item/reagent_containers)
					for(var/typekey in spawn_forbidden)
						all_items -= typesof(typekey)

					for(var/O in reverseRange(all_items))
						objinfo += "<a href='?src=[REF(src)];hsb=hsb_safespawn&path=[O]'>[O]</a><br>"

				usr << browse(objinfo,"window=sandbox")

			//
			// Safespawn checks to see if spawning is disabled.
			//
			if("hsb_safespawn")
				var/typepath = text2path(href_list["path"])
				if(alloweditemspawn == 0)
					to_chat(src,"Sandbox spawn is admin-disabled. Adminhelp this issue.")
					return
				if(!typepath)
					to_chat(usr, "Bad path: \"[href_list["path"]]\"")
					return
				to_chat(usr, "Spawning a [href_list["path"]], please notify admins if this doesn't work.")
				new typepath(usr.loc)
				message_admins("[key_name(usr)] spawned [href_list["path"]] at ([usr.x],[usr.y],[usr.z])")
				usr << browse(null,"window=sandbox") //anti exploit :(
			//
			// For everything else in the href list
			//
			if("hsbspawn")
				var/typepath = text2path(href_list["path"])
				if(alloweditemspawn == 0)
					to_chat(src,"Sandbox spawn is admin-disabled. Adminhelp this issue.")
					return
				if(!typepath)
					to_chat(usr, "Bad path: \"[href_list["path"]]\"")
					return
				to_chat(usr, "Spawning a [href_list["path"]], please notify admins if this doesn't work.")
				new typepath(usr.loc)
				message_admins("[key_name(usr)] spawned [href_list["path"]] at ([usr.x],[usr.y],[usr.z])")
				usr << browse(null,"window=sandbox") //anti exploit :(