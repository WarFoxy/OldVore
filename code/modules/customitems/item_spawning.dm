// Switch this out to use a database at some point. Each ckey is
// associated with a list of custom item datums. When the character
// spawns, the list is checked and all appropriate datums are spawned.
// See config/example/custom_items.txt for a more detailed overview
// of how the config system works.

// CUSTOM ITEM ICONS:
// Inventory icons must be in CUSTOM_ITEM_OBJ with state name [item_icon].
// On-mob icons must be in CUSTOM_ITEM_MOB with state name [item_icon].
// Inhands must be in CUSTOM_ITEM_MOB as [icon_state]_l and [icon_state]_r.

// Kits must have mech icons in CUSTOM_ITEM_OBJ under [kit_icon].
// Broken must be [kit_icon]-broken and open must be [kit_icon]-open.

// Kits must also have hardsuit icons in CUSTOM_ITEM_MOB as [kit_icon]_suit
// and [kit_icon]_helmet, and in CUSTOM_ITEM_OBJ as [kit_icon].

/var/list/custom_items = list()

/datum/custom_item
	var/character_name
	var/inherit_inhands = 1 //if unset, and inhands are not provided, then the inhand overlays will be invisible.
	var/item_icon
	var/item_desc
	var/name
	var/item_path = /obj/item
	var/req_access = 0
	var/list/req_titles = list()
	var/kit_name
	var/kit_desc
	var/kit_icon
	var/additional_data

/datum/custom_item/proc/spawn_item(var/newloc)
	var/obj/item/citem = new item_path(newloc)
	apply_to_item(citem)
	return citem

/datum/custom_item/proc/apply_to_item(var/obj/item/item)
	if(!item)
		return
	if(name)
		item.name = name
	if(item_desc)
		item.desc = item_desc
	if(item_icon)
		if(!istype(item))
			item.icon_state = item_icon
			return
		else
			item.item_state_slots = null
			item.item_icons = null

			item.icon_state = item_icon
			item.item_state = null

		var/obj/item/clothing/under/U = item
		if(istype(U))
			U.worn_state = U.icon_state
			U.update_rolldown_status()

	// Kits are dumb so this is going to have to be hardcoded/snowflake.
	if(istype(item, /obj/item/device/kit))
		var/obj/item/device/kit/K = item
		K.new_name = kit_name
		K.new_desc = kit_desc
		K.new_icon = kit_icon
		if(istype(item, /obj/item/device/kit/paint))
			var/obj/item/device/kit/paint/kit = item
			kit.allowed_types = splittext(additional_data, ", ")
		else if(istype(item, /obj/item/device/kit/suit))
			var/obj/item/device/kit/suit/kit = item
			kit.new_light_overlay = additional_data

	return item

// Parses the config file into the custom_items list.
/hook/startup/proc/load_custom_items()

	var/datum/custom_item/current_data
	var/list/L

///JazZ_XL///

	L = list()

	current_data = new()
	current_data.character_name = "CLAPPIE"
	current_data.item_path = /obj/item/device/instrument/musical/guitar
	L |= current_data

	custom_items["jazzxl"] = L

///IWuna///

	L = list()

	current_data = new()
	current_data.character_name = "Hans Schmidt"
	current_data.item_path = /obj/item/clothing/under/f13/schmidt
	L |= current_data

	current_data = new()
	current_data.character_name = "Michail Andropov"
	current_data.item_path = /obj/item/clothing/accessory/badge/mib
	L |= current_data

	current_data = new()
	current_data.character_name = "Michail Andropov"
	current_data.item_path = /obj/item/device/neuralcleaner
	L |= current_data

	custom_items["iwuna"] = L

///Lady Rainicorn///

	L = list()

	current_data = new()
	current_data.character_name = "Sophie Werner"
	current_data.item_path = /obj/item/weapon/flame/lighter/zippo/royal
	L |= current_data

	custom_items["ladyrainicorn"] = L

	return 1

//gets the relevant list for the key from the listlist if it exists, check to make sure they are meant to have it and then calls the giving function
/proc/equip_custom_items(mob/living/carbon/human/M)
	var/list/key_list = custom_items[M.ckey]
	if(!key_list || key_list.len < 1)
		return

	for(var/datum/custom_item/citem in key_list)

		// Check for requisite ckey and character name.
		if(lowertext(citem.character_name) != lowertext(M.real_name))
			continue

		// Check for required access.
		var/obj/item/weapon/card/id/current_id = M.wear_id
		if(citem.req_access && citem.req_access > 0)
			if(!(istype(current_id) && (citem.req_access in current_id.access)))
				continue

		// Check for required job title.
		if(citem.req_titles && citem.req_titles.len > 0)
			var/has_title
			var/current_title = M.mind.role_alt_title ? M.mind.role_alt_title : M.mind.assigned_role
			for(var/title in citem.req_titles)
				if(title == current_title)
					has_title = 1
					break
			if(!has_title)
				continue

		// ID cards and PDAs are applied directly to the existing object rather than spawned fresh.
		var/obj/item/existing_item
		if(citem.item_path == /obj/item/weapon/card/id && istype(current_id)) //Set earlier.
			existing_item = M.wear_id
		else if(citem.item_path == /obj/item/device/pda)
			existing_item = locate(/obj/item/device/pda) in M.contents

		// Spawn and equip the item.
		if(existing_item)
			citem.apply_to_item(existing_item)
		else
			place_custom_item(M,citem)

// Places the item on the target mob.
/proc/place_custom_item(mob/living/carbon/human/M, var/datum/custom_item/citem)

	if(!citem) return
	var/obj/item/newitem = citem.spawn_item()

	if(M.equip_to_appropriate_slot(newitem))
		return newitem

	if(M.equip_to_storage(newitem))
		return newitem

	newitem.loc = get_turf(M.loc)
	return newitem