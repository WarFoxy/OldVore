/*
 * Contains Precursor and Anomalous designs for the Protolathe.
 */

/datum/design/item/precursor/AssembleDesignName()
	..()
	name = "Alien prototype ([item_name])"

/datum/design/item/precursor/AssembleDesignDesc()
	if(!desc)
		if(build_path)
			var/obj/item/I = build_path
			desc = initial(I.desc)
		..()

/datum/design/item/precursor/crowbar
	name = "Hybrid Crowbar"
	desc = "A tool utilizing cutting edge modern technology, and ancient component designs."
	id = "hybridcrowbar"
	req_tech = list(TECH_ENGINEERING = 6, TECH_MATERIAL = 6, TECH_BLUESPACE = 3, TECH_PRECURSOR = 1)
	materials = list(MAT_PLASTEEL = 2000, MAT_VERDANTIUM = 3000, MAT_GOLD = 250, MAT_URANIUM = 2500)
	build_path = /obj/item/weapon/tool/crowbar/hybrid
	sort_string = "PATAC"

/datum/design/item/precursor/wrench
	name = "Hybrid Wrench"
	desc = "A tool utilizing cutting edge modern technology, and ancient component designs."
	id = "hybridwrench"
	req_tech = list(TECH_ENGINEERING = 6, TECH_MATERIAL = 5, TECH_BLUESPACE = 2, TECH_MAGNET = 3, TECH_PRECURSOR = 1)
	materials = list(MAT_PLASTEEL = 2000, MAT_VERDANTIUM = 3000, MAT_SILVER = 300, MAT_URANIUM = 2000)
	build_path = /obj/item/weapon/tool/wrench/hybrid
	sort_string = "PATAW"

/datum/design/item/precursor/screwdriver
	name = "Hybrid Screwdriver"
	desc = "A tool utilizing cutting edge modern technology, and ancient component designs."
	id = "hybridscrewdriver"
	req_tech = list(TECH_ENGINEERING = 4, TECH_MATERIAL = 5, TECH_BLUESPACE = 2, TECH_MAGNET = 3, TECH_PRECURSOR = 1)
	materials = list(MAT_PLASTEEL = 2000, MAT_VERDANTIUM = 3000, MAT_PLASTIC = 8000, MAT_DIAMOND = 2000)
	build_path = /obj/item/weapon/tool/screwdriver/hybrid
	sort_string = "PATAS"

/datum/design/item/precursor/wirecutters
	name = "Hybrid Wirecutters"
	desc = "A tool utilizing cutting edge modern technology, and ancient component designs."
	id = "hybridwirecutters"
	req_tech = list(TECH_ENGINEERING = 4, TECH_MATERIAL = 5, TECH_PHORON = 2, TECH_PRECURSOR = 1)
	materials = list(MAT_PLASTEEL = 2000, MAT_VERDANTIUM = 3000, MAT_PLASTIC = 8000, MAT_PHORON = 2750, MAT_DIAMOND = 2000)
	build_path = /obj/item/weapon/tool/wirecutters/hybrid
	sort_string = "PATBW"

/datum/design/item/precursor/welder
	name = "Hybrid Welding Tool"
	desc = "A tool utilizing cutting edge modern technology, and ancient component designs."
	id = "hybridwelder"
	req_tech = list(TECH_ENGINEERING = 6, TECH_MATERIAL = 6, TECH_BLUESPACE = 3, TECH_PHORON = 3, TECH_MAGNET = 5, TECH_PRECURSOR = 1)
	materials = list(MAT_DURASTEEL = 2000, MAT_MORPHIUM = 3000, MAT_METALHYDROGEN = 4750, MAT_URANIUM = 6000)
	build_path = /obj/item/weapon/weldingtool/experimental/hybrid
	sort_string = "PATCW"

/datum/design/item/precursor/janusmodule
	name = "Blackbox Circuit Datamass"
	desc = "A design that seems to be in a constantly shifting superposition."
	id = "janus_module"
	materials = list(MAT_DURASTEEL = 3000, MAT_MORPHIUM = 2000, MAT_METALHYDROGEN = 6000, MAT_URANIUM = 6000, MAT_VERDANTIUM = 1500)
	req_tech = list(TECH_MATERIAL = 7, TECH_BLUESPACE = 5, TECH_MAGNET = 6, TECH_PHORON = 3, TECH_ARCANE = 1, TECH_PRECURSOR = 2)
	build_path = /obj/random/janusmodule
	sort_string = "PAJAA"

//RU-VORE "Sledgehammer" Update
/datum/design/item/precursor/scalpel
	name = "Alien Scalpel"
	desc = "A tool utilizing cutting edge modern technology, and ancient component designs."
	id = "alienscalpel"
	materials = list(MAT_PLASTEEL = 2000, MAT_VERDANTIUM = 3000, MAT_PLASTIC = 8000, MAT_DIAMOND = 2000)
	req_tech = list(TECH_BIO = 5, TECH_MATERIAL = 5, TECH_BLUESPACE = 5, TECH_MAGNET = 6, TECH_PHORON = 3, TECH_ARCANE = 1, TECH_PRECURSOR = 1)
	build_path = /obj/item/weapon/surgical/scalpel/alien
	sort_string = "MBBAM"

/datum/design/item/precursor/hemostat
	name = "Alien Hemostat"
	desc = "A tool utilizing cutting edge modern technology, and ancient component designs."
	id = "alienhemostat"
	materials = list(MAT_PLASTEEL = 2000, MAT_VERDANTIUM = 3000, MAT_PLASTIC = 8000, MAT_DIAMOND = 2000)
	req_tech = list(TECH_BIO = 5, TECH_MATERIAL = 5, TECH_BLUESPACE = 5, TECH_MAGNET = 6, TECH_PHORON = 3, TECH_ARCANE = 1, TECH_PRECURSOR = 1)
	build_path = /obj/item/weapon/surgical/hemostat/alien
	sort_string = "MBBAN"

/datum/design/item/precursor/retractor
	name = "Alien Retractor"
	desc = "A tool utilizing cutting edge modern technology, and ancient component designs."
	id = "alienretractor"
	materials = list(MAT_PLASTEEL = 2000, MAT_VERDANTIUM = 3000, MAT_PLASTIC = 8000, MAT_DIAMOND = 2000)
	req_tech = list(TECH_BIO = 5, TECH_MATERIAL = 5, TECH_BLUESPACE = 5, TECH_MAGNET = 6, TECH_PHORON = 3, TECH_ARCANE = 1, TECH_PRECURSOR = 1)
	build_path = /obj/item/weapon/surgical/retractor/alien
	sort_string = "MBBAO"

/datum/design/item/precursor/saw
	name = "Alien Saw"
	desc = "A tool utilizing cutting edge modern technology, and ancient component designs."
	id = "aliencircularsaw"
	materials = list(MAT_PLASTEEL = 2000, MAT_VERDANTIUM = 3000, MAT_PLASTIC = 8000, MAT_DIAMOND = 2000)
	req_tech = list(TECH_BIO = 5, TECH_MATERIAL = 5, TECH_BLUESPACE = 5, TECH_MAGNET = 6, TECH_PHORON = 3, TECH_ARCANE = 1, TECH_PRECURSOR = 1)
	build_path = /obj/item/weapon/surgical/circular_saw/alien
	sort_string = "MBBAP"

/datum/design/item/precursor/cautery
	name = "Alien Cautery"
	desc = "A tool utilizing cutting edge modern technology, and ancient component designs."
	id = "aliencautery"
	materials = list(MAT_PLASTEEL = 2000, MAT_VERDANTIUM = 3000, MAT_PLASTIC = 8000, MAT_DIAMOND = 2000)
	req_tech = list(TECH_BIO = 5, TECH_MATERIAL = 5, TECH_BLUESPACE = 5, TECH_MAGNET = 6, TECH_PHORON = 3, TECH_ARCANE = 1, TECH_PRECURSOR = 1)
	build_path = /obj/item/weapon/surgical/cautery/alien
	sort_string = "MBBAQ"

/datum/design/item/precursor/boneclamp
	name = "Alien Clamp"
	desc = "A tool utilizing cutting edge modern technology, and ancient component designs."
	id = "alienboneclamp"
	materials = list(MAT_PLASTEEL = 2000, MAT_VERDANTIUM = 3000, MAT_PLASTIC = 8000, MAT_DIAMOND = 2000)
	req_tech = list(TECH_BIO = 5, TECH_MATERIAL = 5, TECH_BLUESPACE = 5, TECH_MAGNET = 6, TECH_PHORON = 3, TECH_ARCANE = 1, TECH_PRECURSOR = 1)
	build_path = /obj/item/weapon/surgical/bone_clamp/alien
	sort_string = "MBBAR"

/datum/design/item/precursor/surgicaldrill
	name = "Alien Drill"
	desc = "A tool utilizing cutting edge modern technology, and ancient component designs."
	id = "aliensurgicaldrill"
	materials = list(MAT_PLASTEEL = 2000, MAT_VERDANTIUM = 3000, MAT_PLASTIC = 8000, MAT_DIAMOND = 2000)
	req_tech = list(TECH_BIO = 5, TECH_MATERIAL = 5, TECH_BLUESPACE = 5, TECH_MAGNET = 6, TECH_PHORON = 3, TECH_ARCANE = 1, TECH_PRECURSOR = 1)
	build_path = /obj/item/weapon/surgical/surgicaldrill/alien
	sort_string = "MBBAS"

/datum/design/item/precursor/fixovein
	name = "Alien Vein Container"
	desc = "A tool utilizing cutting edge modern technology, and ancient component designs."
	id = "alienfixovein"
	materials = list(MAT_PLASTEEL = 2000, MAT_VERDANTIUM = 3000, MAT_PLASTIC = 8000, MAT_DIAMOND = 2000)
	req_tech = list(TECH_BIO = 5, TECH_MATERIAL = 5, TECH_BLUESPACE = 5, TECH_MAGNET = 6, TECH_PHORON = 3, TECH_ARCANE = 1, TECH_PRECURSOR = 1)
	build_path = /obj/item/weapon/surgical/FixOVein/alien
	sort_string = "MBBAT"

/datum/design/item/anomaly/AssembleDesignName()
	..()
	name = "Anomalous prototype ([item_name])"

/datum/design/item/anomaly/AssembleDesignDesc()
	if(!desc)
		if(build_path)
			var/obj/item/I = build_path
			desc = initial(I.desc)
		..()
