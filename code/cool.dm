obj
	Mode7
		icon = 'circle.dmi'
		layer = 4242
		alpha = 200
		var/poop = 4 //dist
		Explosion
			name = ""
			New()
				..()
				spawn()
					animate(src, transform = matrix()*poop, alpha = 0,time = round(poop/2))
					sleep(round(poop/2)+1)
					del src