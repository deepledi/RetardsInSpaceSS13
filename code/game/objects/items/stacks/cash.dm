/obj/item/stack/spacecash  //Don't use base space cash stacks. Any other space cash stack can merge with them, and could cause potential money duping exploits.
	name = "robux"
	singular_name = "robux"
	icon = 'icons/obj/economy.dmi'
	icon_state = "robux"
	amount = 1
	max_amount = 2148000
	throwforce = 0
	throw_speed = 2
	throw_range = 2
	w_class = WEIGHT_CLASS_TINY
	full_w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE
	var/value = 1

/obj/item/stack/spacecash/Initialize()
	. = ..()
	update_desc()

/obj/item/stack/spacecash/proc/update_desc()
	desc = "There seems to be [amount] robux in it."


/obj/item/stack/spacecash/merge(obj/item/stack/S)
	. = ..()
	update_desc()

/obj/item/stack/spacecash/use(used, transfer = FALSE)
	. = ..()
	update_desc()

/obj/item/stack/spacecash/c1
	amount = 1

/obj/item/stack/spacecash/c10
	amount = 10

/obj/item/stack/spacecash/c20
	amount = 20

/obj/item/stack/spacecash/c50
	amount = 50

/obj/item/stack/spacecash/c100
	amount = 100

/obj/item/stack/spacecash/c200
	amount = 200

/obj/item/stack/spacecash/c500
	amount = 500

/obj/item/stack/spacecash/c1000
	amount = 1000