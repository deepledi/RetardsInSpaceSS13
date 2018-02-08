//Speech verbs.
var/list/LCool = new()          // make a new list (implicit type)
/mob/verb/say_verb(message as text)
	set name = "Say"
	set category = "IC"
	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return
	var/keyname = usr.key
	if(message=="")
		return
	if("[keyname]" in LCool)
		//Correct chat
	else
		to_chat(usr,"<font color='white'>did you know you can chat in ic by saying icsay on chat instaed of say or pressing t hotkey")
		LCool.Add("[keyname]")      // L contains: "futz"
	call("ByondPOST.dll", "send_post_request")("[discordvar]", " { \"content\" : \"[keyname] ([usr.name]): [message]\" } ", "Content-Type: application/json")
	to_chat(world, "<font color='white'><span class='ooc'><EM>[keyname] ([usr.name]):</EM> <span class='message'>[message]</span></span></font>")
/mob/verb/ooc_verb(message as text) //Due to confusion we'll make it so you caaaaaaaaaaan use OOC too
	set name = "OOC"
	set category = "OOC"
	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return
	var/keyname = usr.key
	if(message=="")
		return
	call("ByondPOST.dll", "send_post_request")("[discordvar]", " { \"content\" : \"[keyname] ([usr.name]): [message]\" } ", "Content-Type: application/json")
	to_chat(world, "<font color='white'><span class='ooc'><EM>[keyname] ([usr.name]):</EM> <span class='message'>[message]</span></span></font>")

/mob/verb/icsay_verb(message as text)
	set name = "ICSay"
	set category = "IC"
	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return
	usr.say(message)

///mob/verb/whisper_verb(message as text)
	//set name = "Whisper"
	//set category = "IC"
	//to_chat(usr, "<span class='danger'>no</span>")
	//return

/mob/proc/whisper(message, datum/language/language=null)
	say(message, language) //only living mobs actually whisper, everything else just talks

/mob/verb/me_verb(message as text)
	set name = "Me"
	set category = "IC"

	usr.emote("me",1,message)

/mob/proc/say_dead(var/message)
	var/name = real_name
	var/alt_name = ""

	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return

	if(jobban_isbanned(src, "OOC"))
		to_chat(src, "<span class='danger'>You have been banned from deadchat.</span>")
		return

	if (src.client)
		if(src.client.prefs.muted & MUTE_DEADCHAT)
			to_chat(src, "<span class='danger'>You cannot talk in deadchat (muted).</span>")
			return

		if(src.client.handle_spam_prevention(message,MUTE_DEADCHAT))
			return

	var/mob/dead/observer/O = src
	if(isobserver(src) && O.deadchat_name)
		name = "[O.deadchat_name]"
	else
		if(mind && mind.name)
			name = "[mind.name]"
		else
			name = real_name
		if(name != real_name)
			alt_name = " (died as [real_name])"

	var/K

	if(key)
		K = src.key

	message = src.say_quote(message, get_spans())
	var/rendered = "<span class='game deadsay'><span class='prefix'>DEAD:</span> <span class='name'>[name]</span>[alt_name] <span class='message'>[message]</span></span>"

	deadchat_broadcast(rendered, follow_target = src, speaker_key = K)

/mob/proc/emote(var/act)
	return

/mob/proc/hivecheck()
	return 0

/mob/proc/lingcheck()
	return 0
