///////////////
///FALLOUT13///
///////////////
/obj/item/clothing/under/f13
	icon = 'updates/fluff/ruvorefluff.dmi'
	sprite_sheets = list(
		SPECIES_HUMAN = 'updates/fluff/ruvorefluff.dmi')

/obj/item/clothing/suit/f13
	icon = 'updates/fluff/ruvorefluff.dmi'
	sprite_sheets = list(
		SPECIES_HUMAN = 'updates/fluff/f13suits.dmi')

/obj/item/clothing/under/f13/vault113
	name = "Vault 113 jumpsuit"
	desc = "TAKE ME HOME, COUNTRY ROADS"
	icon_state = "f13suit"
	species_restricted = list(SPECIES_HUMAN)

/obj/item/clothing/under/f13/schmidt
	name = "Spring clothing"
	desc = "Old fashion. Cool."
	icon_state = "schmidt"
	species_restricted = list(SPECIES_HUMAN)

/obj/item/clothing/under/f13/andropov
	name = "Russian Mafia suit"
	desc = "Profession? Mafioznik!."
	icon_state = "andropov"
	species_restricted = list(SPECIES_HUMAN)

/obj/item/clothing/under/f13/police
	name = "Retro Police suit"
	desc = "STOP RIGHT HERE, CRIMINAL SCUM!!!."
	icon_state = "police"

/obj/item/weapon/reagent_containers/food/drinks/flask/f13
	name = "Vault 113 flask"
	desc = "You shouldn't see this."
	icon = 'updates/fluff/ruvorefluff.dmi'
	icon_state = "v113"
	volume = 60
	center_of_mass = list("x"=17, "y"=7)

////////////////
///PIPBOY BOI///
////////////////

/obj/item/device/pda/f13
	name = "\improper PipBoy 3000"
	desc = "A portable microcomputer by Vault-Tec. Functionality determined by a preprogrammed ROM cartridge."
	icon = 'updates/fluff/ruvorefluff.dmi'
	icon_state = "regular"
	default_cartridge = /obj/item/weapon/cartridge/captain
	detonate = 0
	ttone = "bzzz"
	lock_code = "CMC3BFF"

////////////////
///Fluff case///
////////////////

/obj/item/weapon/storage/fancy/f13case
	can_hold = list(
		/obj/item/device/pda/f13,
		/obj/item/clothing/under/f13/vault113,
		/obj/item/weapon/reagent_containers/food/drinks/flask/f13
		)

	starts_with = list(
		/obj/item/device/pda/f13 = 1,
		/obj/item/clothing/under/f13/vault113 = 1,
		/obj/item/weapon/reagent_containers/food/drinks/flask/f13 = 1
	)
	w_class = ITEMSIZE_NORMAL
	storage_slots = 3
	icon = 'updates/fluff/ruvorefluff.dmi'
	name = "Blue Case"
	desc = "Blue case with the logo of Vault-TEC on the cover."
	icon_state = "f13casebox"
	icon_type = "f13case"

////////////////////////
///LOW3 resomi skelet///
////////////////////////

/*obj/item/clothing/suit/f13/exoskeletresomi
	name = "Resomi Exoskelet"
	species_restricted = list(SPECIES_TESHARI)
	icon_state = "rsomiskelet"
	icon_override = 'updates/fluff/ruvorefluff.dmi'
	armor = list(melee = 10, bullet = 5, laser = 5, energy = 5, bomb = 20, bio = 0, rad = 0)
*/

///MIB///

/obj/item/weapon/stamp/solgov/mib
	name = "\improper MIB rubber stamp"
	icon_state = "stamp-sg"
	desc = "Штамп организации ЛВЧ."

/obj/item/clothing/accessory/badge/mib
	name = "MIB badge"
	desc = "бейдж содержащий в себе данные о носящем и эмблему ЛВЧ."
	icon = 'updates/fluff/ruvorefluff.dmi'
	icon_state = "mibbadge"

/obj/item/clothing/accessory/permit/mib
	name = "arrest permit"
	desc = "A card indicating that the owner is allowed to arrest law breakers and accompany them to the brig."

///НЕЙРОЛИЗАТОР///

/obj/item/device/neuralcleaner
	name = "Neuralizer"
	desc = "Used for brainwashing."
	icon = 'updates/fluff/ruvorefluff.dmi'
	icon_state = "neuralcleaner"
	item_state = "flashtool"
	throwforce = 5
	w_class = ITEMSIZE_SMALL
	throw_speed = 4
	throw_range = 10
	origin_tech = list(TECH_MAGNET = 2, TECH_COMBAT = 1)

	var/times_used = 0 //Number of times it's been used.
	var/broken = FALSE     //Is the flash burnt out?
	var/last_used = 0 //last world.time it was used.
	var/max_flashes = 15 // How many times the flash can be used before needing to self recharge.
	var/halloss_per_flash = 30
	var/break_mod = 3 // The percent to break increased by every use on the flash.

	var/can_break = TRUE // Can the flash break?
	var/can_repair = FALSE // Can you repair the flash?
	var/repairing = FALSE // Are we repairing right now?

	var/safe_flashes = 2 // How many flashes are kept in 1% breakchance?

	var/charge_only = FALSE // Does the flash run purely on charge?

	var/base_icon = "neuralcleaner"

	var/obj/item/weapon/cell/power_supply //What type of power cell this uses
	var/charge_cost = 30 //How much energy is needed to flash.
	var/use_external_power = FALSE // Do we use charge from an external source?

	var/cell_type = /obj/item/weapon/cell/device

/obj/item/device/neuralcleaner/Initialize()
	..()
	power_supply = new cell_type(src)

/obj/item/device/neuralcleaner/attackby(var/obj/item/W, var/mob/user)
	if(W.is_screwdriver() && broken)
		if(repairing)
			to_chat(user, "<span class='notice'>\The [src] is already being repaired!</span>")
			return
		user.visible_message("<span class='notice'>\The [user] starts trying to repair \the [src]'s bulb.</span>")
		repairing = TRUE
		if(do_after(user, (40 SECONDS + rand(0, 20 SECONDS)) * W.toolspeed) && can_repair)
			if(prob(30))
				user.visible_message("<span class='notice'>\The [user] successfully repairs \the [src]!</span>")
				broken = FALSE
				update_icon()
			playsound(src.loc, W.usesound, 50, 1)
		else
			user.visible_message("<span class='notice'>\The [user] fails to repair \the [src].</span>")
		repairing = FALSE
	else
		..()

/obj/item/device/flash/update_icon()
	var/obj/item/weapon/cell/battery = power_supply

	if(use_external_power)
		battery = get_external_power_supply()

	if(broken || !battery || battery.charge < charge_cost)
		icon_state = "[base_icon]burnt"
	else
		icon_state = "[base_icon]"
	return

/obj/item/device/neuralcleaner/get_cell()
	return power_supply

/obj/item/device/neuralcleaner/proc/get_external_power_supply()
	if(isrobot(src.loc))
		var/mob/living/silicon/robot/R = src.loc
		return R.cell
	if(istype(src.loc, /obj/item/rig_module))
		var/obj/item/rig_module/module = src.loc
		if(module.holder && module.holder.wearer)
			var/mob/living/carbon/human/H = module.holder.wearer
			if(istype(H) && H.back)
				var/obj/item/weapon/rig/suit = H.back
				if(istype(suit))
					return suit.cell
	return null

/obj/item/device/neuralcleaner/proc/clown_check(var/mob/user)
	if(user && (CLUMSY in user.mutations) && prob(50))
		to_chat(user, "<span class='warning'>\The [src] slips out of your hand.</span>")
		user.drop_item()
		return 0
	return 1

/obj/item/device/neuralcleaner/proc/flash_recharge()
	//Every ten seconds the flash doesn't get used, the times_used variable goes down by one, making the flash less likely to burn out,
	// as well as being able to flash more before reaching max_flashes cap.
	for(var/i=0, i < max_flashes, i++)
		if(last_used + 10 SECONDS > world.time)
			break

		else if(use_external_power)
			var/obj/item/weapon/cell/external = get_external_power_supply()
			if(!external || !external.use(charge_cost)) //Take power from the borg or rig!
				break

		else if(!power_supply || !power_supply.checked_use(charge_cost))
			break

		last_used += 10 SECONDS
		times_used--

	last_used = world.time
	times_used = max(0,round(times_used)) //sanity
	update_icon()

// Returns true if the device can flash.
/obj/item/device/neuralcleaner/proc/check_capacitor(var/mob/user)
	//spamming the flash before it's fully charged (60 seconds) increases the chance of it breaking
	//It will never break on the first use.
	var/obj/item/weapon/cell/battery = power_supply

	if(use_external_power)
		battery = get_external_power_supply()

	if(times_used <= max_flashes && battery && battery.checked_use(charge_cost))
		last_used = world.time
		if(prob( max(0, times_used - safe_flashes) * 2 + (times_used >= 1) ) && can_break)	//if you use it 10 times in a minute it has a 30% chance to break.
			broken = TRUE
			if(user)
				to_chat(user, "<span class='warning'>The bulb has burnt out!</span>")
			update_icon()
			return FALSE
		else
			times_used++
			update_icon()
			return TRUE
	else if(!charge_only)	//can only use it 10 times a minute, unless it runs purely on charge.
		if(user)
			update_icon()
			to_chat(user, "<span class='warning'><i>click</i></span>")
			playsound(src.loc, 'sound/weapons/empty.ogg', 80, 1)
		return FALSE
	else if(battery && battery.checked_use(charge_cost + (round(charge_cost / 4) * max(0, times_used - max_flashes)))) // Using over your maximum flashes starts taking more charge per added flash.
		times_used++
		update_icon()
		return TRUE

//attack_as_weapon
/obj/item/device/neuralcleaner/attack(mob/living/M, mob/living/user, var/target_zone)
	if(!user || !M)	return	//sanity

	add_attack_logs(user,M,"Brainwashed (attempt) with [src]")

	user.setClickCooldown(user.get_attack_speed(src))
	user.do_attack_animation(M)

	if(!clown_check(user))	return
	if(broken)
		to_chat(user, "<span class='warning'>\The [src] is broken.</span>")
		return

	flash_recharge()

	if(!check_capacitor(user))
		return

	playsound(src.loc, 'sound/weapons/flash.ogg', 100, 1)
	var/flashfail = 0

	//VOREStation Add - NIF
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.nif && H.nif.flag_check(NIF_V_FLASHPROT,NIF_FLAGS_VISION))
			flashfail = 1
			H.nif.notify("High intensity light detected, and blocked!",TRUE)
	//VOREStation Add End

	if(iscarbon(M) && !flashfail) //VOREStation Add - NIF
		var/mob/living/carbon/C = M
		if(C.stat != DEAD)
			var/safety = C.eyecheck()
			if(safety <= 0)
				var/flash_strength = 10 //Vorestation edit, making flashes behave the same as flash rounds
				if(ishuman(C))
					var/mob/living/carbon/human/H = C
					flash_strength *= H.species.flash_mod

					if(flash_strength > 0)
						H.Confuse(flash_strength + 5)
						H.Blind(flash_strength)
						H.eye_blurry = max(H.eye_blurry, flash_strength + 5)
						H.flash_eyes()
						H.adjustHalLoss(halloss_per_flash * (flash_strength / 5)) // Should take four flashes to stun.
						H.apply_damage(flash_strength * H.species.flash_burn/5, BURN, BP_HEAD, 0, 0, "Photon burns")

			else
				flashfail = 1

	else if(issilicon(M))
		flashfail = 0
		var/mob/living/silicon/S = M
		if(isrobot(S))
			var/mob/living/silicon/robot/R = S
			if(R.has_active_type(/obj/item/borg/combat/shield))
				var/obj/item/borg/combat/shield/shield = locate() in R
				if(shield)
					if(shield.active)
						shield.adjust_flash_count(R, 1)
						flashfail = 1
	else
		flashfail = 1

	if(isrobot(user))
		spawn(0)
			var/atom/movable/overlay/animation = new(user.loc)
			animation.layer = user.layer + 1
			animation.icon_state = "blank"
			animation.icon = 'icons/mob/mob.dmi'
			animation.master = user
			flick("blspell", animation)
			sleep(5)
			qdel(animation)

	if(!flashfail)
		flick("flash2", src)
		if(!issilicon(M))

			user.visible_message("<span class='disarm'>[user] brainwashes [M] with the neuralcleaner!</span>")
		else

			user.visible_message("<span class='notice'>[user] overloads [M]'s sensors with the flash!</span>")
			M.Weaken(rand(5,10))
	else

		user.visible_message("<span class='notice'>[user] fails to brainwash [M] with the neuralcleaner!</span>")

	return




/obj/item/device/neuralcleaner/attack_self(mob/living/carbon/user as mob, flag = 0, emp = 0)
	if(!user || !clown_check(user)) 	return

	user.setClickCooldown(user.get_attack_speed(src))

	if(broken)
		user.show_message("<span class='warning'>The [src.name] is broken</span>", 2)
		return

	flash_recharge()

	if(!check_capacitor(user))
		return

	playsound(src.loc, 'sound/weapons/flash.ogg', 100, 1)
	flick("flash2", src)
	if(user && isrobot(user))
		spawn(0)
			var/atom/movable/overlay/animation = new(user.loc)
			animation.layer = user.layer + 1
			animation.icon_state = "blank"
			animation.icon = 'icons/mob/mob.dmi'
			animation.master = user
			flick("blspell", animation)
			sleep(5)
			qdel(animation)

	for(var/mob/living/carbon/C in oviewers(3, null))
		var/safety = C.eyecheck()
		if(!safety)
			if(!C.blinded)
				C.flash_eyes()

	return

/obj/item/device/neuralcleaner/emp_act(severity)
	if(broken)	return
	flash_recharge()
	if(!check_capacitor())
		return

	if(istype(loc, /mob/living/carbon))
		var/mob/living/carbon/C = loc
		var/safety = C.eyecheck()
		if(safety <= 0)
			C.adjustHalLoss(halloss_per_flash)
			//C.Weaken(10)
			C.flash_eyes()
			for(var/mob/M in viewers(C, null))
				M.show_message("<span class='disarm'>[C] и ВЫ, забыли о последних событиях, кто эти парни в чёрном?</span>")
	..()