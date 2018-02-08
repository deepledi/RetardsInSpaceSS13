
/client/proc/BanUser(ass as text)
	set name = "Ban user"
	set category = "Admin Punishments"
	if(!src.holder)
		to_chat(src, "Only administrators may use this command.")
		return
	var/reason = input("Why do you wanna ban this user?","Ban He")
	if(reason)
		spawn(1)
			for(var/mob/M in GLOB.player_list)
				if(M.client)
					if(M.client.key == ass && M.client.key != world.host) //cant ban the Host
						to_chat(world,"<font color='red'>[ass] has been banned from the server! reason : [reason]")
						to_chat(src,"<font color='green'>You have banned [M.client.key] - [M.lastKnownIP] - [M.client.computer_id]") //tell the admin
						call("ByondPOST.dll", "send_post_request")("[discordvar]", " { \"content\" : \"***[ass] has been banned! reason : [reason]. Banned by [key]***\" } ", "Content-Type: application/json")
						bannedusersfromgame.Add(M.client.key)
						bannedusersfromgame.Add(M.lastKnownIP)
						bannedusersfromgame.Add(M.client.computer_id)
						to_chat(M.client,"<font size=4><font color='red'>You have been banned from the server. To resolve this matter, join the discord. https://discord.gg/CSeRKPV<br><font color='blue'>Reason : [reason]")
						del M.client //ban he.

/client/proc/UnbanUser(ass as text)
	set name = "Unban user"
	set category = "Admin Punishments"
	if(ass in bannedusersfromgame) //Retard...
		bannedusersfromgame -= ass
		to_chat(world,"<font color='green'>[ass] has been unbanned!")
		call("ByondPOST.dll", "send_post_request")("[discordvar]", " { \"content\" : \"***[key] unbanned [ass]!***\" } ", "Content-Type: application/json")

/client/proc/CleanBanList()
	set name = "Clean ban list"
	set category = "Admin Punishments"
	for(var/i in bannedusersfromgame)
		bannedusersfromgame -= i //lol
	to_chat(world,"<font color='green'>The ban list has been cleared!")
	call("ByondPOST.dll", "send_post_request")("[discordvar]", " { \"content\" : \"***Ban list cleared by [key]***\" } ", "Content-Type: application/json")

/client/proc/BanDatabase()
	set name = "See ban database"
	set category = "Admin Punishments"
	for(var/i in bannedusersfromgame)
		to_chat(src,"<font color='red'>Banned : [i]")