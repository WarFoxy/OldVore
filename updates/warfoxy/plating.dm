/turf/simulated/floor/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if (istype(W, /obj/item/weapon/weldingtool))
		if(istype(src, /turf/simulated/floor/beach) | istype(src, /turf/simulated/floor/cult) | istype(src, /turf/simulated/floor/diona) | istype(src, /turf/simulated/floor/dungeon) | istype(src, /turf/simulated/floor/flesh) | istype(src, /turf/simulated/floor/grass) | istype(src, /turf/simulated/floor/holofloor) | istype(src, /turf/simulated/floor/lava) | istype(src, /turf/simulated/floor/reinforced) | istype(src, /turf/simulated/floor/snow) | istype(src, /turf/simulated/floor/water))
			return
		if(flooring | outdoors)
			return
		var/obj/item/weapon/weldingtool/WT = W
		if (WT.remove_fuel(0,user))
			playsound(user.loc, WT.usesound, 50, 1)
			user.visible_message("[user] disassembles the [src.name].", "You start to disassemble the [src.name].")

			if(do_after(user, 40 * WT.toolspeed))
				if(!src || !WT.isOn()) return
				//to_chat(user,"<span class='notice'>You disassembled the [T.name]!</span>")
				user.visible_message("[user] disassembled the [src.name].", "You disassembled the [src.name].")
				ChangeTurf(/turf/space, preserve_outdoors = TRUE)
				new /obj/structure/lattice( locate(src.x, src.y, src.z) )
				new /obj/item/stack/tile/floor( locate(src.x, src.y, src.z) )