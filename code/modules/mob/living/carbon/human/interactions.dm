/**********************************************************
*******Interactions code by HONKERTRON feat TestUnit*******
***********Edits by AshtonFox & RenardQueenston************
*******Contains a lot ammount of ERP and MEHANOYEBLYA******
***********************************************************/

/mob/living/carbon/human/MouseDrop_T(mob/M as mob, mob/user as mob)
	if(M == src || src == usr || M != usr)		return
	if(usr.restrained())		return

	var/mob/living/carbon/human/H = usr
	H.partner = src
	make_interaction(machine)

/mob/proc/make_interaction()
	return

//Interact with yourself and others (2 in 1)
/mob/living/carbon/human/verb/selfinteract(mob/user as mob)
	set name = "Interact"
	set category = "IC"
	partner = user
	make_interaction(machine)

/mob/living/carbon/human/verb/arouse()
	set name = "Arouse-Self"
	set category = "Abilities"
	set desc = "Use this to get aroused just with your thoughts... do not abuse by the way. +10 per click."
	var/ya = "&#255;"
	if(gender != NEUTER && arousal <= med_arousal)
		to_chat(src, "<span class='warning'>Âû çàíèìàåòå ñâîè ìûñëè ÷åì-òî, ÷òî âàñ âîçáóæäàåò...</span>")
		src.arousal += 10
	else if(gender != NEUTER)
		to_chat(src, "<span class='warning'>Âû óæå ñëèøêîì âîçáóæäåíû, ÷òîáû äîâîëüñòâîâàòüñ[ya] òîëüêî ýòèì!</span>")
	else
		to_chat(src, "<span class='warning'>Ó âàñ íåò íåîáõîäèìûõ ïîëîâûõ ïðèçíàêîâ! Êàê âû ñîáðàëèñü ýòî ïðîâåðíóòü?</span>")

/datum/species/human
	genitals = 1
	anus = 1

/datum/species/plasmaman
	anus = 0

/datum/species/kidan
	anus = 0

/datum/species/wryn
	anus = 0

/datum/species/unathi
	genitals = 1
	anus = 1

/datum/species/Tajara
	genitals = 1
	anus = 1

/datum/species/vulpkanin
	genitals = 1
	anus = 1

/datum/species/human/skrell
	genitals = 0
	anus = 1

/datum/species/monkey
	genitals = 1
	anus = 1

/datum/species/monkey/skrell
	genitals = 0
	anus = 1

/datum/species/human/machine
	genitals = 0
	anus = 0 //kiss my metal ass

/datum/species/human/diona
	genitals = 0
	anus = 0

/datum/species/human/vatgrown
	genitals = 1
	anus = 1

/datum/species/human/spacer
	genitals = 1
	anus = 1

/datum/species/human/gravworlder
	genitals = 1
	anus = 1

/datum/species/teshari
	genitals = 1
	anus = 1

/datum/species/akula
	genitals = 1
	anus = 1

/datum/species/sergal
	genitals = 1
	anus = 1

/datum/species/nevrean
	genitals = 1
	anus = 1

/datum/species/hi_zoxxen
	genitals = 1
	anus = 1

/datum/species/fl_zorren
	genitals = 1
	anus = 1

/datum/species/xenohybrid
	genitals = 1
	anus = 1

/datum/species/shapeshifter/promethean
	genitals = 1
	anus = 1

/datum/species/spider
	genitals = 1
	anus = 1

/datum/species/custom
	genitals = 1
	anus = 1

/datum/species/harpy
	genitals = 1
	anus = 1

/mob/living/carbon/human/proc/is_nude()
	return (!wear_suit && !w_uniform) ? 1 : 0 //TODO: Nudity check for underwear

/mob/living/carbon/human/make_interaction()
	set_machine(src)

	var/mob/living/carbon/human/H = usr
	var/mob/living/carbon/human/P = H.partner
	var/obj/item/organ/external/temp = H.organs_by_name["r_hand"]
	var/hashands = (temp && temp.is_usable())
	if (!hashands)
		temp = H.organs_by_name["l_hand"]
		hashands = (temp && temp.is_usable())
	temp = P.organs_by_name["r_hand"]
	var/hashands_p = (temp && temp.is_usable())
	if (!hashands_p)
		temp = P.organs_by_name["l_hand"]
		hashands = (temp && temp.is_usable())
	var/mouthfree = !(H.wear_mask)
	var/mouthfree_p = !(P.wear_mask)
	var/haspenis = ((H.gender == MALE && H.potenzia > -1 && H.species.genitals))
	var/haspenis_p = ((P.gender == MALE && P.potenzia > -1 && P.species.genitals))
	var/hasvagina = (H.gender == FEMALE && H.species.genitals && H.species.name != "Stok" && H.species.name != "Teshari")
	var/hasvagina_p = (P.gender == FEMALE && P.species.genitals && P.species.name != "Stok" && P.species.name != "Teshari")
	var/hasanus_p = P.species.anus
	var/hasanus = H.species.anus
	var/isnude = H.is_nude()
	var/isnude_p = P.is_nude()

	H.lastfucked = null
	H.lfhole = ""

	var/dat = "<B><HR><FONT size=3>INTERACTIONS - [H.partner]</FONT></B><BR><HR>"
	var/ya = "&#1103;"

	if (P != H)
		dat +=  {"• <A href='?src=\ref[src];interaction=bow'>Îòâåñèòü ïîêëîí.</A><BR>"}
		dat +=  {"• <A href='?src=\ref[src];interaction=wave'>Ïîïðèâåòñòâîâàòü.</A><BR>"}
	if (hashands)
		dat +=  {"<font size=3><B>Ðóêè:</B></font><BR>"}
		if (Adjacent(P))
			if (P != H)
				dat +=  {"• <A href='?src=\ref[src];interaction=handshake'>Ïîæàòü ðóêó.</A><BR>"}
				dat +=  {"• <A href='?src=\ref[src];interaction=five'>Äàòü ï[ya]òü.</A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=hug'>Îáíèìàøêè!</A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=cheer'>Ïîõëîïàòü ïî ïëå÷ó</A><BR>"}
			if (hashands_p && (P != H))
				dat +=  {"• <A href='?src=\ref[src];interaction=give'>Ïåðåäàòü ïðåäìåò.</A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=slap'><font color=red>Äàòü ïîùå÷èíó!</font></A><BR>"}
			if (hasanus_p)
				dat += {"• <A href='?src=\ref[src];interaction=assslap'>Øëåïíóòü ïî çàäíèöå</A><BR>"}
			if (isnude_p)
				if (hasvagina_p)
					dat += {"• <A href='?src=\ref[src];interaction=fingering'><font color=purple>Ïðîñóíóòü ïàëü÷èê...</font></A><BR>"}
				if (haspenis_p)
					dat += {"• <A href='?src=\ref[src];interaction=jerk'><font color=purple>Ïîäðî÷èòü</font></A><BR>"}
			if ((P.species.get_bodytype() == SPECIES_TAJ || P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT || P.species.get_bodytype() == SPECIES_SERGAL) && (P != H))
				dat +=  {"• <A href='?src=\ref[src];interaction=pull'><font color=red>Ä¸ðíóòü çà õâîñò!</font></A><BR>"}
				if(P.can_inject(H, 1))
					dat +=  {"• <A href='?src=\ref[src];interaction=pet'>Ïîãëàäèòü.</A><BR>"}
			if (P == H)
				dat +=  {"• <A href='?src=\ref[src];interaction=pet'>Ïîãëàäèòü ñåá[ya].</A><BR>"}
			if ((haspenis_p || hasvagina_p) && !isnude_p && P.species.name != "Teshari" && P.can_inject(H, 1))
				dat += {"• <A href='?src=\ref[src];interaction=petting'><font color=purple>Ïîòðîãàòü ïàõ</font></A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=knock'><font color=red>Äàòü ïîäçàòûëüíèê.</font></A><BR>"}
		if (P != H)
			dat +=  {"• <A href='?src=\ref[src];interaction=fuckyou'><font color=red>Ïîêàçàòü ñðåäíèé ïàëåö.</font></A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=threaten'><font color=red>Ïîãðîçèòü êóëàêîì.</font></A><BR>"}

	if (mouthfree && H.species.name != "Diona" && P != H)
		dat += {"<font size=3><B>Ëèöî:</B></font><BR>"}
		dat += {"• <A href='?src=\ref[src];interaction=kiss'>Ïîöåëîâàòü.</A><BR>"}
		if (Adjacent(P))
			if (mouthfree_p)
				dat += {"• <A href='?src=\ref[src];interaction=lick'>Ëèçíóòü â ùåêó.</A><BR>"}
			if (isnude_p)
				if (haspenis_p)
					dat += {"• <A href='?src=\ref[src];interaction=blowjob'><font color=purple>Ñäåëàòü ìèíåò.</font></A><BR>"}
				if (hasvagina_p)
					dat += {"• <A href='?src=\ref[src];interaction=vaglick'><font color=purple>Âûëèçàòü.</font></A><BR>"}
				if (hasanus_p && P.species.name != "Diona")
					dat += {"• <A href='?src=\ref[src];interaction=asslick'><font color=purple>Îòïîëèðîâàòü ÷åðíûé õîä?!</font></A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=spit'><font color=red>Ïëþíóòü.</font></A><BR>"}
		dat +=  {"• <A href='?src=\ref[src];interaction=tongue'><font color=red>Ïîêàçàòü [ya]çûê.</font></A><BR>"}

	if (Adjacent(P) && isnude && P.species.name != "Diona" && P != H)
		if (haspenis && hashands)
			dat += {"<font size=3><B>×ëåí:</B></font><BR>"}
			if (hasvagina_p && isnude_p && P.species.name != "Teshari")
				dat += {"• <A href='?src=\ref[src];interaction=vaginal'><font color=purple>Òðàõíóòü âàãèíàëüíî.</font></A><BR>"}
			if (hasanus_p && isnude_p)
				dat += {"• <A href='?src=\ref[src];interaction=anal'><font color=purple>Òðàõíóòü àíàëüíî.</font></A><BR>"}
			if (mouthfree_p)
				dat += {"• <A href='?src=\ref[src];interaction=oral'><font color=purple>Òðàõíóòü îðàëüíî.</font></A><BR>"}
	if (isnude && hashands && P != H)
		if (hasvagina)
			dat += {"<font size=3><B>Ëîíî:</B></font><BR>"}
			if (isnude_p && haspenis_p && usr.loc == H.partner.loc)
				dat += {"• <A href='?src=\ref[src];interaction=mount'><font color=purple>Îñåäëàòü</font></A><BR>"}
				dat += {"• <A href='?src=\ref[src];interaction=rub'><font color=purple>Ïîòåðåòüñ[ya]</font></A><BR>"}
			if (mouthfree_p && usr.loc == H.partner.loc)
				dat += {"• <A href='?src=\ref[src];interaction=facesitting'><font color=purple>Ñåñòü íà ëèöî</font></A><BR>"}
			if (mouthfree_p && (Adjacent(P) || (usr.loc == H.partner.loc)))
				dat += {"• <A href='?src=\ref[src];interaction=forcelick'><font color=purple>Çàñòàâèòü îòëèçûâàòü</font></A><BR>"}
			if ((usr.loc == H.partner.loc) && hasvagina_p)
				dat += {"• <A href='?src=\ref[src];interaction=tribadism'><font color=purple>Òðèáàäèçì</font></A><BR>"}
	if (isnude && hashands && P.species.name != "Diona" && P != H)
		if (hasanus && haspenis_p)
			dat += {"<font size=3><B>Çàä:</B></font><BR>"}
			if (isnude_p && usr.loc == H.partner.loc)
				dat += {"• <A href='?src=\ref[src];interaction=assfuck'><font color=purple>Îñåäëàòü çàäîì</font></A><BR>"}

	var/datum/browser/popup = new(usr, "interactions", "Interactions", 340, 480)
	popup.set_content(dat)
	popup.open()

//INTERACTIONS
/mob/living/carbon/human
	var/mob/living/carbon/human/partner
	var/mob/living/carbon/human/lastfucked
	var/lfhole
	var/potenzia = 10
	var/resistenza = 200
	var/lust = 0
	var/erpcooldown = 0
	var/interactcooldown = 0
	var/multiorgasms = 0
	var/lastmoan
	var/arousal = 0
	var/low_arousal = 0
	var/med_arousal = 0

/*
Çàïèëèòü rub äëÿ ðàñ, ÷òîáû òàÿðàíå ò¸ðëèñü _ïóøèñòûìè/âîëîñàòûìè_ ï¸çäàìè, ÷òîáû òåðàøè ò¸ðëèñü ïåðüÿìè è ïðî÷åå, à íå îáû÷íûìè êàê ñåé÷àñ. À øî, êàâî?
Çàïèëèòòü dickrub, ÷òîáû êàæäûé íàñòîÿùèé ìóæ÷èíà ìîã ïîñîðåâíîâàòüñÿ ñ äðóãèì íàñòîÿùèì ìóæ÷èíîé â ñâî¸ì ìóæûöêîì ôåõòîâàíèè.
Çàïèëèòü óíàòõàì âîçìîæíîñòü òðàõàòüñÿ ñåêñîì â ýòè, êàê èõ.. Õóéíûå îòâåðñòèÿ "slit".
*/
/mob/living/carbon/human/proc/cum(mob/living/carbon/human/H as mob, mob/living/carbon/human/P as mob, var/hole = "floor")
	var/ya = "&#255;"
	var/message = ""
	var/turf/T
	var/obj/item/weapon/reagent_containers/R = locate() in P.loc

	if (H.gender == MALE)
		var/datum/reagent/blood/source = H.get_blood(H.vessel)
		if (P)
			T = get_turf(P)
		else
			T = get_turf(H)
		if (H.multiorgasms < H.potenzia)
			if(R && (P == H))
				R.reagents.add_reagent("semen", rand(5, 15))
			else
				var/obj/effect/decal/cleanable/cum/C = new(T)
				// Update cum information.
				C.blood_DNA = list()
				if(source.data["blood_type"])
					C.blood_DNA[source.data["blood_DNA"]] = source.data["blood_type"]
				else
					C.blood_DNA[source.data["blood_DNA"]] = "O+"

		if (H.species.genitals)
			if (hole == "mouth")
				message = pick("êîí÷àåò [P] â ðîò.", "êîí÷àåò [P] â ãëîòêó.", "çàïîëí[ya]åò ðîò [P] ñåìåíåì.", "áðûçãàåò ñïåðìîé â ðîò [P].", "ñïóñêàåò íà [ya]çû÷îê [P].")
				var/datum/reagents/holder = new
				var/amt = rand(20,30)
				holder.add_reagent("semen", amt)
				holder.trans_to_mob(P, amt, CHEM_INGEST)

			else if (hole == "vagina")
				message = pick("êîí÷àåò â [P]", "ñïóñêàåò â êèñêó [P]", "çàïîëí[ya]åò âëàãàëèùå [P] ñïåðìîé.", "ðåçêî âûò[ya]ãèâàåò ÷ëåí èç [P], à çàòåì ñïóñêàåò íà ïîë.", "ïðîíèêàåò â [P] ïîñëåäíèé ðàç, çàòåì ñîäðàãàåòñ[ya]. Ñïåðìà ìåäëåííî âûòåêàåò èç ùåëè [P].")

			else if (hole == "anus")
				message = pick("êîí÷àåò [P] â çàä.", "çàïîëí[ya]åò çàäíèöó [P] ñïåðìîé.", "ñïóñêàåò ñåìåííóþ æèäêîñòü â ïð[ya]ìóþ êèøêó [P].", "âûäåðãèâàåò ÷ëåí èç [P], à çàòåì îáèëüíî êîí÷àåò íà [P.identifying_gender == MALE ? "åãî" : "å¸"] ïîïêó.", "âûò[ya]ãèâàåò ÷ëåí èç çàäíèöû [P] è ñðàçó æå ñïóñêàåò íà ïîë.")

			else if (hole == "floor")
				message = pick("êîí÷àåò íà ïîë!", "êîí÷àåò íà ñâîåãî ïàðòí¸ðà!")

			else if (hole == "cumhand")
				if (P != H)
					message = pick("êîí÷àåò [P] â ðóêó.", "êîí÷àåò â ñæàòûé êóëà÷îê [P].", "ðàçáðûçãèâàåò ñåì[ya], ïà÷êà[ya] ëàäîøêó è ïàëüöû [P].", "ñòðåë[ya]åò òóãîé ñòðó¸é ìàëàôüè, çàë[ya]ïûâà[ya] ðóêó [P].")
				else if (!R)
					message = pick("êîí÷àåò ñåáå â ðóêó.", "êîí÷àåò â ñâîé ñæàòûé êóëà÷îê.", "ðàçáðûçãèâàåò ñåì[ya], ïà÷êà[ya] ñâîþ ëàäîøêó è ïàëüöû.", "ñòðåë[ya]åò òóãîé ñòðó¸é ìàëàôüè, çàë[ya]ïûâà[ya] ñâîþ ðóêó.")
				else
					message = pick("êîí÷àåò â [R.name].", "îïóñêàåòñ[ya] ê ïîëó è êîí÷àåò â [R.name].", "çàïîëí[ya]åò [R.name] îáðàçöîì ÄÍÊ.", "ïîäíåñ[ya] ÷ëåí ê [R.name], êîí÷àåò.")

			else if (hole == "rub")
				message = pick("êîí÷àåò ñåáå íà æèâîò.", "öåëèòñ[ya] íà æèâîò [P], ñòðåë[ya]åò òóãîé ñòðó¸é ìàëàôüè, íî ïðîìàõèâàåòñ[ya].", "ðàçáðûçãèâàåò ñåì[ya] ïî ïóçèêó [P].", "çàïîëí[ya]åò âíåøíþþ ÷àñòü âàãèíû [P] ò¸ïëîé ñïåðìîé.")

/*			else if (hole == "assfuck")
				message = pick("äîâîäèò [H] äî ïðåäåëà è [H.identifying_gender == MALE ? "îí" : "îíà"] êîí÷àåò [H] â çàä.", "äîâîäèò [H] äî ñåì[ya]èçâåðæåíè[ya] çàïîëí[ya]åò çàäíèöó [H] ñïåðìîé.", "äîâåä[ya] [H] äî ïðåäåëà ïîçâîë[ya]åò [H.identifying_gender == MALE ? "åìó" : "åé"] ñïóñòèòü ñåìåííóþ æèäêîñòü ñåáå â ïð[ya]ìóþ êèøêó.", "â ïîñëåäíèé ìîìåíò âûò[ya]ãèâàåò ÷ëåí èç çàäíèöû, èç-çà ÷åãî [H] îáèëüíî êîí÷àåò íà ñâîé ëîáîê.", "â ïîñëåäíèé ìîìåíò âûò[ya]ãèâàåò ÷ëåí èç ñâîåé ïð[ya]ìîé êèøêè, èç-çà ÷åãî [H] êîí÷àåò íà ñâîé ëîáîê", "â ïîñëåäíèé ìîìåíò âûò[ya]ãèâàåò ÷ëåí èç ñâîåé ïð[ya]ìîé êèøêè, èç-çà ÷åãî [H] îáèëüíî êîí÷àåò íà ñâîé ëîáîê", "â ïîñëåäíèé ìîìåíò âûò[ya]ãèâàåò ÷ëåí èç ñâîåé ïð[ya]ìîé êèøêè, èç-çà ÷åãî [H] êîí÷àåò íà [H.identifying_gender == MALE ? "åãî" : "å¸"] ïðîìåæíîñòü")

Ñþäà âïèëèòü âûäà÷ó ñîîáùåíèÿ ëîãè÷íóþ äëÿ âûøåíàïèñàííîãî, äîáàâèòü åù¸ âñÿêèõ ñîîáùåíèé.

*/
			else if (hole == "assfuck")
				message = pick("êîí÷àåò [P] â çàäíèöó.", "èçâåðãàåò ñåì[ya] â ïð[ya]ìóþ êèøêó [P].", "ñïóñêàåò ñåìåííóþ æèäêîñòü â ïð[ya]ìóþ êèøêó [P].", "îáèëüíî ñïóñêàåò â [P]", "äåðæà [P] çà á¸äðà êîí÷àåò [P.identifying_gender == MALE ? "åìó" : "åé"] â çàäíèöó.", "èçâåðãàåò ñåì[ya] â ïð[ya]ìóþ êèøêó [P], äåðæà [P.identifying_gender == MALE ? "òîãî" : "òó"] çà á¸äðà.", "ñïóñêàåò â ïð[ya]ìóþ êèøêó [P].", "îáèëüíî ñïóñêàåò â çàäíèöó [P]")

		else
			message = pick("êîí÷àåò!", "îðãàçìèðóåò!")

		playsound(loc, "honk/sound/interactions/final_m[rand(1, 5)].ogg", 70, 1, 0)

		H.visible_message("<B>[H] [message]</B>")
		if (istype(P.loc, /obj/structure/closet))
			P.visible_message("<B>[H] [message]</B>")
		H.lust = 5
		H.resistenza += 50

	else
		if(R && (P == H))
			R.reagents.add_reagent("f_lube", rand(5, 15))
			message = pick("èçâèâàåòñ[ya] â ïðèñòóïå îðãàçìà è çàïîëí[ya]åò [R.name] ñâîåé ñìàçêîé", "ïðèêðûâàåò ãëàçà è ìåëêî äðîæèò. [R.name] íàïîëí[ya]åòñ[ya] ñòåêàþùèìè ñîêàìè", "ñîäðàãàåòñ[ya], à çàòåì ðåçêî ðàññëàáë[ya]åòñ[ya], çàïîëíèâ [R.name] ñìàçêîé", "çàìèðàåò, çàêàòèâ ãëàçà, è êîí÷àåò â [R.name] ñìàçêîé")
		else
			message = pick("èçâèâàåòñ[ya] â ïðèñòóïå îðãàçìà", "ïðèêðûâàåò ãëàçà è ìåëêî äðîæèò", "ñîäðàãàåòñ[ya], à çàòåì ðåçêî ðàññëàáë[ya]åòñ[ya]", "çàìèðàåò, çàêàòèâ ãëàçà")
		H.visible_message("<B>[H] [message].</B>")
		if (istype(P.loc, /obj/structure/closet))
			P.visible_message("<B>[H] [message].</B>")
		playsound(loc, "honk/sound/interactions/final_f[rand(1, 3)].ogg", 90, 1, 0)
		var/delta = pick(20, 30, 40, 50)
		src.lust -= delta

	H.druggy = 60
	H.multiorgasms += 1
	H.erpcooldown = rand(200, 450)
	if (H.multiorgasms > H.potenzia / 3)
		H.druggy = 300
		H.erpcooldown = 600

mob/living/carbon/human/proc/fuck(mob/living/carbon/human/H as mob, mob/living/carbon/human/P as mob, var/hole)
	var/ya = "&#255;"
	var/message = ""
	var/retaliation_message = FALSE

	switch(hole)

/* VAGLICK */

		if("vaglick")

			message = pick("âûëèçûâàåò [P].", "îòëèçûâàåò [P].")
			if (prob(35))
				message = pick("âûëèçûâàåò [P].", "ïîëèðóåò ïðîìåæíîñòü [P] [ya]çûêîì.", "îòëèçûâàåò [P].", "ëàñêàåò [P] [ya]çû÷êîì.", "ïîãðóæàåò ñâîé [ya]çûê â [P]", "èãðàåòñ[ya] ñ [P] [ya]çû÷êîì", "ìåäëåííî ïðîâîäèò [ya]çûêîì âäîëü ïðîìåæíîñòè [P]")

			if (H.lastfucked != P || H.lfhole != hole)
				H.lastfucked = P
				H.lfhole = hole

			H.arousal += 12
			if (H.lust < 6)
				H.lust += 6
			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += 10
				P.arousal += 20
				P.moan()
				var/datum/reagents/holder = new
				var/amt = rand(1,5)
				holder.add_reagent("f_lube", amt)
				holder.trans_to_mob(H, amt, CHEM_INGEST)
				retaliation_message = pick("ñãëàòûâàåò ñîêè [P].", "ñãëàòûâàåò ñîêè [P], ïîïàâøèå [H.identifying_gender==FEMALE ? "åé" : "åìó"] â ðîò.", "ãëîòàåò ñìàçêó [P].", "ñîáèðàåò [ya]çûêîì íåêòàð [P] è ïðîãëàòûâåò åãî.")
				H.visible_message("<B>[H]</B> [retaliation_message]")
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += 10
				P.arousal += 20
				if (P.lust >= P.resistenza)
					P.cum(P, H)
					message = pick("Âû ÷óâñòâóåòå, êàê âàãèíàëüíûå ìûøöû [P] íà÷èíàþò ðåçêî ñîêðàùàòüñ[ya].", "Âû ÷óâñòâóåòå, êàê â âàø ðîò ïîïàäàåò íåêîòîðîå êîëè÷åñòâî ñîêîâ [P] â ïðîöåññå îðãàçìà.", "Âû ÷óâñòâóåòå, êàê âëàæíà[ya] êèñêà [P] ðåçêî ñæèìàåò âàø [ya]çû÷îê âíóòðè ñåá[ya].", "Âû ÷óâñòâóåòå, êàê âñ¸ âíóòðè [P] ñæèìàåòñ[ya], à å¸ êëèòîð íà÷èíàåò ïóëüñèðîâàòü.", "Âû ÷óâñòâóåòå, êàê [P] êîí÷àåò âàì â ðîò ñòðóéêîé ñìàçêè, îðãàçìèðó[ya].")
					to_chat(H, message)
					var/datum/reagents/holder = new
					var/amt = rand(20,30)
					holder.add_reagent("f_lube", amt)
					holder.trans_to_mob(H, amt, CHEM_INGEST)
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/bj[rand(1, 11)].ogg", 50, 1, -1)

/* ASSLICK

		if("asslick")
			message = pick("âûëèçûâàåò àíóñ [P]", "òùàòåëüíî ïîëèðóåò àíàëüíîå êîëå÷êî [P]")
			if (prob(35))
				message = pick("òðàõàåò ëè÷èêî [P], ïðîâîä[ya] ïî íåìó êèñêîé.", "ïîëèðóåò [ya]çûê [P] ñâîåé ïðîìåæíîñòüþ, óñòðîèâøèñü íà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ëèöå.", "çàñîâûâàåò íîñ [P] ïðîìåæ ïîëîâûõ ãóá è ¸ðçàåò íà í¸ì.", "êðåïêî æì¸òñ[ya] ê ëèöó [P] ïðîìåæíîñòüþ, âûãèáà[ya] ñïèíó.", "íàñèëóåò ëèöî [P] áûñòðûìè äâèæåíè[ya]ìè òàçà.", "èãðàåòñ[ya] ñ ðîòèêîì [P], åëîç[ya] ïî íåìó âëàãàëèùåì.", "ìåäëåííî ïðîâîäèò ïðîìåæíîñòüþ ïî ëèöó [P].", "ðàçìàçûâàåò ñâîè ñîêè ïî ôèçèîíîìèè [P] äâèæåíè[ya]ìè òàçà.")

			message = pick()
 */
/* FACESITTING */

		if("facesitting")

			message = pick("åëîçèò âàãèíîé ïî ëèöó [P].", "ñíîøàåò ëèöî [P].")
			if (prob(35))
				message = pick("òðàõàåò ëè÷èêî [P], ïðîâîä[ya] ïî íåìó êèñêîé.", "ïîëèðóåò [ya]çûê [P] ñâîåé ïðîìåæíîñòüþ, óñòðîèâøèñü íà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ëèöå.", "çàñîâûâàåò íîñ [P] ïðîìåæ ïîëîâûõ ãóá è ¸ðçàåò íà í¸ì.", "êðåïêî æì¸òñ[ya] ê ëèöó [P] ïðîìåæíîñòüþ, âûãèáà[ya] ñïèíó.", "íàñèëóåò ëèöî [P] áûñòðûìè äâèæåíè[ya]ìè òàçà.", "èãðàåòñ[ya] ñ ðîòèêîì [P], åëîç[ya] ïî íåìó âëàãàëèùåì.", "ìåäëåííî ïðîâîäèò ïðîìåæíîñòüþ ïî ëèöó [P].", "ðàçìàçûâàåò ñâîè ñîêè ïî ôèçèîíîìèè [P] äâèæåíè[ya]ìè òàçà.")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("ì[ya]ãêî ñàäèòñ[ya] [P] íà ëèöî.", "ãðóáî íàñàæèâàåòñ[ya] íà ëèöî [P].", "ñàäèòñ[ya] íà ëèöî [P], óïèðà[ya]ñü ãîðîøèíêîé êëèòîðà [P.identifying_gender==FEMALE ? "åé" : "åìó"] ïîä íîñ.", "ñåäëàåò ëèöî [P] ñâîåé âëàæíîé ïðîìåæíîñòüþ.")
				H.lastfucked = P
				H.lfhole = hole

			P.arousal += 12
			if (P.lust < 6)
				P.lust += 6
			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				H.lust += 10
				H.arousal += 20
				H.moan()
				var/datum/reagents/holder = new
				var/amt = rand(1,5)
				holder.add_reagent("f_lube", amt)
				holder.trans_to_mob(P, amt, CHEM_INGEST)
				retaliation_message = pick("ñãëàòûâàåò ñîêè [H].", "ñãëàòûâàåò ñîêè [H], ïîïàâøèå [P.identifying_gender==FEMALE ? "åé" : "åìó"] â ðîò.", "ãëîòàåò ñìàçêó [H].", "ñîáèðàåò [ya]çûêîì íåêòàð [H] è ïðîãëàòûâåò åãî.")
				H.visible_message("<B>[P]</B> [retaliation_message]")
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
			if (H.stat != DEAD && H.stat != UNCONSCIOUS)
				H.lust += 10
				H.arousal += 20
				if (H.lust >= H.resistenza)
					H.cum(H, P)
					message = pick("Âû ÷óâñòâóåòå, êàê âàãèíàëüíûå ìûøöû [H] íà÷èíàþò ðåçêî ñîêðàùàòüñ[ya].", "Âû ÷óâñòâóåòå, êàê â âàø ðîò ïîïàäàåò íåêîòîðîå êîëè÷åñòâî ý[ya]êóë[ya]òà [H] â ïðîöåññå îðãàçìà.", "Âû ÷óâñòâóåòå, êàê âëàæíà[ya] êèñêà [H] ðåçêî ñæèìàåòñ[ya] íà âàøåì ëèöå.", "Âû ÷óâñòâóåòå, êàê âñ¸ âíóòðè [H] ñæèìàåòñ[ya], à å¸ êëèòîð íà÷èíàåò ïóëüñèðîâàòü.", "Âû ÷óâñòâóåòå, êàê [H] êîí÷àåò âàì íà ëèöî ñòðóéêîé ý[ya]êóë[ya]òà, îðãàçìèðó[ya].")
					to_chat(P, message)
					var/datum/reagents/holder = new
					var/amt = rand(20,30)
					holder.add_reagent("f_lube", amt)
					holder.trans_to_mob(P, amt, CHEM_INGEST)
				else
					H.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)
			if(P.a_intent == I_HURT)
				H.apply_damage(5, BRUTE, BP_GROIN)
				blood_splatter(src,H,0)
				retaliation_message = pick("ñèëüíî êóñàåò [H] çà íîãó.", "ñæèìàåò çóáû ìåæäó íîã [H].", "çëîáíî ñìîòðèò èç-ïîä êîëåí [H], ñêàë[ya] îêðîâàâëåííûå çóáû.", "èçî âñåõ ñèë ïûòàåòñ[ya] âûðâàòüñ[ya] èç-ïîä íîã [H].")
				H.visible_message("<font color=red>[P] [retaliation_message]</font>")

/* FORCELICK */

		if("forcelick")

			message = pick("çàñòàâë[ya]åò [P] îòëèçûâàòü.", "ïðèíóæäàåò [P] âûëèçûâàòü ëîíî.")
			if (prob(35))
				message = pick("ñèëüíî ïðèæèìàåò ãîëîâó [P] ê ñåáå.", "òðàõàåò ðîò è íîñ [P], ðàáîòà[ya] òàçîì.", "íàñèëóåò ôèçèîíîìèþ [P], âöåïèâøèñü â [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ãîëîâó.", "çàäåðæèâàåò ãîëîâó [P] ó ñâîåãî âëàãàëèùà, íàñëàæäà[ya]ñü ðàáîòîé [ya]çûêà.", "ãðóáî ñæèìàåò ïàëüöû íà ãîëîâå [P], êîãäà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] [ya]çûê ïîãðóæàåòñ[ya] ãëóáæå.")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("ì[ya]ãêî íàêëîí[ya]åò [P] ê ñâîåé ïèñå÷êå.", "ãðóáî õâàòàåò ãîëîâó [P] è ïðèñëîí[ya]åò ê ñâîåé ïðîìåæíîñòè.", "íàêëîí[ya]åò ëèöî [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] íîñ â ñâîþ ìîêðåíüêóþ êèñêó.", "ïðèñëîí[ya]åò ðîò [P] ê ñâîåé âëàæíîé ïðîìåæíîñòè.")
				H.lastfucked = P
				H.lfhole = hole

			P.arousal += 12
			if (P.lust < 6)
				P.lust += 6
			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				H.lust += 10
				H.arousal += 20
				H.moan()
				var/datum/reagents/holder = new
				var/amt = rand(1,5)
				holder.add_reagent("f_lube", amt)
				holder.trans_to_mob(P, amt, CHEM_INGEST)
				retaliation_message = pick("ñãëàòûâàåò ñîêè [H].", "ñãëàòûâàåò ñîêè [H], ïîïàâøèå [P.identifying_gender==FEMALE ? "åé" : "åìó"] â ðîò.", "ãëîòàåò ñìàçêó [H].", "ñîáèðàåò [ya]çûêîì íåêòàð [H] è ïðîãëàòûâåò åãî.")
				H.visible_message("<B>[P]</B> [retaliation_message]")
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
			if (H.stat != DEAD && H.stat != UNCONSCIOUS)
				H.lust += 10
				H.arousal += 20
				if (H.lust >= H.resistenza)
					H.cum(H, P)
					message = pick("Âû ÷óâñòâóåòå, êàê âàãèíàëüíûå ìûøöû [H] íà÷èíàþò ðåçêî ñîêðàùàòüñ[ya].", "Âû ÷óâñòâóåòå, êàê â âàø ðîò ïîïàäàåò íåêîòîðîå êîëè÷åñòâî ý[ya]êóë[ya]òà [H] â ïðîöåññå îðãàçìà.", "Âû ÷óâñòâóåòå, êàê âëàæíà[ya] êèñêà [H] ðåçêî ñæèìàåò âàø [ya]çû÷îê âíóòðè ñåá[ya].", "Âû ÷óâñòâóåòå, êàê âñ¸ âíóòðè [H] ñæèìàåòñ[ya], à [H.identifying_gender==FEMALE ? "å¸" : "åãî"] êëèòîð íà÷èíàåò ïóëüñèðîâàòü.", "Âû ÷óâñòâóåòå, êàê [H] êîí÷àåò âàì â ðîò ñòðóéêîé ý[ya]êóë[ya]òà, îðãàçìèðó[ya].")
					to_chat(P, message)
					var/datum/reagents/holder = new
					var/amt = rand(20,30)
					holder.add_reagent("f_lube", amt)
					holder.trans_to_mob(P, amt, CHEM_INGEST)
				else
					H.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/bj[rand(1, 11)].ogg", 50, 1, -1)
			if(P.a_intent == I_HURT)
				H.apply_damage(5, BRUTE, BP_GROIN)
				blood_splatter(src,H,0)
				retaliation_message = pick("[ya]ðîñòíî êóñàåò [H] çà íîãè.", "ñæèìàåò çóáàìè êèñêó [H].", "âûãë[ya]äèò î÷åíü [P.identifying_gender==FEMALE ? "íåäîâîëüíîé" : "íåäîâîëüíûì"] ñâîèì íàõîæäåíèåì çäåñü.", "èçî âñåõ ñèë ïûòàåòñ[ya] âûðâàòüñ[ya] èç-ïîä á¸äåð [H].")
				H.visible_message("<font color=red>[P] [retaliation_message]</font>")

/* FINGERING */

		if("fingering")
			if (P != H)
				message = pick("ââîäèò äâà ïàëüöà â âàãèíó [P].", "òðàõàåò [P] ïàëüöàìè.")
				H.arousal += 12
			else
				message = pick("ââîäèò äâà ïàëüöà â ñâîþ âàãèíó.", "òðàõàåò ñåá[ya] ïàëüöàìè.")
			if (prob(35))
				if(P.species.get_bodytype() == SPECIES_UNATHI || P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_PROTEAN)
					if (P != H)
						message = pick("ââîäèò äâà ïàëüöà â âàãèíó [P].", "òåðåáèò ãîðîøèíó [P].", "òû÷åò ïàëüöàìè [P].", "ëàñêàåò [P] ïàëü÷èêàìè.", "íåæíî ïîãëàæèâàåò ïðîìåæíîñòü [P].", "ïîãðóæàåò ïàëüöû ãëóáîêî â [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] èçíóòðè.", "èçó÷àåò ãëóáèíû [P].")
						H.arousal += 12
					else
						message = pick("ââîäèò äâà ïàëüöà â ñâîþ âàãèíó.", "òåðåáèò ñâîþ ãîðîøèíó.", "òû÷åò â ñåá[ya] ïàëüöàìè.", "ëàñêàåò ñåá[ya] ïàëü÷èêàìè.", "íåæíî ïîãëàæèâàåò ñâîþ ïðîìåæíîñòü.", "ïîãðóæàåò ïàëüöû ãëóáîêî âî âëàãàëèùå, ëàñêà[ya] ñåá[ya] èçíóòðè.", "èçó÷àåò ñâîè ãëóáèíû.")
				if(P.species.get_bodytype() == SPECIES_TAJ || P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT || P.species.get_bodytype() == SPECIES_SERGAL)
					if (P != H)
						message = pick("ââîäèò äâà ïàëüöà â ïóøèñòóþ âàãèíó [P].", "òåðåáèò ãîðîøèíó [P].", "òû÷åò ïàëüöàìè [P].", "ëàñêàåò [P] ïàëü÷èêàìè.", "íåæíî ïîãëàæèâàåò ïóøèñòóþ ïðîìåæíîñòü [P].", "ïîãðóæàåò ïàëüöû ãëóáîêî â [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] èçíóòðè.", "èçó÷àåò ãëóáèíû [P].")
						H.arousal += 12
					else
						message = pick("ââîäèò äâà ïàëüöà â ñâîþ ïóøèñòóþ âàãèíó.", "òåðåáèò ñâîþ ãîðîøèíó.", "òû÷åò â ñåá[ya] ïàëüöàìè.", "ëàñêàåò ñåá[ya] ïàëü÷èêàìè.", "íåæíî ïîãëàæèâàåò ñâîþ ïóøèñòóþ ïðîìåæíîñòü.", "ïîãðóæàåò ïàëüöû ãëóáîêî âî âëàãàëèùå, ëàñêà[ya] ñåá[ya] èçíóòðè.", "èçó÷àåò ñâîè ãëóáèíû.")

			if (H.lastfucked != P || H.lfhole != hole)
				H.lastfucked = P
				H.lfhole = hole

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += 8
				P.arousal += 16
				P.moan()
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += 8
				P.arousal += 16
				if (P.lust >= P.resistenza)
					P.cum(P, H)
					message = pick("Âû ÷óâñòâóåòå, êàê âàãèíàëüíûå ìûøöû [P] íà÷èíàþò ðåçêî ñîêðàùàòüñ[ya] âîêðóã âàøèõ ïàëüöåâ.", "Âû ÷óâñòâóåòå, êàê ðåáðèñòûå ñòåíêè [P] êðåïêî ñæèìàþò âàøè ïðîìîêøèå ïàëüöû.", "Âû ÷óâñòâóåòå, êàê âëàæíà[ya] êèñêà [P] ðåçêî ñæèìàåò âàøè ïàëüöû âíóòðè ñåá[ya].", "Âû ÷óâñòâóåòå, ÷òî âàøèì ïàëüöàì ñòàíîâèòñ[ya] òåñíî âíóòðè ãîð[ya]÷åé ïèñå÷êè [P].", "Âû ÷óâñòâóåòå, êàê ïî âíóòðåííåé ñòîðîíå âàøåé ëàäîíè ñòåêàåò ò¸ïëà[ya] ñòðóéêà ý[ya]êóë[ya]òà [P].")
					to_chat(H, message)
				else
					P.moan()
			playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)
			H.do_fucking_animation(P)

/* JERK */

		if("jerk")
			if (P != H)
				message = pick("ñòèìóëèðóåò èíñòðóìåíò [P] âîçâðàòíî-ïîñòóïàòåëüíûìè äâèæåíè[ya]ìè.", "äðî÷èò îðãàí [P] â áûñòðîì òåìïå.", "ìåäëåííî ëàñêàåò ÷ëåí [P] ïàëü÷èêàìè.", "íàäðà÷èâàåò [P] êóëà÷êîì.", "äðî÷èò ÷ëåí [P], çàêëþ÷èâ åãî â êîëå÷êî èç äâóõ ïàëüöåâ.", "ìåäëåííî ñòèìóëèðóåò îðãàí [P].", "äðî÷èò [P], îáõâàòèâ åãî ÷ëåí ðóêîé.", "íàäðà÷èâàåò ÷ëåí [P].", "ïîãëàæèâàåò ãîëîâêó ÷ëåíà [P] áîëüøèì ïàëüöåì.", "ä¸ðãàåò ïîëîâîé îðãàí [P].", "ïåðåä¸ðãèâàåò [P].", "äðî÷èò [P].")
				H.arousal += 10
			else
				message = pick("ñòèìóëèðóåò ñâîé èíñòðóìåíò âîçâðàòíî-ïîñòóïàòåëüíûìè äâèæåíè[ya]ìè.", "äðî÷èò ñâîé îðãàí â áûñòðîì òåìïå.", "ìåäëåííî ëàñêàåò ñâîé ÷ëåí ïàëü÷èêàìè.", "íàäðà÷èâàåò ñåáå êóëà÷êîì.", "äðî÷èò ñâîé ÷ëåí, çàêëþ÷èâ åãî â êîëå÷êî èç äâóõ ïàëüöåâ.", "ìåäëåííî ñòèìóëèðóåò ñâîé îðãàí.", "äðî÷èò ñåáå, îáõâàòèâ ñâîé ÷ëåí ðóêîé.", "íàäðà÷èâàåò ÷ëåí [P.identifying_gender == MALE ? "ñàìîìó" : "ñàìîé"] ñåáå.", "ïîãëàæèâàåò ãîëîâêó ñâîåãî ÷ëåíà áîëüøèì ïàëüöåì.", "ä¸ðãàåò ñâîé ïîëîâîé îðãàí.", "ïåðåä¸ðãèâàåò ñåáå.", "äðî÷èò ñåáå.")
			if (H.lastfucked != P || H.lfhole != hole)
				if (P != H)
					message = pick("ì[ya]ãêî îáõâàòûâàåò ÷ëåí [P] ðóêîé.", "áåð¸ò ÷ëåí [P] â ðóêó.", "áåð¸ò îðãàí [P] â ðóêó è íà÷èíàåò íàäðà÷èâàòü [P].")
				else
					message = pick("ì[ya]ãêî îáõâàòûâàåò ñâîé ÷ëåí ðóêîé.", "áåð¸ò ñâîé ÷ëåí â ðóêó.", "áåð¸ò ñâîé îðãàí â ðóêó è íà÷èíàåò íàäðà÷èâàòü ñåáå.")
				H.lastfucked = P
				H.lfhole = hole

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += 8
				P.arousal += 10
				P.moan()
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += 8
				P.arousal += 10
				if (P.lust >= P.resistenza)
					P.cum(P, H, "cumhand")
				else
					P.moan()
			playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)
			H.do_fucking_animation(P)

/* BLOWJOB */

		if("blowjob")

			if(H.species.get_bodytype() == SPECIES_HUMAN || H.species.get_bodytype() == SPECIES_HUMAN_VATBORN || H.species.get_bodytype() == SPECIES_RAPALA || H.species.get_bodytype() == SPECIES_VASILISSAN || H.species.get_bodytype() == SPECIES_PROTEAN || H.species.get_bodytype() == SPECIES_SKRELL)
				message = pick("îòñàñûâàåò [P].", "ñîñåò ÷ëåí [P].", "ñòèìóëèðóåò ÷ëåí [P] [ya]çûêîì.")
				if (prob(35))
					message = pick("öåëóåò îðãàí [P], ïðèêðûâ ãëàçà îò óäîâîëüñòâè[ya].", "ïîñòàíûâàåò, ïðèêðûâ ãëàçà, íå âûíèìà[ya] ÷ëåí [P] èçî ðòà.", "ëàñêàåò ÷ëåí [P] [ya]çû÷êîì, ïðèäåðæèâà[ya] åãî ðóêîé.", "îáëèçûâàåò ÷ëåí [P] ïî âñåé äëèíå.", "ïîãðóæàåò ÷ëåí [P] âñå ãëóáæå ñåáå â ðîò.", "êîí÷èêîì [ya]çûêà îáëèçûâàåò ãîëîâêó ÷ëåíà [P].", "ñîñ¸ò ëåäåíåö [P].", "äâèãàåò ãîëîâîé âçàä-âïåð¸ä, ñòèìóëèðó[ya] ÷ëåí [P].", "òùàòåëüíî âûëèçûâàåò ÷ëåí [P].", "çàæìóðèâøèñü, ïîëíîñòüþ çàãëàòûâàåò ìàëûøà [P].", "ëàñêàåò ÷ëåí [P], ïîìîãà[ya] ñåáå ðóêàìè.")
				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ì[ya]ãêî îáõâàòûâàåò ÷ëåí [P] ãóáàìè.", "ïðèñòóïàåò ñîñàòü ÷ëåí [P].")
					H.lastfucked = P
					H.lfhole = hole

			if(H.species.get_bodytype() == SPECIES_UNATHI || H.species.get_bodytype() == SPECIES_AKULA || H.species.get_bodytype() == SPECIES_SERGAL || H.species.get_bodytype() == SPECIES_TESHARI)
				message = pick("îáëèçûâàåò ÷ëåí [P].", "ñòèìóëèðóåò îðãàí [P] [ya]çûêîì.", "òð¸ò ÷ëåí [P] î ñâîé [ya]çûê.", "ïðîòàëêèâàåò ÷ëåí [P] ñåáå â ïàñòü, ñòàðà[ya]ñü íå çàöåïèòü åãî çóáàìè.", "ñòèìóëèðóåò ÷ëåí [P] [ya]çûêîì.")
				if (prob(35))
					message = pick("îáëèçûâàåò îðãàí [P], ïðèêðûâ ãëàçà îò óäîâîëüñòâè[ya].", "ïîñòàíûâàåò, ïðèêðûâ ãëàçà, íå âûíèìà[ya] ÷ëåí [P] èç ïàñòè.", "ëàñêàåò ÷ëåí [P] [ya]çû÷êîì, ïðèäåðæèâà[ya] åãî ðóêîé.", "îáëèçûâàåò ÷ëåí [P] ïî âñåé äëèíå.", "ïîãðóæàåò ÷ëåí [P] âñå ãëóáæå ñåáå â ïàñòü.", "êîí÷èêîì [ya]çûêà îáëèçûâàåò ãîëîâêó ÷ëåíà [P].", "îáëèçûâàåò ëåäåíåö [P].", "äâèãàåò ãîëîâîé âçàä-âïåð¸ä, ñòèìóëèðó[ya] ÷ëåí [P].", "òùàòåëüíî âûëèçûâàåò ÷ëåí [P].", "çàæìóðèâøèñü, ïîëíîñòüþ çàãëàòûâàåò ìàëûøà [P].", "ëàñêàåò ÷ëåí [P], ïîìîãà[ya] ñåáå ðóêàìè.")
				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("êîí÷èêîì [ya]çûêà êàñàåòñ[ya] ÷ëåíà [P].", "ïðèñòóïàåò îáëèçûâàòü ÷ëåí [P].")
					H.lastfucked = P
					H.lfhole = hole

			if(H.species.get_bodytype() == SPECIES_TAJ || H.species.get_bodytype() == SPECIES_VULPKANIN || H.species.get_bodytype() == SPECIES_ZORREN_HIGH || H.species.get_bodytype() == SPECIES_ZORREN_FLAT)
				message = pick("âûëèçûâàåò ÷ëåí [P].", "îáâîäèò ñâîèì [ya]çû÷êîì âîêðóã ÷ëåíà [P].", "ïðîòàëêèâàåò ÷ëåí [P] ñåáå â ïàñòü, ñòàðà[ya]ñü íå çàöåïèòü åãî çóáàìè.", "ñòèìóëèðóåò ÷ëåí [P] [ya]çûêîì.")
				if (prob(35))
					message = pick("âûëèçûâàåò îðãàí [P], ïðèêðûâ ãëàçà îò óäîâîëüñòâè[ya].", "ïîñòàíûâàåò, ïðèêðûâ ãëàçà, íå âûíèìà[ya] ÷ëåí [P] èç ïàñòè.", "ëàñêàåò ÷ëåí [P] [ya]çû÷êîì, ïðèäåðæèâà[ya] åãî ðóêîé.", "îáëèçûâàåò ÷ëåí [P] ïî âñåé äëèíå.", "ïîãðóæàåò ÷ëåí [P] âñå ãëóáæå ñåáå â ïàñòü.", "êîí÷èêîì [ya]çûêà îáëèçûâàåò ãîëîâêó ÷ëåíà [P].", "âûëèçûâàåò ëåäåíåö [P].", "äâèãàåò ãîëîâîé âçàä-âïåð¸ä, ñòèìóëèðó[ya] ÷ëåí [P].", "òùàòåëüíî âûëèçûâàåò ÷ëåí [P].", "çàæìóðèâøèñü, ïîëíîñòüþ çàãëàòûâàåò ìàëûøà [P].", "ëàñêàåò ÷ëåí [P], ïîìîãà[ya] ñåáå ðóêàìè.")
				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("êîí÷èêîì [ya]çûêà êàñàåòñ[ya] ÷ëåíà [P].", "ïðèñòóïàåò âûëèçûâàòü ÷ëåí [P].")
					H.lastfucked = P
					H.lfhole = hole

			if(H.species.get_bodytype() == SPECIES_VOX || H.species.get_bodytype() == SPECIES_NEVREAN)
				message = pick("îáëèçûâàåò ÷ëåí [P].", "ñòèìóëèðóåò îðãàí [P] [ya]çûêîì.", "òð¸ò ÷ëåí [P] î ñâîé [ya]çûê.", "ïðîòàëêèâàåò ÷ëåí [P] ñåáå â ãëîòêó, ñòàðà[ya]ñü íå çàöåïèòü åãî êëþâîì.", "ñòèìóëèðóåò ÷ëåí [P] [ya]çûêîì.")
				if (prob(35))
					message = pick("îáëèçûâàåò îðãàí [P], ïðèêðûâ ãëàçà îò óäîâîëüñòâè[ya].", "ïîñòàíûâàåò, ïðèêðûâ ãëàçà, íå âûíèìà[ya] ÷ëåí [P] èç êëþâà.", "ëàñêàåò ÷ëåí [P] [ya]çû÷êîì, ïðèäåðæèâà[ya] åãî êðûëîì.", "îáëèçûâàåò ÷ëåí [P] ïî âñåé äëèíå.", "ïîãðóæàåò ÷ëåí [P] âñå ãëóáæå ñåáå â êëþâ.", "êîí÷èêîì [ya]çûêà îáëèçûâàåò ãîëîâêó ÷ëåíà [P].", " îáëèçûâàåò ëåäåíåö [P].", "äâèãàåò ãîëîâîé âçàä-âïåð¸ä, ñòèìóëèðó[ya] ÷ëåí [P].", "òùàòåëüíî âûëèçûâàåò ÷ëåí [P].", "çàæìóðèâøèñü, ïîëíîñòüþ çàãëàòûâàåò ìàëûøà [P].", "ëàñêàåò ÷ëåí [P] [ya]çûêîì.")
				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("êîí÷èêîì [ya]çûêà êàñàåòñ[ya] ÷ëåíà [P].", "ïðèñòóïàåò îáëèçûâàòü ÷ëåí [P].")
					H.lastfucked = P
					H.lfhole = hole

			if(H.species.get_bodytype() == SPECIES_PROMETHEAN)
				message = pick("îòñàñûâàåò [P].", "ñîñåò ÷ëåí [P].", "ñòèìóëèðóåò ÷ëåí [P] [ya]çûêîì.")
				if (prob(35))
					message = pick("ñìà÷íî öåëóåò îðãàí [P], ïðèêðûâ ãëàçà îò óäîâîëüñòâè[ya].", "ïîñòàíûâàåò, ïðèêðûâ ãëàçà, íå âûíèìà[ya] ÷ëåí [P] èçî ðòà.", "ëàñêàåò ÷ëåí [P] [ya]çû÷êîì, ïîêðûâà[ya] åãî â[ya]çêîé ñëèçüþ.", "îáëèçûâàåò ÷ëåí [P] ïî âñåé äëèíå, îñòàâë[ya][ya] ñëåä èç ñëèçè.", "ïîãðóæàåò ÷ëåí [P] âñå ãëóáæå ñåáå â ðîò.", "êîí÷èêîì [ya]çûêà îáëèçûâàåò ãîëîâêó ÷ëåíà [P].", "ñìà÷èâàåò êîí÷èê ÷ëåíà [P] ëèïêîé ñëèçüþ è ñíîâà áåð¸ò åãî â ðîò.", "ñîñåò ëåäåíåö [P].", "äâèãàåò ãîëîâîé âçàä-âïåð¸ä, ñòèìóëèðó[ya] ÷ëåí [P].", "òùàòåëüíî âûëèçûâàåò ÷ëåí [P].", "çàæìóðèâøèñü, ïîëíîñòüþ çàãëàòûâàåò ìàëûøà [P].", "ëàñêàåò ÷ëåí [P], ïîìîãà[ya] ñåáå ðóêàìè.")
				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ì[ya]ãêî îáõâàòûâàåò ÷ëåí [P] ãóáàìè, îáâîëàêèâà[ya] åãî ñëèçüþ.", "ïðèñòóïàåò ñîñàòü ÷ëåí [P].")
					H.lastfucked = P
					H.lfhole = hole

			if(H.species.get_bodytype() == SPECIES_DIONA)
				return

			H.arousal += 12
			if (H.lust < 6)
				H.lust += 6
			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += 10
				P.arousal += 20
				P.moan()
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += 10
				P.arousal += 20
				if (P.lust >= P.resistenza)
					P.cum(P, H, "mouth")
				else
					P.moan()
			playsound(loc, "honk/sound/interactions/bj[rand(1, 11)].ogg", 50, 1, -1)
			H.do_fucking_animation(P)
			if (prob(P.potenzia))
				H.oxyloss += 3
				H.visible_message("<B>[H]</B> [pick("äàâèòñ[ya] èíñòðóìåíòîì <B>[P]</B>", "çàäûõàåòñ[ya]", "êîð÷èòñ[ya] â ðâîòíîì ïîçûâå")].")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> [pick("äàâèòñ[ya] èíñòðóìåíòîì <B>[P]</B>", "çàäûõàåòñ[ya]", "êîð÷èòñ[ya] â ðâîòíîì ïîçûâå")].")

/* VAGINAL */

		if("vaginal")

			message = pick("òðàõàåò [P].", "ñíîøàåò [P].", "äîëáèò [P].")
			if (prob(35))
				message = pick("ãðóáî òðàõàåò [P].", "ïðåäà¸òñ[ya] ñòðàñòíîé ëþáâè ñ [P].", "ðåçêèì äâèæåíèåì ïîãðóæàåòñ[ya] âíóòðü [P].", "äâèæåòñ[ya] âíóòðè [P].", "äâèãàåò òàçîì, çàñàæèâà[ya] ÷ëåí â [P].", "ñòîíåò, íàâàëèâà[ya]ñü íà [P].", "ñèëüíî ïðèæèìàåòñ[ya] ïàõîì ê [P].", "íàñàæèâàåò [P] íà ñâîé ÷ëåí.", "÷óâñòâåííî èìååò [P].")
				playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("âñàæèâàåò ñâîé ÷ëåí ïî ñàìûå [ya]éöà â [P].", "ââîäèò ñâîé îðãàí ëþáâè â ëîíî [P].", "ïîãðóæàåò ñâîé êîðåíü ïîõîòè âíóòðü [P].", "ïðîíèêàåò â [P].")
				H.lastfucked = P
				H.lfhole = hole

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += H.potenzia * 2
				P.arousal += 20
				P.moan()
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += 10
			H.arousal += 20
			if (H.lust >= H.resistenza)
				H.cum(H, P, "vagina")
			else
				H.moan()

			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += H.potenzia * 0.5
				P.arousal += 20
				if (P.lust >= P.resistenza)
					P.cum(P, H)
					message = pick("Âû ÷óâñòâóåòå, êàê âàãèíàëüíûå ìûøöû [P] íà÷èíàþò ðåçêî ñîêðàùàòüñ[ya] âîêðóã âàøåãî èíñòðóìåíòà.", "Âû ÷óâñòâóåòå, êàê ðåáðèñòûå ñòåíêè [P] êðåïêî ñæèìàþò âàø íàïð[ya]æ¸ííûé ÷ëåí.", "Âû ÷óâñòâóåòå, êàê âëàæíà[ya] êèñêà [P] ðåçêî ñæèìàåò âàø ÷ëåí âíóòðè ñåá[ya].", "Âû ÷óâñòâóåòå, ÷òî âàøåìó ïðèáîðó ñòàíîâèòñ[ya] òåñíî âíóòðè ãîð[ya]÷åé ïèñå÷êè [P].", "Âû ÷óâñòâóåòå, êàê ìûøöû âíóòðè ðàçãîð[ya]÷¸ííîé âàãèíû [P] ñèëüíî ñæèìàþòñ[ya] íåñêîëüêî ðàç, ïðèáëèæà[ya] âàñ ê îðãàçìó.")
					to_chat(H, message)
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)

/* ANAL */

		if("anal")

			message = pick("äîëáèò [P] â î÷êî.", "àíàëüíî ñíîøàåò [P].", "òðàõàåò [P] â àíóñ.", "òðàõàåò [P] â ïð[ya]ìóþ êèøêó", "ñíîøàåò [P] â àíàëüíîå îòâåðñòèå")
			if (prob(35))
				if(P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_PROTEAN || P.species.get_bodytype() == SPECIES_AKULA)
					message = pick("òðàõàåò [P] â çàäíèöó.", "òðàõàåò [P] â ïð[ya]ìóþ êèøêó", "âñàæèâàåò ÷ëåí [P] â àíàëüíîå êîëüöî ïî ñàìûå [ya]éöà.", "ìåñèò ãëèíó â øàõòå [P].", "ðàçðûâàåò [P] î÷êî áåøåíûìè ôðèêöè[ya]ìè.", "çàïóñêàåò ñâîåãî øàõòåðà â óãîëüíûå øàõòû [P].")
				if(P.species.get_bodytype() == SPECIES_TAJ || P.species.get_bodytype() == SPECIES_UNATHI || P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT)
					message = pick("òðàõàåò [P] ïîä õâîñò.", "÷óâñòâåííî ñíîøàåò [P] ïîä ïóøèñòûé õâîñò", "ñíîøàåò ïóøèñòûþ çàäíèöó [P]", "òðàõàåò [P] â ïð[ya]ìóþ êèøêó", "âñàæèâàåò ÷ëåí [P] â àíàëüíîå êîëüöî ïîä õâîñòîì ïî ñàìûå [ya]éöà.", "äîëáèò [P] ïîä ïóøèñòûé õâîñòèê.", "ìåñèò ãëèíó â øàõòå [P].", "ðàçðûâàåò [P] î÷êî áåøåíûìè ôðèêöè[ya]ìè.", "çàïóñêàåò ñâîåãî øàõòåðà â óãîëüíûå øàõòû [P].")
				if(P.species.get_bodytype() == SPECIES_UNATHI)
					message = pick("òðàõàåò [P] ïîä õâîñò.", "÷óâñòâåííî ñíîøàåò [P] ïîä õâîñò", "òðàõàåò [P] â ïð[ya]ìóþ êèøêó", "âñàæèâàåò ÷ëåí [P] â àíàëüíîå êîëüöî ïîä õâîñòîì ïî ñàìûå [ya]éöà.", "äîëáèò [P] ïîä õâîñòèê.", "ìåñèò ãëèíó â øàõòå [P].", "ðàçðûâàåò [P] î÷êî áåøåíûìè ôðèêöè[ya]ìè.", "çàïóñêàåò ñâîåãî øàõòåðà â óãîëüíûå øàõòû [P].")
				if(P.species.get_bodytype() == SPECIES_SKRELL || P.species.get_bodytype() == SPECIES_TESHARI || P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN)
					message = pick("òðàõàåò [P] â êëîàêó.", "âñàæèâàåò ÷ëåí â êëîàêó [P] ïî ñàìûå [ya]éöà.", "ìåñèò ãëèíó â øàõòå [P].", "ðàçðûâàåò êëîàêó [P] áåøåíûìè ôðèêöè[ya]ìè.", "çàïóñêàåò ñâîåãî øàõòåðà â óãîëüíûå øàõòû [P].")
				if(P.species.get_bodytype() == SPECIES_PROMETHEAN)
					message = pick("òðàõàåò [P] â çàäíèöó.", "âñàæèâàåò ÷ëåí [P] â àíàëüíîå êîëüöî ïî ñàìûå [ya]éöà, ë[ya]ïà[ya]ñü â â[ya]çêîé ñëèçè.", "ðàcò[ya]ãèâàåò [P] î÷êî áåøåíûìè ôðèêöè[ya]ìè.")
					playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("áåçæàëîñòíî ïðîðûâàåò àíàëüíîå îòâåðñòèå [P].", "âñàæèâàåò ÷ëåí [P] â î÷êî.", "ïðîíèêàåò â àíóñ [P]")
				H.lastfucked = P
				H.lfhole = hole

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += H.potenzia * 2
				P.arousal += 24
				P.moan()
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += 12
			H.arousal += 24

			if (H.lust >= H.resistenza)
				H.cum(H, P, "anus")
			else
				H.moan()

			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.arousal += 24
				if (H.potenzia > 13)
					P.lust += H.potenzia * 0.25
				else
					P.lust += H.potenzia * 0.75
				if (P.lust >= P.resistenza)
					P.cum(P, H)
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)

/* ORAL */

		if("oral")

			message = pick("òðàõàåò [P], çàñàæèâà[ya] ñâîé ÷ëåí [P.identifying_gender == FEMALE ? "åé" : "åìó"] â ãëîòêó.", "îðàëüíî ñíîøàåò [P].")
			if (prob(35))
				if(P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_PROTEAN || P.species.get_bodytype() == SPECIES_SKRELL)
					message = pick("îïèðàåòñ[ya] íà ïëå÷è [P], ïðèäåðæèâà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] è çàñàæèâà[ya] ÷ëåí âñ¸ ñèëüíåå è ñèëüíåå [P.identifying_gender==FEMALE ? "åé" : "åìó"] â ãëîòêó.", "òðàõàåò [P] â ðîò.", "íàñàæèâàåò ãîëîâó [P] íà ñâîé ÷ëåí.", "äåðæèò [P] çà ãîëîâó äâóì[ya] ðóêàìè è ñîâåðøàåò äâèæåíè[ya] òàçîì.", "äà¸ò ïîù¸÷èíû [P], ïðîäîëæà[ya] åáàòü æåðòâó â ðîò.", "äà¸ò ïîù¸÷èíû [P], ïðîäîëæà[ya] åáàòü [P.identifying_gender == FEMALE ? "äåâóøêó" : "ïàðí[ya]"] â ðîò.", "áåçæàñòíî ïîëüçóåòñ[ya] ãëîòêîé [P].", ", ðû÷à ñêâîçü çóáû, íàò[ya]ãèâàåò ãëîòêó [P] íà ñâîåãî ìàëûøà.", "íåùàäíî íàñèëóåò ãëîòêó [P].", ", ÷åðåçìåðíî óâëåêøèñü, òûêàåò ÷ëåíîì ìèìî ðòà [P], ïðîâîä[ya] ÷ëåíîì [P.identifying_gender == FEMALE ? "åé" : "åìó"] ïî ùåêå.")
				if(P.species.get_bodytype() == SPECIES_UNATHI || P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_SERGAL || P.species.get_bodytype() == SPECIES_TESHARI)
					message = pick("îïèðàåòñ[ya] íà ïëå÷è [P], ïðèäåðæèâà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] è çàñàæèâà[ya] ÷ëåí âñ¸ ñèëüíåå è ñèëüíåå [P.identifying_gender==FEMALE ? "åé" : "åìó"] â ãëîòêó.", "òðàõàåò [P] â çóáàñòóþ ïàñòü.", "íàñàæèâàåò ãîëîâó [P] íà ñâîé ÷ëåí.", "äåðæèò [P] çà ãîëîâó äâóì[ya] ðóêàìè è ñîâåðøàåò äâèæåíè[ya] òàçîì.", "äà¸ò ïîù¸÷èíû [P], ïðîäîëæà[ya] åáàòü [P.identifying_gender == FEMALE ? "áåäíóþ [ya]ùåðêó" : "áåäíîãî [ya]ùåðà"] â ïàñòü.", "áåçæàñòíî ïîëüçóåòñ[ya] ãëîòêîé [P].", ", ðû÷à ñêâîçü çóáû, íàò[ya]ãèâàåò ãëîòêó [P] íà ñâîåãî ìàëûøà.", ", ÷åðåçìåðíî óâëåêøèñü, òûêàåò ÷ëåíîì ìèìî ðòà [P] è äðîæèò îò ïðèêîñíîâåíè[ya] òâ¸ðäîé ÷åøóè.")
				if(P.species.get_bodytype() == SPECIES_TAJ || P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT)
					message = pick("îïèðàåòñ[ya] íà ïëå÷è [P], ïðèäåðæèâà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] è çàñàæèâà[ya] ÷ëåí âñ¸ ñèëüíåå è ñèëüíåå [P.identifying_gender==FEMALE ? "åé" : "åìó"] â ãëîòêó.", "òðàõàåò [P] â çóáàñòóþ ïàñòü.", "íàñàæèâàåò ãîëîâó [P] íà ñâîé ÷ëåí.", "äåðæèò [P] çà ãîëîâó äâóì[ya] ðóêàìè è ñîâåðøàåò äâèæåíè[ya] òàçîì.", "äà¸ò ïîù¸÷èíû [P], ïðîäîëæà[ya] åáàòü [P.identifying_gender == FEMALE ? "áåäíóþ êîøå÷êó" : "áåäíîãî êîò¸íêà"] â ïàñòü.", "áåçæàñòíî ïîëüçóåòñ[ya] ãëîòêîé [P].", ", ðû÷à ñêâîçü çóáû, íàò[ya]ãèâàåò ãëîòêó [P] íà ñâîåãî ìàëûøà.", ", ÷åðåçìåðíî óâëåêøèñü, òûêàåò ÷ëåíîì ìèìî ðòà [P] è äðîæèò îò ïðèêîñíîâåíè[ya] øåðñòè.")
				if(P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN)
					message = pick("îïèðàåòñ[ya] íà ïëå÷è [P], ïðèäåðæèâà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] è çàñàæèâà[ya] ÷ëåí âñ¸ ñèëüíåå è ñèëüíåå [P.identifying_gender==FEMALE ? "åé" : "åìó"] â ãëîòêó.", "òðàõàåò [P] ïð[ya]ìî â êëþâ.", "íàñàæèâàåò ãîëîâó [P] íà ñâîé ÷ëåí, ñòàðà[ya]ñü íå ïîðåçàòüñ[ya] î âûñòóïû íà êëþâå.", "äåðæèò [P] çà ãîëîâó äâóì[ya] ðóêàìè è ñîâåðøàåò äâèæåíè[ya] òàçîì.", "ñæèìàåò ïåðü[ya] íà ãîëîâå [P], ïðîäîëæà[ya] åáàòü áåäíóþ ïòè÷êó â ðîò.", "áåçæàñòíî ïîëüçóåòñ[ya] ãëîòêîé [P].", ", ðû÷à ñêâîçü çóáû, íàò[ya]ãèâàåò ãëîòêó [P] íà ñâîåãî ìàëûøà.", ", ÷åðåçìåðíî óâëåêøèñü, òûêàåò ÷ëåíîì ìèìî ðòà [P] è äðîæèò îò âíåçàïíûõ îùóùåíèé.")
				if(P.species.get_bodytype() == SPECIES_PROMETHEAN)
					message = pick("îïèðàåòñ[ya] íà æåëåîáðàçíûå ïëå÷è [P], ïðèäåðæèâà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] è çàñàæèâà[ya] ÷ëåí âñ¸ ñèëüíåå è ñèëüíåå [P.identifying_gender==FEMALE ? "åé" : "åìó"] â ãëîòêó.", "òðàõàåò [P] â ðîò, çàë[ya]ïûâà[ya] ñâîé ÷ëåí â ëèïêîé ñëèçè.", "íàñàæèâàåò ãîëîâó [P] íà ñâîé ÷ëåí.", "äåðæèò [P] çà ãîëîâó äâóì[ya] ðóêàìè è ñîâåðøàåò äâèæåíè[ya] òàçîì.", "ïðîäîëæàåò åáàòü [P.identifying_gender == FEMALE ? "áåäíóþ ñëèçíåäåâêó" : "áåäíîãî ñëèçí[ya]"] â ðîò.", "áåçæàñòíî ïîëüçóåòñ[ya] ðîòèêîì [P].", ", ÷åðåçìåðíî óâëåêøèñü, òûêàåò ÷ëåíîì ìèìî ðòà [P] è äðîæèò îò âíåçàïíûõ îùóùåíèé.", "íåùàäíî íàñèëóåò ãëîòêó [P].")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("áåñöåðåìîííî ïðîòàëêèâàåò ñâîé ÷ëåí [P] â ãëîòêó.")
				H.lastfucked = P
				H.lfhole = hole

			P.arousal += 30
			if (prob(5) && H.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				H.lust += 15
				H.arousal += 30
				H.moan()
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += 15
			H.arousal += 30
			if (H.lust >= H.resistenza)
				H.cum(H, P, "mouth")
			else
				H.moan()

			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/oral[rand(1, 2)].ogg", 70, 1, -1)
			if (P.species.name == "Promethean")
				playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)
			if (P.a_intent == I_HURT)
				H.apply_damage(5, BRUTE, BP_GROIN)
				blood_splatter(src,H,0)
				retaliation_message = pick("ñèëüíî êóñàåò ÷ëåí [H].", "ñæèìàåò çóáàìè ÷ëåí [H], ïîêà íå íà÷èíàåò òå÷ü êðîâü.", "çëîáíî ñìîòðèò èç-ïîä êîëåí [H], ñêàë[ya] îêðîâàâëåííûå çóáû.", "èçî âñåõ ñèë ïûòàåòñ[ya] âûðâàòüñ[ya] èç-ïîä íîã [H].")
				H.visible_message("<font color=red>[P] [retaliation_message]</font>")
				if (prob(5))
					H.apply_damage(20, BRUTE, BP_GROIN)
					blood_splatter(src,H,1)
					retaliation_message = pick("ñæèìàåò çóáàìè ÷ëåí [H], à çàòåì îòðûâàåò åãî, ïà÷êà[ya]ñü â êðîâè!", "ïðèêóñûâàåò ÷ëåí [H] è íå îòïóñêàåò, ïîêà îí íå îòðûâàåòñ[ya]!", "îòêóñûâàåò ÷ëåí ïàðòí¸ðà ïîëíîñòüþ â ïîïûòêàõ âûðâàòüñ[ya]!")
					H.visible_message("<font color=red><b>[P] [retaliation_message]</font></b>")
					H.potenzia = -1

/*
MOUNT REWORKED - äîïèëèòü ïîïàðíî ðåàêöèè íà âçàèìîäåéñòâèÿ ðàñ äðóã ñ äðóãîì, ó÷èòûâàÿ â êàêîé ðîëè ýòà ðàñà - â àêòèâíîé èëè ïàññèâíîé.

Êðàòêî: äóìàë ñäåëàòü ñèñòåìó, êîòîðàÿ âûáèðàëà áû ñîîáùåíèå íå òîëüêî çàâèñèìî îò òèïà òåëà ñåäëàåìîãî ïàðòí¸ðà, íî è â çàâèñèìîñòè îò òèïà òåëà ñåäëàþùåãî.
Êàê ÿ ïîëàãàþ, äëÿ ýòîãî íåîáõîäèìî ïðîïèñàòü ïîïàðíî âçàèìîäåéñòâèÿ ðàñ äëÿ êàæäîé èç êàòåãîðèé: íå_ïóøèñòîå, ïóøèñòîå, ïåðíàòîå, ñëèçåïîäîáíîå/íàíî-ðîé.
Íî ê ñîæàëåíèþ ìîè ïîçíàíèÿ â êîäå ìàëû è óìåñòèòü ýòî â ìåíüøåå êîë-âî ñòðî÷åê êîäà ïîêà íå ìîãó, à òîííó êîäà ïèñàòü - óæå íàïèñàë.

Äà, ïèëèòü õîõóÿ, åñëè âñ¸ æå ïèëèòü.

 UPD: Â ïðèíöèïå ìîæíî áûëî áû ââåñòè ïåðåìåííûå, îáîçíà÷àþùèå "êàòåãîðèþ" ðàñû è ñäåëàòü óíèâåðñàëüíûå ñîîáùåíèÿ...
...â êîòîðûõ áûëà áû ïðîâåðêà íà êàòåãîðèè øåðñòü/ïåðüÿ/ëàòåêñ/èòï è â çàâèñèìîñòè îò ýòîãî âñòàâëÿëîñü áû íóæíîå ñëîâî-îïèñàíèå.
 */

		if ("mount")

			if(P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_TESHARI || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_PROTEAN || P.species.get_bodytype() == SPECIES_SKRELL)
				message = pick("íåóìîëèìî ñêà÷åò íà ÷ëåíå [P]", "ïðûãàåò íà èíñòðóìåíòå [P]", "íàñàæèâàåòñ[ya] íà [P]", "ñíîøàåòñ[ya] ñ [P]", "ïðûãàåò íà èíñòðóìåíòå [P], ñæèìà[ya] ìûøöû âëàãàëèùà")
				if (prob(35))
					message = pick("âãîí[ya]åò èíòðóìåíò [P] â ñâî¸ âëàãàëèùå ïî ñàìûå [ya]éöà", "ñêà÷åò íà ìàëûøå [P], ïîãðóæà[ya] åãî â ñâî¸ ëîíî", "íàñàæèâàåòñ[ya] ïèñå÷êîé íà ñòâîë [P], ââîä[ya] åãî â ñåá[ya] äî óïîðà", "ïðûãàåò íà èíñòðóìåíòå [P], ñæèìà[ya] ìûøöû âëàãàëèùà", "ñêà÷åò íà [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâîþ ùåëü", "ïðûãàåò íà [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî", "ñêà÷åò íà ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí âíóòðè ñåá[ya]", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] íà èíñòðóìåíòå [P], ëàñêà[ya] åãî ñòåíêàìè âëàãàëèùà", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ïóëüñèðóþùåé êèñêîé", "íàáðàñûâàåò ëîíî íà êðþ÷îê [P], äàâ[ya] íà íåãî ñâîèì òàçîì", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] íà çâåðüêå [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî îïóñêàåòñ[ya] íà ïåíèñ [P]", "ââîäèò ÷ëåí [P] â ñâîþ êèñêó, íàïðàâë[ya][ya] åãî ðóêîé", "íàïðàâë[ya]åò ÷ëåí [P] â ñâîþ âëàæíóþ êèñêó", "÷óâñòâåííî ââîäèò îðãàí [P] â ñâîþ ìîêðóþ ïèñå÷êó", "çàïóñêàåò çâåðüêà [P] â ñâîþ ïðîìåæíîñòü")
					H.lastfucked = P
					H.lfhole = hole


			if(P.species.get_bodytype() == SPECIES_TAJ)
				message = pick("íåóìîëèìî ñêà÷åò íà øèïàñòîì ÷ëåíå [P]", "ïðûãàåò íà èíñòðóìåíòå [P]", "íàñàæèâàåòñ[ya] íà [P]", "ñíîøàåòñ[ya] ñ [P]", "ïðûãàåò íà ïîêðûòîì øèïàìè èíñòðóìåíòå [P]")
				if (prob(35))
					message = pick("íàñàæèâàåòñ[ya] ïèñå÷êîé íà øèïàñòûé ñòâîë [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñåá[ya] äî óïîðà", "âãîí[ya]åò øèïàñòûé èíòðóìåíò [P] â ñåá[ya] ïî ñàìûå [ya]éöà", "ñêà÷åò íà ïîêðûòîì øèïèêàìè ìàëûøå [P], ïîãðóæà[ya] åãî â ñåá[ya]", "ñêà÷åò íà øèïàñòîì ÷ëåíå [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâî¸ ëîíî", "ñêà÷åò íà [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî", "ñêà÷åò íà ïîêðûòîì øèïàìè ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "íàñàæèâàåòñ[ya] ïèñå÷êîé íà øèïàñòûé ñòâîë [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñåá[ya] äî óïîðà", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] øèïàñòûé ÷ëåí âíóòðè ñåá[ya]", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] íà øèïàñòîì èíñòðóìåíòå [P], ëàñêà[ya] åãî ñòåíêàìè âëàãàëèùà", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ïóëüñèðóþùåé êèñêîé", "íàáðàñûâàåò ëîíî íà êðþ÷îê [P], äàâ[ya] íà íåãî ñâîèì òàçîì", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] íà øèïàñòîì çâåðüêå [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî îïóñêàåòñ[ya] íà øèïàñòûé ïåíèñ [P]", "ââîäèò ïîêðûòûé øèïàìè îðãàí [P] â ñâîþ êèñêó, íàïðàâë[ya][ya] åãî ðóêîé", "ðóêîé íàïðàâë[ya]åò ÷ëåí [P] â ñâî¸ âëàãàëèùå", "÷óâñòâåííî ââîäèò øèïàñòûé ñòâîë [P] â ñâîþ ìîêðóþ êèñêó", "çàïóñêàåò øèïàñòîãî çâåðüêà [P] â ñâîþ ïðîìåæíîñòü")
					H.lastfucked = P
					H.lfhole = hole


			if(P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT)
				message = pick("íåóìîëèìî ñêà÷åò íà óçëîâàòîì ÷ëåíå [P]", "ïðûãàåò íà èíñòðóìåíòå [P]", "ñíîøàåòñ[ya] ñ [P]", "ñåäëàåò òåëî [P] ñëîâíî íàåçäíèöà", "ñêà÷åò íà [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñåá[ya] äî óçëà")
				if (prob(35))
					message = pick("íàñàæèâàåòñ[ya] ïèñå÷êîé íà óçëîâàòûé ñòâîë [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñåá[ya] äî óïîðà", "íàñàæèâàåòñ[ya] íà óçåë [P]", "âãîí[ya]åò øèïàñòûé èíòðóìåíò [P] â ñåá[ya] ïî ñàìûå [ya]éöà", "ïðûãàåò íà óçëîâàòîì èíñòðóìåíòå [P], ñæàâ ìûøöû âëàãàëèùà", "ñêà÷åò íà óçëîâàòîì ÷ëåíå [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâî¸ ëîíî", "íàñàæèâàåòñ[ya] íà ñòâîë [P] ïèñå÷êîé, ââîä[ya] åãî â ñåá[ya] äî óçëà", "íàñàæèâàåòñ[ya] íà óçëîâàòûé èíòðóìåíò [P] ïî ñàìûå [ya]éöà", "ñêà÷åò íà ìàëûøå [P], äàâ[ya] ïîëîâûìè ãóáàìè íà óçåë", "ïðûãàåò íà [P], êàñà[ya]ñü [P.identifying_gender==FEMALE ? "å¸" : "åãî"] óçëà êëèòîðîì", "ñêà÷åò, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] óçåë âíóòðè ñåá[ya]", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] íà óçëîâàòîì èíñòðóìåíòå [P], ëàñêà[ya] åãî ñòåíêàìè âëàãàëèùà", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ïóëüñèðóþùåé êèñêîé", "íàñàæèâàåòñ[ya] íà óçåë[P], äàâ[ya] íà íåãî ñâåðõó", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] íà ÷ëåíå [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî îïóñêàåòñ[ya] íà óçëîâàòûé ïåíèñ [P], ââîä[ya] åãî âíóòðü", "ââîäèò óçëîâàòûé îðãàí [P] â ñâîþ êèñêó, íàïðàâë[ya][ya] åãî ðóêîé", "ðóêîé íàïðàâë[ya]åò ÷ëåí [P] â ñâî¸ âëàãàëèùå", "îñòîðîæíî ââîäèò ñòâîë [P] â ñâî¸ íóòðî", "çàïóñêàåò óçëîâàòîãî çâåðüêà [P] â ñâîþ ïðîìåæíîñòü")
					H.lastfucked = P
					H.lfhole = hole


			if(P.species.get_bodytype() == SPECIES_UNATHI)
				message = pick("íåóìîëèìî ñêà÷åò íà ÷ëåíå [P]", "ñåäëàåò òåëî [P], ñëîâíî íàåçäíèöà", "íàñàæèâàåòñ[ya] íà [P]", "ñíîøàåòñ[ya] ñ [P]", "äâèãàòåòñ[ya] ââåðõ-âíèç íà îäíîì èç ÷ëåíîâ [P]", "ñêà÷åò íà ìàëûøàõ [P]")
				if (prob(35))
					message = pick("íàñàæèâàåòñ[ya] ïèñå÷êîé íà ñòâîë [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñåá[ya] äî óïîðà", "ïîî÷åð¸äíî íàñàæèâàåòñ[ya] íà ÷ëåíû [P]", "ñêà÷åò íà îáîèõ îòðîñòêàõ [P] ñðàçó, ïîãðóæà[ya] èõ â ñâîþ êèñêó äî óïîðà", "íàñàæèâàåòñ[ya] ïèñå÷êîé íà èíòðóìåíòû [P] ïî ñàìûå [ya]éöà", "ñêà÷åò íà ÷ëåíå [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâî¸ ëîíî", "ñàäèòñ[ya] íà [P], ïîãðóæà[ya] îáà ÷ëåíà â ñåá[ya] äî óïîðà è óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî", "ñêà÷åò íà ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí âíóòðè ñåá[ya]", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] íà èíñòðóìåíòå [P], ëàñêà[ya] åãî ñòåíêàìè âëàãàëèùà", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ïóëüñèðóþùåé êèñêîé", "íàáðàñûâàåò ëîíî íà êðþ÷îê [P], äàâ[ya] íà íåãî ñâîèì òàçîì", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] íà äâîéíîì ÷ëåíå [P]", "íàñàæèâàåòñ[ya] íà ÷ëåí [P], äàâ[ya] íà íåãî ñâåðõó")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî îïóñêàåòñ[ya] íà îäèí èç îãðàíîâ [P]", "ââîäèò îäèí èç îðãàíîâ [P] â ñâîþ êèñêó, íàïðàâë[ya][ya] åãî ðóêîé", "íàïðàâë[ya]åò îäèí èç ÷ëåíîâ [P] â ñâîþ øàõòó, ïîìîãà[ya] ñåáå ðóêîé", "îñòîðîæíî ââîäèò ñòâîë [P] â ñâî¸ íóòðî", "çàïóñêàåò îäíîãî èç çâåðüêîâ [P] â ñâîþ ïðîìåæíîñòü")
					H.lastfucked = P
					H.lfhole = hole


			if(P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_SERGAL || P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN)
				message = pick("íåóìîëèìî ñêà÷åò íà ÷ëåíå [P]", "ñåäëàåò òåëî [P], ñëîâíî íàåçäíèöà", "ñêà÷åò íà ÷ëåíå [P]", "ïðûãàåò íà èíñòðóìåíòå [P]", "íàñàæèâàåòñ[ya] íà [P]", "ñíîøàåòñ[ya] ñ [P]")
				if (prob(35))
					message = pick("âãîí[ya]åò èíòðóìåíò [P] â ñâî¸ âëàãàëèùå ïî ñàìûå [ya]éöà", "ñêà÷åò íà ìàëûøå [P], ïîãðóæà[ya] åãî â ñâî¸ ëîíî", "íàñàæèâàåòñ[ya] ïèñå÷êîé íà ñòâîë [P], ââîä[ya] åãî â ñåá[ya] äî óïîðà", "ïðûãàåò íà èíñòðóìåíòå [P], ñæèìà[ya] ìûøöû âëàãàëèùà", "ñêà÷åò íà [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâîþ ùåëü", "ïðûãàåò íà [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî", "ñêà÷åò íà ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí âíóòðè ñåá[ya]", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] íà èíñòðóìåíòå [P], ëàñêà[ya] åãî ñòåíêàìè âëàãàëèùà", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ïóëüñèðóþùåé êèñêîé", "íàáðàñûâàåò ëîíî íà êðþ÷îê [P], äàâ[ya] íà íåãî ñâîèì òàçîì", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] íà çâåðüêå [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî îïóñêàåòñ[ya] íà ïîëîâîé îðãàí [P]", "ââîäèò îðãàí [P] â ñâîþ êèñêó, íàïðàâë[ya][ya] åãî ðóêîé", "íàïðàâë[ya]åò ÷ëåí [P] â ñâîþ âëàæíóþ êèñêó", "÷óâñòâåííî ââîäèò îðãàí [P] â ñâîþ ìîêðóþ ïèñå÷êó", "çàïóñêàåò çâåðüêà [P] â ñâîþ ïðîìåæíîñòü")
					H.lastfucked = P
					H.lfhole = hole


			if(P.species.get_bodytype() == SPECIES_PROMETHEAN)
				message = pick("ñåäëàåò ñêëèçëîå òåëî [P], ñëîâíî íàåçäíèöà", "íàñàæèâàåòñ[ya] ñâîèì ñêëèçëûì òåëîì íà ïîäàòëèâûé èíñòðóìåíò [P], ñæèìà[ya] åãî", "íàñàæèâàåòñ[ya] íà ñêëèçëûé ÷ëåí [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñåá[ya]")
				if (prob(35))
					message = pick("íàñàæèâàåòñ[ya] íà ñêëèçëûé èíòðóìåíò [P] ïî ñàìûå [ya]éöà", "íåóìîëèìî ñêà÷åò íà [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ñêëèçëûé îðãàí â ñâåá[ya]", "ñêà÷åò íà ìàëûøå [P], ïîãðóæà[ya] åãî â ñåá[ya]", "ïðûãàåò íà [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî", "ñêà÷åò íà ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí âíóòðè ñåá[ya]", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] íà èíñòðóìåíòå [P], ëàñêà[ya] åãî ñâîèì íóòðîì", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ñâîèì íóòðîì", "íàñàæèâàåòñ[ya] íà ñòâîë [P], äàâ[ya] íà íåãî ñâîèì íóòðîì", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] íà ñêëèçëîì çâåðüêå [P]", "íàñàæèâàåòñ[ya] íà ñêëèçëûé ÷ëåí [P], äàâ[ya] íà íåãî ñâåðõó")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî îïóñêàåòñ[ya] íà ñêëèçëûé ïîëîâîé îðãàí [P]", "ïëàâíî ââîäèò ñêëèçëûé îðãàí [P] âíóòðü ñåá[ya]", "ââîäèò ñòâîë [P] â ñâî¸ íóòðî", "çàïóñêàåò ñêëèçëîãî çâåðüêà [P] â ñåá[ya]")
					H.lastfucked = P
					H.lfhole = hole


			if(P.species.get_bodytype() == SPECIES_DIONA)
				return

			P.arousal += 30
			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message].</B></font>")
				P.lust += H.potenzia * 2
				P.arousal += 30
				P.moan()
			else
				H.visible_message("<font color=purple>[H] [message].</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message].</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += P.potenzia
			H.arousal += 30
			if (H.lust >= H.resistenza)
				H.cum(H, P)
				message = pick("Âû ÷óâñòâóåòå, êàê âàãèíàëüíûå ìûøöû [H] íà÷èíàþò ðåçêî ñîêðàùàòüñ[ya] âîêðóã âàøåãî èíñòðóìåíòà.", "Âû ÷óâñòâóåòå, êàê ðåáðèñòûå ñòåíêè [H] êðåïêî ñæèìàþò âàø íàïð[ya]æ¸ííûé ÷ëåí.", "Âû ÷óâñòâóåòå, êàê âëàæíà[ya] êèñêà [H] ðåçêî ñæèìàåò âàø ÷ëåí âíóòðè ñåá[ya].", "Âû ÷óâñòâóåòå, ÷òî âàøåìó ïðèáîðó ñòàíîâèòñ[ya] òåñíî âíóòðè ãîð[ya]÷åé ïèñå÷êè [H].", "Âû ÷óâñòâóåòå, êàê ìûøöû âíóòðè ðàçãîð[ya]÷¸ííîé âàãèíû [H] ñèëüíî ñæèìàþòñ[ya] íåñêîëüêî ðàç, ïðèáëèæà[ya] âàñ ê îðãàçìó.")
				to_chat(P, message)
				P.lust += 15
			else
				H.moan()
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += H.potenzia
				if (P.lust >= P.resistenza)
					P.cum(P, H, "vagina")
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)
			if (H.species.name == "Promethean")
				playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)

/* MOUNT OLD VER.

		if("mount")

			message = pick("ñêà÷åò íà ÷ëåíå [P]", "ïðûãàåò íà èíñòðóìåíòå [P]", "íàñàæèâàåòñ[ya] íà [P]")
			if (prob(35))
				message = pick("ñåäëàåò òåëî [P], ñëîâíî íàåçäíèöà", "ñêà÷åò íà ìàëûøå [P]", "ïðûãàåò íà [P], óäàð[ya][ya]ñü î åãî òåëî", "ðàäîñòíî ïîäïðûãèâàåò, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "óïåðëàñü òàçîì â [P] è åëîçèò, äåðæà åãî ÷ëåí âíóòðè", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] íà èíñòðóìåíòå [P]", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], âç[ya]â âíóòðü åãî ÷ëåí", "íàáðàñûâàåò ñâî¸ ëîíî íà êðþ÷îê [P], äàâ[ya] íà íåãî ñâîèì òàçîì", "âïóñêàåò âíóòðü ñåá[ya] çâåðüêà [P]")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("îñòîðîæíî íàñàæèâàåòñ[ya] íà ïîëîâîé îðãàí [P]", "íàïðàâë[ya]åò ÷ëåí [P] â ñâîþ âëàæíóþ êèñêó, ïîìîãà[ya] ñåáå ðóêîé", "ìåäëåííî ââîäèò â ñåá[ya] ñòâîë [P]")
				H.lastfucked = P
				H.lfhole = hole

			P.arousal += 30
			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message].</B></font>")
				P.lust += H.potenzia * 2
				P.arousal += 30
				P.moan()
			else
				H.visible_message("<font color=purple>[H] [message].</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message].</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += P.potenzia
			H.arousal += 30
			if (H.lust >= H.resistenza)
				H.cum(H, P)
				message = pick("Âû ÷óâñòâóåòå, êàê âàãèíàëüíûå ìûøöû [H] íà÷èíàþò ðåçêî ñîêðàùàòüñ[ya] âîêðóã âàøåãî èíñòðóìåíòà.", "Âû ÷óâñòâóåòå, êàê ðåáðèñòûå ñòåíêè [H] êðåïêî ñæèìàþò âàø íàïð[ya]æ¸ííûé ÷ëåí.", "Âû ÷óâñòâóåòå, êàê âëàæíà[ya] êèñêà [H] ðåçêî ñæèìàåò âàø ÷ëåí âíóòðè ñåá[ya].", "Âû ÷óâñòâóåòå, ÷òî âàøåìó ïðèáîðó ñòàíîâèòñ[ya] òåñíî âíóòðè ãîð[ya]÷åé ïèñå÷êè [H].", "Âû ÷óâñòâóåòå, êàê ìûøöû âíóòðè ðàçãîð[ya]÷¸ííîé âàãèíû [H] ñèëüíî ñæèìàþòñ[ya] íåñêîëüêî ðàç, ïðèáëèæà[ya] âàñ ê îðãàçìó.")
				to_chat(P, message)
				P.lust += 15
			else
				H.moan()
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += H.potenzia
				if (P.lust >= P.resistenza)
					P.cum(P, H, "vagina")
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)
			if (H.species.name == "Promethean")
				playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)

*/


/* RUB  */

		if("rub")

			message = pick("òð¸òñ[ya] î ÷ëåí [P]", "òð¸òñ[ya] îá èíñòðóìåíò [P]", "ñòèìóëèðóåò ÷ëåí [P] ñâîåé êèñêîé")
			if (prob(35))
				message = pick("åëîçèò ïîëîâûìè ãóáàìè ïî ÷ëåíó [P] â ïîçå íàåçäíèöû", "íàòèðàåò ìàëûøà [P], êðåïêî óïåðåâøèñü òàçîì", "â óñêîðåííîì òåìïå ñîâåðøàåò ôðèêöèè, íàòèðà[ya] êëèòîð î ÷ëåí [P]", "òðàõàåò ïîëîâîé îðãàí, ïðèæàòûé ê æèâîòó [P.identifying_gender==FEMALE ? "ïàðòí¸ðøè" : "ïàðòí¸ðà"], äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "óïåðëàñü òàçîì â [P] è åëîçèò", "äâèãàåò òàçîì ïî-êðóãó, òðåíèåì ñòèìóëèðó[ya] èíñòðóìåíò [P]", "âîäèò ãîëîâêîé ÷ëåíà [P] ìåæäó ïîëîâûõ ãóá, ïîìîãà[ya] ñåáå ðóêîé", "òð¸òñ[ya] î êðþ÷îê [P] íà ìåñòå, äàâ[ya] íà íå¸ ñâîèì òàçîì", "ñòèìóëèðóåò êëèòîð î çâåðüêà [P]")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("îñòîðîæíî ñàäèòñ[ya] ïðîìåæíîñòüþ íà ïîëîâîé îðãàí, ïðèæèìà[ya] åãî ê æèâîòó [P]", "ïðèäåðæèâàåò ÷ëåí [P] ðóêîé â ïîëîæåíèè ó æèâîòà [P.identifying_gender==FEMALE ? "ïàðòí¸ðøè" : "ïàðòí¸ðà"], ïîñëå ÷åãî ñàäèòñ[ya] âëàæíîé ïèñå÷êîé íà ñòâîë", "ìåäëåííî ñàäèòñ[ya] íà [P] è çàæèìàåò [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ìåæäó ñâîèõ ïîëîâûõ ãóá")
				H.lastfucked = P
				H.lfhole = hole

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message].</B></font>")
				P.lust += H.potenzia * 2
				P.arousal += 20
				H.moan()
			else
				H.visible_message("<font color=purple>[H] [message].</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message].</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += 9
			H.arousal += 18
			if (H.lust >= H.resistenza)
				H.cum(H, P)
			else
				H.moan()
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += 10
				P.arousal += 20
				if (P.lust >= P.resistenza)
					P.cum(P, H, "rub")
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)

/* TRIBADISM */

		if("tribadism")

			message = pick("òð¸òñ[ya] ñâîåé êèñêîé î ïîëîâûå ãóáû [P]", "íàäàâëèâàåò êèñêîé íà âàãèíó [P]", "òð¸òñ[ya] î êèñêó [P]", "òðàõàåò [P], çàñòàâë[ya][ya] èõ êèñêè òåðåòüñ[ya] äðóã î äðóãà")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("ïðèæèìàåò ñâîþ êèñêó ê êèñêå [P]")
				H.lastfucked = P
				H.lfhole = hole
				H.visible_message("<font color=purple>[H] [message].</font>")
			else
				H.visible_message("<font color=purple>[H] [message].</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message].</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += 9
			H.arousal += 18
			if (H.lust >= H.resistenza)
				H.cum(H, P)
			else
				H.moan()
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += 9
				P.arousal += 18
				if (P.lust >= P.resistenza)
					P.cum(P, H)
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)

/* ASSFUCK */

		if("assfuck")

//Basics EXEPT PROMETHEANS AND TESHARI

	// Basics + humans
			if((P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN) && (H.species.get_bodytype() != SPECIES_TESHARI & H.species.get_bodytype() != SPECIES_PROMETHEAN))
				message = pick("ñíîøàåò ñåá[ya] â çàä îãðàíîì [P], íàñàæèâà[ya]ñü íà íåãî", "÷óâñòâåííî ñíîøàåò ñåá[ya] ÷ëåíîì [P]", "ïðûãàåò çàäîì íà èíñòðóìåíòå [P], ñæàâ àíàëüíîå êîëå÷êî", "íàñàæèâàåòñ[ya] àíóñîì íà ñòâîë [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ïð[ya]ìóþ êèøêó")
				if (prob(35))
					message = pick("âãîí[ya]åò èíòðóìåíò [P] â ñâîé çàä ïî ñàìûå [ya]éöà", "íåóìîëèìî ñêà÷åò íà ÷ëåíå [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâîé çàä", "ñêà÷åò íà ìàëûøå [P], ïîãðóæà[ya] åãî â ñâîþ êèøêó", "ïðûãàåò íà ÷ëåíå [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî", "ñêà÷åò íà ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí âíóòðè ñåá[ya]", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] çàäîì íà èíñòðóìåíòå [P], ëàñêà[ya] åãî íóòðîì", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí â ïð[ya]ìóþ êèøêó äî óïîðà", "íàñàæèâàåòñ[ya] íà ïåíèñ [P], äàâ[ya] íà íåãî ñâîèì òàçîì", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] çàäîì íà çâåðüêå [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] çàäíèöåé ãîëîâêó íà ãóçíîò¸ðà [P], ââîä[ya] å¸ âíóòðü", "îñòîðîæíî ââîäèò ãîëîâêó îðãàíà [P] â ñâîé çàäíèé ïðîõîä", "íàïðàâë[ya]åò ãîëîâêó ÷ëåíà [P] â ñâîþ ïîïêó, ïîìîãà[ya] ñåáå ðóêîé", "îñòîðîæíî ââîäèò ãîëîâêó ñòâîëà [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò ãîëîâêó çâåðüêà [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò øàõò¸ðà [P] â ñâîè óãîëüíûå øàõòû")
					H.lastfucked = P
					H.lfhole = hole


	// Basics + taj

			if(P.species.get_bodytype() == SPECIES_TAJ && H.species.get_bodytype() != SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_PROMETHEAN)
				message = pick("íåóìîëèìî ñêà÷åò íà øèïàñòîì ÷ëåíå [P], ïîãðóæà[ya] åãî îðãàí â ñâîé çàä", "÷óâñòâåííî ñíîøàåò ñåá[ya] øèïàñòûì ÷ëåíîì [P]", "ïðûãàåò çàäîì íà ïóïûð÷àòîì èíñòðóìåíòå [P], ñæàâ àíàëüíîå êîëå÷êî")
				if (prob(35))
					message = pick("íàñàæèâàåòñ[ya] àíóñîì íà øèïàñòûé ñòâîë [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ïð[ya]ìóþ êèøêó äî óïîðà", "âãîí[ya]åò øèïàñòûé èíòðóìåíò [P] â ñâîé çàä ïî ñàìûå [ya]éöà", "ñêà÷åò íà ïîêðûòîì øèïèêàìè ìàëûøå [P], ïîãðóæà[ya] åãî â ñåá[ya]", "ñêà÷åò íà ÷ëåíå [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî", "ñêà÷åò çàäíèöåé íà ïîêðûòîì øèïàìè ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ïîêðûòûé øèïàìè ïåíèñ âíóòðè ñåá[ya]", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] çàäîì íà øèïàñòîì èíñòðóìåíòå [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ñòåíêàìè ïð[ya]ìîé êèøêè", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ïîêðûòûé øèïàìè ÷ëåí â ïð[ya]ìóþ êèøêó äî óïîðà", "íàñàæèâàåòñ[ya] íà øèïàñòûé ïåíèñ [P], äàâ[ya] íà íåãî ñâîèì òàçîì", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] çàäîì íà ïóøèñòîì çâåðüêå [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] àíóñîì íà ãîëîâêó øèïàñòîãî ãóçíîò¸ðà [P], ââîä[ya] å¸ âíóòðü", "îñòîðîæíî ââîäèò ïîêðûòóþ øèïèêàìè ãîëîâêó [P] â ñâîé çàäíèé ïðîõîä", "íàïðàâë[ya]åò øèïàñòóþ ãîëîâêó ÷ëåíà [P] â ñâîþ ïîïêó, ïîìîãà[ya] ñåáå ðóêîé", "îñòîðîæíî ââîäèò øèïàñòûé ñòâîë [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò øèïàñòîãî çâåðüêà [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò êîëþ÷åãî øàõò¸ðà [P] â ñâîè óãîëüíûå øàõòû")
					H.lastfucked = P
					H.lfhole = hole

	// Basics + vulps

			if(P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT && H.species.get_bodytype() != SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_PROMETHEAN)
				message = pick("ñíîøàåò ñåá[ya] â çàä îãðàíîì [P], íàñàæèâà[ya]ñü íà íåãî", "÷óâñòâåííî ñíîøàåò ñåá[ya] óçëîâàòûì ÷ëåíîì [P]", "íåóìîëèìî ñêà÷åò íà ÷ëåíå [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâîé çàä äî óçëà", "ïðûãàåò íà óçëîâàòîì èíñòðóìåíòå [P], ñæàâ àíàëüíîå êîëå÷êî", "íàñàæèâàåòñ[ya] àíóñîì íà ñòâîë [P], ââîä[ya] åãî â ïð[ya]ìóþ êèøêó")
				if (prob(35))
					message = pick("íàñàæèâàåòñ[ya] çàäíèöåé íà îêàí÷èâàþùèéñ[ya] óçëîì èíòðóìåíò [P] ïî ñàìûå [ya]éöà", "ñêà÷åò íà ìàëûøå [P], ïîãðóæà[ya] åãî â ñâîé çàä è äàâ[ya] àíàüíûì êîëå÷êîì íà óçåë", "ñêà÷åò íà óçëîâàòîì ÷ëåíå [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî", "ïðûãàåò íà ÷ëåíå [P], êàñà[ya]ñü [P.identifying_gender==FEMALE ? "å¸" : "åãî"] óçëà ñôèíêòåðîì", "ñêà÷åò, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] óçåë âíóòðè ñåá[ya]", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] çàäîì íà èíñòðóìåíòå [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ñòåíêàìè ïð[ya]ìîé êèøêè", "íàâàëèâàåòñ[ya] íà [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] óçëîâàòûé ÷ëåí â ïð[ya]ìóþ êèøêó äî óïîðà", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ïð[ya]ìîé êèøêîé", "ñàäèòñ[ya] íà óçåë [P], äàâ[ya] íà íåãî ñâîèì òàçîì", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] çàäîì ïóøèñòîì çâåðüêå [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] àíóñîì íà êîí÷èê óçëîâàòîãî ãóçíîò¸ðà [P], ââîä[ya] åãî âíóòðü", "îñòîðîæíî ââîäèò êîí÷èê óçëîâàòîãî îðãàíà [P] â ñâîé çàäíèé ïðîõîä", "íàïðàâë[ya]åò óçëîâàòûé ÷ëåí [P] â ñâîþ ïîïêó, ïîìîãà[ya] ñåáå ðóêîé", "îñòîðîæíî ââîäèò ñòâîë [P] â ñâîþ ïð[ya]ìóþ êèøêó äî óçëà", "çàïóñêàåò óçëîâàòîãî çâåðüêà [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò øàõò¸ðà [P] â ñâîè óãîëüíûå øàõòû")
					H.lastfucked = P
					H.lfhole = hole

	// Basics + unathi ------- ñäåëàòü âàðèàöèè è êíîïêè íà 1 è 2 ÷ëåíà

			if(P.species.get_bodytype() == SPECIES_UNATHI && H.species.get_bodytype() != SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_PROMETHEAN)
				message = pick("ñíîøàåò ñåá[ya] â çàä îãðàíîì [P], íàñàæèâà[ya]ñü íà íåãî", "÷óâñòâåííî ñíîøàåò ñåá[ya] îäíèì èç ÷ëåíîâ [P]", "íåóìîëèìî ñêà÷åò íà îäíîì èç ÷ëåíîâ [P], ïîãðóæà[ya] åãî â ñâîé çàä, çàñòàâë[ya][ya] âòîðîé òåðåòüñ[ya] î ñïèíó", "ñêà÷åò íà îäíîì èç ÷ëåíîâ [P], ïîãðóæà[ya] åãî â ñâîé çàä, çàñòàâë[ya][ya] âòîðîé òåðåòüñ[ya] î ñâîþ ïðîìåæíîñòü", "äâèãàòåò çàäîì ââåðõ-âíèç íà îäíîì èç ÷ëåíîâ [P], ñæàâ àíàëüíîå êîëå÷êî", "ñêà÷åò íà ìàëûøå [P], ïîãðóæà[ya] åãî â ñâîé çàä")
				if (prob(35))
					message = pick("ïîî÷åð¸äíî íàñàæèâàåòñ[ya] àíàëüíûì îòâåðñòèåì íà ÷ëåíû [P], ââîä[ya] èõ â ïð[ya]ìóþ êèøêó", "ñêà÷åò íà îáîèõ îòðîñòêàõ [P], ïîãðóæà[ya] èõ â ñâîé çàä äî óïîðà", "íàñàæèâàåòñ[ya] íà èíòðóìåíòû [P] çàäíèöåé ïî ñàìûå [ya]éöà", "ïðûãàåò íà [P], ïîãðóæà[ya] îáà ÷ëåíà â ïð[ya]ìóþ êèøêó è óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî", "ñêà÷åò íà ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí âíóòðè ñåá[ya]", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] çàäîì íà èíñòðóìåíòå [P], ëàñêà[ya] åãî íóòðîì", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ñòåíêàìè ïð[ya]ìîé êèøêè", "íàñàæèâàåòñ[ya] íà ïåíèñ [P], äàâ[ya] íà íåãî ñâîèì òàçîì", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] ïîãðóæà[ya] äâîéíîé ÷ëåí â ñâîþ êèøêó [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] àíóñîì íà îäíîãî èç ãóçíîò¸ðîâ [P], ââîä[ya] åãî âíóòðü", "îñòîðîæíî ââîäèò îðãàí [P] â ñâîé çàäíèé ïðîõîä", "íàïðàâë[ya]åò îäèí èç ÷ëåíîâ [P] â ñâîþ ïîïêó, ïîìîãà[ya] ñåáå ðóêîé", "îñòîðîæíî ââîäèò ñòâîë [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò îäíîãî èç çâåðüêîâ [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò çìå[ya] [P] â ñâîè óãîëüíûå øàõòû")
					H.lastfucked = P
					H.lfhole = hole

	// Basics + akula sergal vox

			if(P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_SERGAL || P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN && H.species.get_bodytype() != SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_PROMETHEAN)
				message = pick("ñíîøàåò ñåá[ya] â çàä îãðàíîì [P], íàñàæèâà[ya]ñü íà íåãî", "ïðûãàåò çàäîì íà èíñòðóìåíòå [P], ñæàâ àíàëüíîå êîëå÷êî", "÷óâñòâåííî ñíîøàåò ñåá[ya] ÷ëåíîì [P]", "íàñàæèâàåòñ[ya] àíóñîì íà ñòâîë [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ïð[ya]ìóþ êèøêó")
				if (prob(35))
					message = pick("âãîí[ya]åò èíòðóìåíò [P] â ñâîé çàä ïî ñàìûå [ya]éöà", "íåóìîëèìî ñêà÷åò íà ÷ëåíå [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâîé çàä", "ñêà÷åò íà ìàëûøå [P], ïîãðóæà[ya] åãî â ñâîþ êèøêó", "ïðûãàåò íà ÷ëåíå [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî", "ñêà÷åò íà ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí âíóòðè ñåá[ya]", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] çàäîì íà èíñòðóìåíòå [P], ëàñêà[ya] åãî íóòðîì", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ñòåíêàìè ïð[ya]ìîé êèøêè", "íàñàæèâàåòñ[ya] íà ïåíèñ [P], äàâ[ya] íà íåãî ñâîèì òàçîì", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] çàäîì íà çâåðüêå [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] çàäíèöåé ãîëîâêó íà ãóçíîò¸ðà [P], ââîä[ya] å¸ âíóòðü", "îñòîðîæíî ââîäèò ãîëîâêó îðãàíà [P] â ñâîé çàäíèé ïðîõîä", "íàïðàâë[ya]åò ãîëîâêó ÷ëåíà [P] â ñâîþ ïîïêó, ïîìîãà[ya] ñåáå ðóêîé", "îñòîðîæíî ââîäèò ãîëîâêó ñòâîëà [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò ãîëîâêó çâåðüêà [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò øàõò¸ðà [P] â ñâîè óãîëüíûå øàõòû")
					H.lastfucked = P
					H.lfhole = hole

	// Basics + teshari





//Teshari

	//P.Teshari + basics
			if(P.species.get_bodytype() == SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_PROMETHEAN)
				message = pick("ñíîøàåò ñåá[ya] â çàä, íàñàæèâà[ya]ñü íà îãðàí [P]", "ïðûãàåò çàäîì íà èíñòðóìåíòå [P], ñæàâ àíàëüíîå êîëå÷êî", "÷óâñòâåííî ñíîøàåò ñåá[ya] ÷ëåíîì [P]")
				if (prob(35))
					message = pick("íàñàæèâàåòñ[ya] àíàëüíûì îòâåðñòèåì íà ÷ëåí [P]", "íåóìîëèìî ñêà÷åò íà ÷ëåíå [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâîé çàä", "ñêà÷åò íà ìàëûøå [P], ïîãðóæà[ya] åãî â ñâîé àíóñ", "ïðûãàåò íà ÷ëåíå [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî çàäîì", "ñêà÷åò íà ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí âíóòðè ïð[ya]ìîé êèøêè", "÷óâñòâåííî äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] çàäîì íà èíñòðóìåíòå [P], ëàñêà[ya] åãî íóòðîì", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ñòåíêàìè ïð[ya]ìîé êèøêè", "íàñàæèâàåòñ[ya] àíàëüíûì êîëå÷êîì íà ñòâîë [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ïð[ya]ìóþ êèøêó äî óïîðà", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] íà çâåðüêå [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] àíóñîì íà ãóçíîò¸ðà [P], ââîä[ya] åãî âíóòðü", "îñòîðîæíî ââîäèò îðãàí [P] â ñâîé çàäíèé ïðîõîä", "íàïðàâë[ya]åò ÷ëåí [P] â ñâîþ ïîïêó, ïîìîãà[ya] ñåáå ðóêîé", "îñòîðîæíî ââîäèò ñòâîë [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò çâåðüêà [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò øàõò¸ðà [P] â ñâîè óãîëüíûå øàõòû")
					H.lastfucked = P
					H.lfhole = hole

	//H.Teshari + humans or tesharis
			if((H.species.get_bodytype() == SPECIES_TESHARI) && (P.species.get_bodytype() == SPECIES_TESHARI || P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_PROTEAN || P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_SERGAL || P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN))
				message = pick("ñíîøàåò ñåá[ya], íàñàæèâà[ya]ñü êëîàêîé íà îãðàí [P]", "ïðûãàåò çàäîì íà èíñòðóìåíòå [P], ñæàâ êëîàêó")
				if (prob(35))
					message = pick("íàñàæèâàåòñ[ya] îòâåðñòèåì êëîàêè íà ÷ëåí [P]", "íåóìîëèìî ñêà÷åò íà ÷ëåíå [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâîþ êëîàêó", "ïðûãàåò íà ÷ëåíå [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî çàäîì", "ñêà÷åò íà ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "÷óâñòâåííî äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] çàäîì íà èíñòðóìåíòå [P], ëàñêà[ya] åãî ñâîèì íóòðîì", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí âíóòðè êëîàêè", "÷óâñòâåííî ñíîøàåò ñåá[ya] ÷ëåíîì [P]", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] íà çâåðüêå [P]", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ñòåíêàìè êëîàêè", "íàñàæèâàåòñ[ya] êîëå÷êîì êëîàêè íà ñòâîë [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â êèøêó äî óïîðà")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] êëîàêîé íà ãîëîâêó ãóçíîò¸ðà [P], ââîä[ya] å¸ âíóòðü", "îñòîðîæíî ââîäèò îêîí÷àíèå îðãàíà [P] â ñâîþ êëîàêó", "íàïðàâë[ya]åò ÷ëåí [P] â ñâîþ êëîàêó, ïîìîãà[ya] ñåáå ðóêîé", "îñòîðîæíî ââîäèò êîí÷èê ñòâîëà [P] â ñâîþ êëîàêó", "çàïóñêàåò êîí÷èê çâåðüêà [P] â ñâîþ êëîàêó", "çàïóñêàåò øàõò¸ðà [P] â ñâîè øàõòû")
					H.lastfucked = P
					H.lfhole = hole

	//H.Teshari + tajara
			if(H.species.get_bodytype() == SPECIES_TESHARI && P.species.get_bodytype() == SPECIES_TAJ)
				message = pick("ñíîøàåò ñåá[ya] â êëîàêó, íàñàæèâà[ya]ñü íà ïîêðûòûé øèïèêàìè îãðàí [P]", "ïðûãàåò çàäîì íà øèïàñòîì èíñòðóìåíòå [P], ñæàâ êëîàêó", "÷óâñòâåííî ñíîøàåò ñåá[ya] ÷ëåíîì [P]")
				if (prob(35))
					message = pick("íàñàæèâàåòñ[ya] îòâåðñòèåì êëîàêè íà øèïàñòûé ÷ëåí [P]", "íåóìîëèìî ñêà÷åò íà ÷ëåíå [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâîþ êëîàêó", "ïðûãàåò íà ÷ëåíå [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî çàäîì", "ñêà÷åò íà ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí âíóòðè êëîàêè", "÷óâñòâåííî äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] íà øèïàñòîì èíñòðóìåíòå [P], ëàñêà[ya] åãî ñâîèì íóòðîì", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] øèïàñòûé ÷ëåí ñòåíêàìè êëîàêè", "íàñàæèâàåòñ[ya] êîëå÷êîì êëîàêè íà ñòâîë [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â êèøêó äî óïîðà", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] íà ïîêðûòîì øèïàìè çâåðüêå [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] êëîàêîé íà ãîëîâêó ïîêðûòîãî øèïàìè ãóçíîò¸ðà [P], ââîä[ya] å¸ âíóòðü", "îñòîðîæíî ââîäèò îêîí÷àíèå øèïàñòîãî îðãàíà [P] â ñâîþ êëîàêó", "íàïðàâë[ya]åò øèïàñòûé ÷ëåí [P] â ñâîþ êëîàêó, ïîìîãà[ya] ñåáå ðóêîé", "îñòîðîæíî ââîäèò êîí÷èê ñòâîëà [P] â ñâîþ êëîàêó", "çàïóñêàåò êîí÷èê øèïàñòîãî çâåðüêà [P] â ñâîþ êëîàêó", "çàïóñêàåò øàõò¸ðà [P] â ñâîè øàõòû")
					H.lastfucked = P
					H.lfhole = hole

	//H.Teshari + unathi ------- ñäåëàòü âàðèàöèè è êíîïêè íà 1 è 2 ÷ëåíà
			if(H.species.get_bodytype() == SPECIES_TESHARI && P.species.get_bodytype() == SPECIES_UNATHI)
				message = pick("ñíîøàåò ñåá[ya] â êëîàêó, íàñàæèâà[ya]ñü íà îãðàí [P]", "ïðûãàåò çàäîì íà èíñòðóìåíòå [P], ñæàâ îòâåðñòèå êëîàêè", "÷óâñòâåííî ñíîøàåò ñåá[ya] ÷ëåíîì [P]")
				if (prob(35))
					message = pick("ïîî÷åð¸äíî íàñàæèâàåòñ[ya] êëîàêîé íà ÷ëåíû [P], ââîä[ya] èõ â êèøêó","íàñàæèâàåòñ[ya] êëîàêîé íà îäèí èç ÷ëåíîâ [P], îñòàâë[ya][ya] âòîðîé òåðåòüñ[ya] î ëîáîê", "íàñàæèâàåòñ[ya] íà îäèí èç ÷ëåíîâ [P] êëîàêîé, îñòàâë[ya][ya] âòîðîé òåðåòüñ[ya] î ïîäõâîñòüå", "íåóìîëèìî ñêà÷åò íà îäíîì èç îòðîñòêîâ [P]", "ñêà÷åò íà îäíîì èç ÷ëåíîâ, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "÷óâñòâåííî äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] çàäîì íà èíñòðóìåíòå [P], ëàñêà[ya] åãî ñâîèì íóòðîì", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåíû êëîàêîé", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] íà çâåðüêå [P]")
				else if (prob(20))
					message = pick("íàñàæèâàåòñ[ya] êîëå÷êîì êëîàêè íà ñòâîëû [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàíû â êèøêó äî óïîðà", "ðàäîñòíî ïðûãàåò íà îáîèõ îòðîñòêàõ [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî çàäîì", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåíû âíóòðè êëîàêè", "íàñàæèâàåòñ[ya] êëîàêîé íà ñòâîëû [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàíû â ñåá[ya] äî óïîðà")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] êëîàêîé íà ãîëîâêó îäíîãî èç ãóçíîò¸ðîâ [P], ââîä[ya] å¸ âíóòðü", "îñòîðîæíî ââîäèò îêîí÷àíèå îðãàíà [P] â ñâîþ êëîàêó", "íàïðàâë[ya]åò ÷ëåí [P] â ñâîþ êëîàêó, ïîìîãà[ya] ñåáå ðóêîé", "îñòîðîæíî ââîäèò êîí÷èê ñòâîëà [P] â ñâîþ êëîàêó", "çàïóñêàåò êîí÷èê çâåðüêà [P] â ñâîþ êëîàêó", "çàïóñêàåò øàõò¸ðà [P] â ñâîè øàõòû")
					H.lastfucked = P
					H.lfhole = hole

	//H.Teshari + vulps
			if((H.species.get_bodytype() == SPECIES_TESHARI) && (P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT))
				message = pick("ñíîøàåò ñåá[ya] â êëîàêó, íàñàæèâà[ya]ñü íà óçëîâàòûé îãðàí [P]", "ïðûãàåò çàäîì íà óçëîâàòîì èíñòðóìåíòå [P], ñæàâ îòâåðñòèå êëîàêè", "÷óâñòâåííî ñíîøàåò ñåá[ya] ÷ëåíîì [P]")
				if (prob(35))
					message = pick("íàñàæèâàåòñ[ya] îòâåðñòèåì êëîàêè íà óçëîâàòûé ÷ëåí [P]", "ïðûãàåò íà ÷ëåíå [P], íàäàâëèâà[ya] íà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] óçåë êëîàêîé", "ñêà÷åò íà ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí àíóñîì", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] íà çâåðüêå [P]")
				else if (prob(20))
					message = pick("[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí âíóòðè êëîàêè", "íåóìîëèìî ñêà÷åò íà ÷ëåíå [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâîþ êëîàêó äî óçëà", "íàñàæèâàåòñ[ya] êëîàêîé íà ñòâîë [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â êèøêó äî óïîðà", "÷óâñòâåííî äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] íà óçëîâàòîì èíñòðóìåíòå [P], ëàñêà[ya] åãî ñâîèì íóòðîì")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] êëîàêîé íà êîí÷èê óçëîâàòîãî ãóçíîò¸ðà [P], ââîä[ya] åãî âíóòðü", "îñòîðîæíî ââîäèò îêîí÷àíèå óçëîâàòîãî îðãàíà [P] â ñâîþ êëîàêó", "íàïðàâë[ya]åò ÷ëåí [P] â ñâîþ êëîàêó, ïîìîãà[ya] ñåáå ðóêîé", "îñòîðîæíî ââîäèò êîí÷èê óçëîâàòîãî ñòâîëà [P] â ñâîþ êëîàêó", "çàïóñêàåò êîí÷èê óçëîâàòîãî çâåðüêà [P] â ñâîþ êëîàêó", "çàïóñêàåò øàõò¸ðà [P] â ñâîè øàõòû")
					H.lastfucked = P
					H.lfhole = hole

	//H.Teshari + prometheans
			if(H.species.get_bodytype() == SPECIES_TESHARI && P.species.get_bodytype() == SPECIES_PROMETHEAN)
				message = pick("ñíîøàåò ñåá[ya] â êëîàêó ñêëèçëûì îãðàíîì [P]", "ïðûãàåò çàäîì íà ñêëèçëîì èíñòðóìåíòå [P], ñæàâ êëîàêó", "ñêà÷åò íà ñêëèçëîì ìàëûøå [P]", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] êëîàêîé íà ñëèçè [P]", "÷óâñòâåííî ñíîøàåòñ[ya] ñ [P]")
				if (prob(35))
					message = pick("âãîí[ya]åò ñêîëüçêèé èíòðóìåíò [P] â ñâîþ êèøêó ïî ñàìûå [ya]éöà", "íàñàæèâàåòñ[ya] êîëå÷ñêîì êëîàêè íà ñêëèçëûé îòðîñòîê [P], ââîä[ya] åãî â ïð[ya]ìóþ êèøêó äî óïîðà", "íåóìîëèìî ñêà÷åò íà [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ñêëèçëûé îðãàí â ñâîþ êëîàêó", "ïðûãàåò íà ÷ëåíå [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] æåëåéíîå òåëî", "ñêà÷åò íà æåëåîáðàçíîì ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ñêëèçëûé ÷ëåí âíóòðè ñåá[ya]", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] çàäîì íà èíñòðóìåíòå [P], ëàñêà[ya] åãî íóòðîì", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ñòåíêàìè êèøå÷íèêà", "íàñàæèâàåòñ[ya] íà ïåíèñ [P], äàâ[ya] íà íåãî ñâîèì òàçîì")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] íà êîí÷èê æåëåéíîãî ãóçíîò¸ðà [P], ââîä[ya] åãî âíóòðü", "îñòîðîæíî ââîäèò ñêëèçëûé îðãàí [P] â ñâîþ êèøêó", "íàïðàâë[ya]åò ñêëèçëûé îòðîñòîê [P] â ñâîþ êëîàêó, ïîìîãà[ya] ñåáå ðóêîé", "îñòîðîæíî ââîäèò ñòâîë [P] â ñâîþ êëîàêó", "çàïóñêàåò æåëåéíîãî çâåðüêà [P] â ñâîé êèøå÷íèê", "çàïóñêàåò øàõò¸ðà [P] â ñâîè óãîëüíûå øàõòû")
					H.lastfucked = P
					H.lfhole = hole

//Prometheans

	//P.Prometheans + basics

			if((P.species.get_bodytype() == SPECIES_PROMETHEAN) && (H.species.get_bodytype() != SPECIES_PROMETHEAN && H.species.get_bodytype() != SPECIES_TESHARI))
				message = pick("ñíîøàåò ñåá[ya] â çàä ñêëèçëûì îãðàíîì [P]", "íåóìîëèìî ñêà÷åò íà [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ñêëèçëûé îðãàí â ñâîé çàä", "ïðûãàåò çàäîì íà ñêëèçëîì èíñòðóìåíòå [P], ñæàâ àíàëüíîå êîëå÷êî", "÷óâñòâåííî ñíîøàåò ñåá[ya] ñêëèçëûì ÷ëåíîì [P]")
				if (prob(35))
					message = pick("âãîí[ya]åò ñêîëüçêèé èíòðóìåíò [P] â ñâîé çàä", "ñêà÷åò íà ñêëèçëîì ìàëûøå [P], ïîãðóæà[ya] åãî â ñâîé çàä", "ïðûãàåò íà [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] æåëåéíîå òåëî", "íàñàæèâàåòñ[ya] àíàëüíûì îòâåðñòèåì íà ñêëèçëûé îòðîñòîê [P], ââîä[ya] åãî â ïð[ya]ìóþ êèøêó äî óïîðà", "ñêà÷åò íà æåëåîáðàçíîì ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ñêëèçëûé ÷ëåí âíóòðè ñåá[ya]", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] çàäîì íà èíñòðóìåíòå [P], ëàñêà[ya] åãî íóòðîì", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ïð[ya]ìîé êèøêîé", "íàñàæèâàåòñ[ya] íà ïåíèñ [P], äàâ[ya] íà íåãî ñâîèì òàçîì", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] çàäîì íà ñëèçè [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] çàäíèöåé íà êîí÷èê æåëåéíîãî ãóçíîò¸ðà [P], ââîä[ya] åãî âíóòðü", "îñòîðîæíî ââîäèò îðãàí [P] â ñâîé çàäíèé ïðîõîä", "íàïðàâë[ya]åò ñêëèçëûé îòðîñòîê [P] â ñâîþ øàõòó, ïîìîãà[ya] ñåáå ðóêîé", "îñòîðîæíî ââîäèò ñòâîë [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò æåëåéíîãî çâåðüêà [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò øàõò¸ðà [P] â ñâîè óãîëüíûå øàõòû")
					H.lastfucked = P
					H.lfhole = hole

	//H.Prometheans + basics

			if((H.species.get_bodytype() == SPECIES_PROMETHEAN) && (P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_TESHARI || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_PROTEAN || P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_SERGAL || P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN))
				message = pick("ñíîøàåòñ[ya], íàñàæèâà[ya]ñü ñêëèçëûì òåëîì íà îãðàí [P]", "ïðûãàåò ñêëèçëûì çàäîì íà èíñòðóìåíòå [P]", "÷óâñòâåííî ñæèìàåò íóòðîì ÷ëåí [P]")
				if (prob(35))
					message = pick("íàñàæèâàåòñ[ya]ñêëèçëûì òåëîì íà ÷ëåí [P]", "íåóìîëèìî ñêîëüçèò íà ÷ëåíå [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâî¸ òåëî", "ñêà÷åò íà ìàëûøå [P], ïîãðóæà[ya] åãî âíóòðü ñåá[ya]", "ïðûãàåò íà ÷ëåíå [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî çàäîì", "ñêà÷åò íà ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí âíóòðè ñêëèçëîãî òåëà", "÷óâñòâåííî ñêîëüçèò òàçîì ïî-êðóãó, ñèä[ya] íà èíñòðóìåíòå [P], ëàñêà[ya] åãî íóòðîì", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ñëèçüþ", "íàñàæèâàåòñ[ya] íà ñòâîë [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñåá[ya] äî óïîðà", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] íà çâåðüêå [P]")
				else if(prob(5))
					message = pick("íàñàæèâàåòñ[ya] íà ÷ëåí [P] äî [ya]èö, ñëåãêà ïðîíèêà[ya] â óðåòðó [P] ñâîåé ñëèçüþ", "âáèðàåò â ñåá[ya] çâåðüêà [P], ñëåãêà ïðîíèêíóâ â ãîëîâêó ñëèçüþ")
				else if(prob(0.3))
					message = pick("ðåçêî ïàäàåò íà ÷ëåí [P] - âãîí[ya][ya] åãî â ñåá[ya] äî îñíîâàíè[ya] - è ãëóáîêî ïðîñêàëüçûâàåò ñëèçüþ â óðåòðó", "íåæíî ñæàâ çâåðüêà [P], ãëóáîêî ïðîñêàëüçûâàåò â íåãî ñëèçüþ")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] æåëåéíûì òåëîì íà ãóçíîò¸ðà [P], ââîä[ya] åãî âíóòðü", "îáâîëàêèâàåò îðãàí [P] âáèðà[ya] åãî â ñåá[ya]", "íàïðàâë[ya]åò ÷ëåí [P] ðóêîé â ñâî¸ ñêëèçëîå òåëî, îáâîëàêèâà[ya]", "îñòîðîæíî ââîäèò ñòâîë [P] â ñâîþ ñëèçü", "çàïóñêàåò çâåðüêà [P] â ñâî¸ ñêëèçëîå òåëî")
					H.lastfucked = P
					H.lfhole = hole


	//H.Prometheans + taj
			if(H.species.get_bodytype() == SPECIES_PROMETHEAN && P.species.get_bodytype() == SPECIES_TAJ)
				message = pick("ñíîøàåòñ[ya], íàñàæèâà[ya]ñü ñêëèçëûì òåëîì íà øèïàñòûé îãðàí [P]", "ïðûãàåò ñêëèçëûì òåëîì íà ïîêðûòîì øèïàìè èíñòðóìåíòå [P]", "÷óâñòâåííî ñæèìàåò íóòðîì øèïàñòûé ÷ëåí [P]")
				if (prob(35))
					message = pick("íàñàæèâàåòñ[ya]ñêëèçëûì òåëîì íà øèïàñòûé ñòâîë [P]", "íåóìîëèìî ñêîëüçèò íà øèïàñòîì ÷ëåíå [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâî¸ òåëî", "ñêà÷åò íà ìàëûøå [P], ïîãðóæà[ya] åãî âíóòðü ñåá[ya]", "ïðûãàåò íà ïîêðûòîì øèïàìè ÷ëåíå [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî çàäîì", "ñêà÷åò íà ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] øèïàñòûé ÷ëåí âíóòðè ñêëèçëîãî òåëà", "÷óâñòâåííî ñêîëüçèò òàçîì ïî-êðóãó, ñèä[ya] íà ïîêðûòîì øèïàìè èíñòðóìåíòå [P], ëàñêà[ya] åãî íóòðîì", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ñëèçüþ", "íàñàæèâàåòñ[ya] íà ïîêðûòûé øèïàìè ñòâîë [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñåá[ya] äî óïîðà", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] íà øèïàñòîì çâåðüêå [P]")
				else if(prob(5))
					message = pick("íàñàæèâàåòñ[ya] íà øèïàñòûé èíòðóìåíò [P] ïî ñàìûå [ya]éöà, ñëåãêà ïðîíèêà[ya] â óðåòðó [P] ñâîåé ñëèçüþ", "âáèðàåò â ñåá[ya] øèïàñòîãî çâåðüêà [P], ñëåãêà ïðîíèêíóâ â ãîëîâêó ñëèçüþ")
				else if(prob(0.3))
					message = pick("ðåçêî ïàäàåò íà ÷ëåí [P] - âãîí[ya][ya] åãî â ñåá[ya] äî îñíîâàíè[ya] - è ãëóáîêî ïðîñêàëüçûâàåò ñëèçüþ â óðåòðó", "íåæíî ñæàâ øèïàñòîãî çâåðüêà [P], ãëóáîêî ïðîñêàëüçûâàåò â íåãî ñëèçüþ")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] æåëåéíûì òåëîì íà øèïàñòîãî ãóçíîò¸ðà [P], ââîä[ya] åãî âíóòðü", "îáâîëàêèâàåò ïîêðûòûé øèïàìè îðãàí [P], âáèðà[ya] åãî â ñåá[ya]", "íàïðàâë[ya]åò ÷ëåí [P] ðóêîé â ñâî¸ ñêëèçëîå òåëî, îáâîëàêèâà[ya]", "îñòîðîæíî ââîäèò ñòâîë [P] â ñâîþ ñëèçü", "çàïóñêàåò çâåðüêà [P] â ñâî¸ ñêëèçëîå òåëî")
					H.lastfucked = P
					H.lfhole = hole

	//H.Prometheans + unathi ------- ñäåëàòü âàðèàöèè è êíîïêè íà 1 è 2 ÷ëåíà

			if(H.species.get_bodytype() == SPECIES_PROMETHEAN && P.species.get_bodytype() == SPECIES_UNATHI)
				message = pick("ñíîøàåòñ[ya], íàñàæèâà[ya]ñü ñêëèçëûì òåëîì íà îäèí èç ÷ëåíîâ [P]", "ïðûãàåò ñêëèçëûì òåëîì íà èíñòðóìåíòå [P]", "÷óâñòâåííî ñæèìàåò íóòðîì îäèí ÷ëåí [P]", "ñêà÷åò íà äâóõ ÷ëåíàõ [P] ñðàçó")
				//1 dick
				if (prob(35))
					message = pick("íåóìîëèìî ñêîëüçèò íà ÷ëåíå [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâî¸ òåëî", "ñêà÷åò íà ìàëûøå [P], ïîãðóæà[ya] åãî âíóòðü ñåá[ya]", "ïðûãà[ya] è óäàð[ya][ya]ñü î òåëî [P] ñêîëüçèò íà åãî ÷ëåíå", "ñêà÷åò íà îäíîì èç îòðîñòêîâ, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí âíóòðè ñâîåãî ñêëèçëîãî òåëà", "÷óâñòâåííî ñêîëüçèò òàçîì ïî-êðóãó, ñèä[ya] íà îäíîì èç èíñòðóìåíòîâ [P], ëàñêà[ya] åãî íóòðîì", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ñëèçüþ", "íàñàæèâàåòñ[ya] íà ñòâîë [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñåá[ya] äî óïîðà", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] íà çâåðüêå [P]")
				else if(prob(5))
					message = pick("íàñàæèâàåòñ[ya] íà îäèí èç ÷ëåíîâ [P], íåìíîãî ïðîíèêíóâ ñâîåé ñëèçüþ â åãî óðåòðó", "âáèðàåò â ñåá[ya] îäíîãî çâåðüêà [P], ñëåãêà ïðîíèêíóâ â ãîëîâêó ñëèçüþ")
				else if(prob(0.3))
					message = pick("ðåçêî ïàäàåò íà îäèí èç ÷ëåíîâ [P] - âãîí[ya][ya] åãî â ñåá[ya] äî îñíîâàíè[ya] - è ãëóáîêî ïðîñêàëüçûâàåò ñëèçüþ â óðåòðó", "íåæíî ñæàâ çâåðüêà [P], ãëóáîêî ïðîñêàëüçûâàåò â íåãî ñëèçüþ")
				//2 dicks
				else if (prob(20))
					message = pick("íàñàæèâàåòñ[ya]ñêëèçëûì òåëîì íà äâóñòâîëüíûé ÷ëåí [P]", "íåóìîëèìî ñêîëüçèò íà ÷ëåíàõ [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàíû â ñâî¸ òåëî", "ñêà÷åò íà ìàëûøàõ [P], ïîãðóæà[ya] èõ âíóòðü ñåá[ya]", "ïðûãà[ya] è óäàð[ya][ya]ñü î òåëî [P] ñêîëüçèò íà åãî ÷ëåíàõ", "ñêà÷åò íà ÷ëåíàõ, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà îáà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàíà âíóòðè ñâîåãî ñêëèçëîãî òåëà", "÷óâñòâåííî ñêîëüçèò òàçîì ïî-êðóãó, ñèä[ya] íà èíñòðóìåíòàõ [P], ëàñêà[ya] èõ íóòðîì", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåíû ñëèçüþ", "íàñàæèâàåòñ[ya] íà ñòâîëû [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàíû â ñåá[ya] äî óïîðà", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] íà çâåðüêàõ [P]")
				else if(prob(3))
					message = pick("íàñàæèâàåòñ[ya] íà îáà èíòðóìåíòà [P] äî êîíöà, ÷óòü-÷óòü ïðîíèêíóâ ñëèçüþ â óðåòðó", "âáèðàåò â ñåá[ya] îáîèõ çâåðüêîâ [P], ñëåãêà ïðîíèêà[ya] â ãîëîâêè ñëèçüþ")
				else if(prob(0.3))
					message = pick("ðåçêî ïàäàåò íà îáà èíòðóìåíòà [P] - âãîí[ya][ya] èõ â ñåá[ya] äî îñíîâàíè[ya] - è ãëóáîêî ïðîñêàëüçûâàåò ñëèçüþ â óðåòðó", "íåæíî ñæàâ çâåðüêîâ [P], ãëóáîêî ïðîñêàëüçûâàåò â íèõ ñëèçüþ")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] æåëåéíûì òåëîì íà ãóçíîò¸ðà [P], ââîä[ya] åãî âíóòðü", "îáâîëàêèâàåò îðãàíû [P], âáèðà[ya] èõ â ñåá[ya]", "íàïðàâë[ya]åò ÷ëåíû [P] ðóêîé â ñâî¸ ñêëèçëîå òåëî, îáâîëàêèâà[ya]", "îñòîðîæíî ââîäèò ñòâîë [P] â ñâîþ ñëèçü", "çàïóñêàåò çâåðüêîâ [P] â ñâî¸ ñêëèçëîå òåëî")
					H.lastfucked = P
					H.lfhole = hole

	//H.Prometheans + vulps

			if((H.species.get_bodytype() == SPECIES_PROMETHEAN) && (P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_FLAT || P.species.get_bodytype() == SPECIES_ZORREN_HIGH))
				message = pick("ñíîøàåòñ[ya], íàñàæèâà[ya]ñü ñêëèçëûì òåëîì íà óçëîâàòûé îãðàí [P]", "ïðûãàåò ñêëèçëûì òåëîì íà óçëîâàòîì èíñòðóìåíòå [P]", "÷óâñòâåííî ñæèìàåò íóòðîì óçåë ÷ëåíà [P]")
				if (prob(35))
					message = pick("íàñàæèâàåòñ[ya]ñêëèçëûì òåëîì íà óçëîâàòûé ñòâîë [P]", "íåóìîëèìî ñêîëüçèò íà óçëîâàòîì ÷ëåíå [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâî¸ òåëî", "ñêà÷åò íà ìàëûøå [P], ïîãðóæà[ya] åãî âíóòðü ñåá[ya]", "ïðûãàåò íà óçëîâàòîì ÷ëåíå [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî çàäîì", "ñêà÷åò íà ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ïðè[ya]òíî îòò[ya]ãèâà[ya] ÷ëåí çà óçåë", "÷óâñòâåííî ñêîëüçèò òàçîì ïî-êðóãó, ñèä[ya] íà èíñòðóìåíòå [P], ëàñêà[ya] åãî óçåë íóòðîì", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ñëèçüþ", "íàñàæèâàåòñ[ya] íà ñòâîë [P], ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñåá[ya] äî óïîðà", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] íà óçëîâàòîì çâåðüêå [P]")
				else if(prob(5))
					message = pick("íàñàæèâàåòñ[ya] íà óçëîâàòûé èíòðóìåíò [P] ïî ñàìûå [ya]éöà, ñëåãêà ïðîíèêíóâ â óðåòðó [P] ñâîåé ñëèçüþ", "âáèðàåò â ñåá[ya] çâåðüêà [P], ñëåãêà ïðîíèêà[ya] â ãîëîâêó ñëèçüþ")
				else if(prob(0.3))
					message = pick("ðåçêî ïàäàåò íà îäèí èç ÷ëåíîâ [P] - âãîí[ya][ya] åãî â ñåá[ya] äî îñíîâàíè[ya] - è ãëóáîêî ïðîñêàëüçûâàåò ñëèçüþ â óðåòðó", "íåæíî ñæàâ óçåë çâåðüêà [P], ãëóáîêî ïðîñêàëüçûâàåò â íåãî ñëèçüþ")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ñàäèòñ[ya] æåëåéíûì òåëîì íà óçëîâàòîãî ãóçíîò¸ðà [P], ââîä[ya] åãî âíóòðü", "îáâîëàêèâàåò óçëîâàòûé îðãàí [P], âáèðà[ya] åãî â ñåá[ya]", "íàïðàâë[ya]åò ÷ëåí [P] ðóêîé â ñâî¸ ñêëèçëîå òåëî, îáâîëàêèâà[ya]", "îñòîðîæíî ââîäèò ñòâîë [P] â ñâîþ ñëèçü", "çàïóñêàåò çâåðüêà [P] â ñâî¸ ñêëèçëîå òåëî")
					H.lastfucked = P
					H.lfhole = hole

	//H.Prometheans + prometheans
			if(H.species.get_bodytype() == SPECIES_PROMETHEAN && P.species.get_bodytype() == SPECIES_PROMETHEAN)
				message = pick("÷óâñòâåííî ñïëåòàåòñ[ya] ñëèçüþ ñ [P]", "íåóìîëèìî ñêà÷åò íà [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ñêëèçëûé îðãàí â ñâîé ñêëèçëûé çàä", "ïðûãàåò íà ñêëèçëîì èíñòðóìåíòå [P], õëþïà[ya]")
				if (prob(35))
					message = pick("âãîí[ya]åò ñêîëüçêèé èíòðóìåíò [P] â ñâîé çàä ïî ñàìûå [ya]éöà", "ñêà÷åò íà ñêëèçëîì ìàëûøå [P], ïîãðóæà[ya] åãî â ñâîé çàä", "ïðûãàåò íà [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] æåëåéíîå òåëî", "ñêà÷åò íà æåëåîáðàçíîì ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ñêëèçëûé ÷ëåí âíóòðè ñåá[ya]", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] çàäîì íà èíñòðóìåíòå [P], ëàñêà[ya] åãî íóòðîì", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P]", "íàñàæèâàåòñ[ya] íà ïåíèñ [P], äàâ[ya] íà íåãî ñâîèì òàçîì", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] çàäîì íà ñëèçè [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] ñâîåé æåëåéíîé çàäíèöåé íà æåëåéíîãî ãóçíîò¸ðà [P], âáèðà[ya] åãî âíóòðü", "îñòîðîæíî âáèðàåò îðãàí [P] â ñåá[ya]", "íàïðàâë[ya]åò ñêëèçëûé îòðîñòîê [P] â ñâîþ æåëåéíóþ øàõòó, ïîìîãà[ya] ñåáå ðóêîé", "îñòîðîæíî ââîäèò ñòâîë [P] â ñâî¸ ñêëèçëîå òåëî", "çàïóñêàåò æåëåéíîãî çâåðüêà [P] â ñâî¸ ñêëèçëîå òåëî")
					H.lastfucked = P
					H.lfhole = hole

/*
			if(P.species.get_bodytype() != SPECIES_PROMETHEAN && H.species.get_bodytype() == SPECIES_PROMETHEAN && H.species.get_bodytype() != SPECIES_TESHARI)
				message = pick("ñíîøàåò ñåá[ya] â çàä ñêëèçëûì îãðàíîì [P]", "íåóìîëèìî ñêà÷åò íà [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ñêëèçëûé îðãàí â ñâîé çàä", "ïðûãàåò çàäîì íà ñêëèçëîì èíñòðóìåíòå [P], ñæàâ àíàëüíîå êîëå÷êî", "÷óâñòâåííî ñíîøàåò ñåá[ya] ñêëèçëûì ÷ëåíîì [P]")
				if (prob(35))
					message = pick("âãîí[ya]åò ñêîëüçêèé èíòðóìåíò [P] â ñâîé çàä ïî ñàìûå [ya]éöà", "ñêà÷åò íà ñêëèçëîì ìàëûøå [P], ïîãðóæà[ya] åãî â ñâîé çàä", "ïðûãàåò íà [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] æåëåéíîå òåëî", "íàñàæèâàåòñ[ya] àíàëüíûì îòâåðñòèåì íà ñêëèçëûé îòðîñòîê [P], ââîä[ya] åãî â ïð[ya]ìóþ êèøêó äî óïîðà", "ñêà÷åò íà æåëåîáðàçíîì ÷ëåíå, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[H.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ñêëèçëûé ÷ëåí âíóòðè ñåá[ya]", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] çàäîì íà èíñòðóìåíòå [P], ëàñêà[ya] åãî íóòðîì", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ïð[ya]ìîé êèøêîé", "íàñàæèâàåòñ[ya] íà ïåíèñ [P], äàâ[ya] íà íåãî ñâîèì òàçîì", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] çàäîì íà ñëèçè [P]")
				else if (prob(5))
					message = pick("íàñàæèâàåòñ[ya] íà èíòðóìåíò [P] ïî ñàìûå [ya]éöà, ñëåããêà ïðîíèêà[ya] â óðåòðó [P]", "íàñàæèâàåòñ[ya] íà èíòðóìåíò [P] ïî ñàìûå [ya]éöà, ãëóáîêî ïðîíèêà[ya] â óðåòðó [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("ìåäëåííî ñàäèòñ[ya] çàäíèöåé íà êîí÷èê æåëåéíîãî ãóçíîò¸ðà [P], ââîä[ya] åãî âíóòðü", "îñòîðîæíî ââîäèò îðãàí [P] â ñâîé çàäíèé ïðîõîä", "íàïðàâë[ya]åò ñêëèçëûé îòðîñòîê [P] â ñâîþ øàõòó, ïîìîãà[ya] ñåáå ðóêîé", "îñòîðîæíî ââîäèò ñòâîë [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò æåëåéíîãî çâåðüêà [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò øàõò¸ðà [P] â ñâîè óãîëüíûå øàõòû")
					H.lastfucked = P
					H.lfhole = hole
*/

			if(H.species.get_bodytype() == SPECIES_DIONA || P.species.get_bodytype() == SPECIES_DIONA)
				return


			P.arousal += 30
			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message].</B></font>")
				P.lust += H.potenzia * 2
				P.arousal += 30
				P.moan()
			else
				H.visible_message("<font color=purple>[H] [message].</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message].</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += P.potenzia
			H.arousal += 20
			if (H.lust >= H.resistenza)
				H.cum(H, P)
				if(H.species.get_bodytype() != SPECIES_PROMETHEAN || H.species.get_bodytype() != SPECIES_TESHARI)
					message = pick("Âû ÷óâñòâóåòå, êàê ñôèíêòåð [H] íà÷èíàåò ðåçêî ñîêðàùàòüñ[ya] âîêðóã âàøåãî èíñòðóìåíòà.", "Âû ÷óâñòâóåòå, êàê ñôèíêòåð [H] êðåïêî ñæèìàþò âàø íàïð[ya]æ¸ííûé ÷ëåí, ïóëüñèðó[ya].", "Âû ÷óâñòâóåòå, êàê êèøå÷íèê [H] ì[ya]ãêî ñæèìàåòñ[ya] âîêðóã âàøåãî ÷ëåíà.", "Âû ÷óâñòâóåòå, êàê íàïðí[ya]ãñ[ya] ñôèíêòåð [H], óäåðæèâà[ya] âàø ÷ëåí âíóòðè ïð[ya]ìîé êèøêè.", "Âû ÷óâñòâóåòå, êàê ìûøöû ñôèíêòåðà [H] ñèëüíî ñæèìàþòñ[ya] íåñêîëüêî ðàç, ïðèáëèæà[ya] âàñ ê îðãàçìó.")
				else if(H.species.get_bodytype() == SPECIES_PROMETHEAN)
					message = pick("Âû ÷óâñòâóåòå, êàê íóòðî [H] íà÷èíàåò ðåçêî ñîêðàùàòüñ[ya] âîêðóã âàøåãî èíñòðóìåíòà.", "Âû ÷óâñòâóåòå, êàê ñëèçü [H] êðåïêî ñæèìàþò âàø íàïð[ya]æ¸ííûé ÷ëåí, ïóëüñèðó[ya].", "Âû ÷óâñòâóåòå, êàê âíóòðåííîñòè [H] ì[ya]ãêî ñæèìàþòñ[ya] âîêðóã âàøåãî ÷ëåíà.", "Âû ÷óâñòâóåòå, êàê íàïðí[ya]ãñ[ya] íóòðî [H], óäåðæèâà[ya] âàø ÷ëåí âíóòðè ñåá[ya].", "Âû ÷óâñòâóåòå, êàê íóòðî [H] ñèëüíî ñæèìàåòñ[ya] íåñêîëüêî ðàç, ïðèáëèæà[ya] âàñ ê îðãàçìó.")
				else if(H.species.get_bodytype() == SPECIES_TESHARI)
					message = pick("Âû ÷óâñòâóåòå, êàê êëîàêà [H] íà÷èíàåò ðåçêî ñîêðàùàòüñ[ya] âîêðóã âàøåãî èíñòðóìåíòà.", "Âû ÷óâñòâóåòå, êàê êëîàêà [H] êðåïêî ñæèìàþò âàø íàïð[ya]æ¸ííûé ÷ëåí, ïóëüñèðó[ya].", "Âû ÷óâñòâóåòå, êàê êèøå÷íèê [H] ì[ya]ãêî ñæèìàåòñ[ya] âîêðóã âàøåãî ÷ëåíà.", "Âû ÷óâñòâóåòå, êàê íàïðí[ya]ãñ[ya] êëîàêà [H], óäåðæèâà[ya] âàø ÷ëåí âíóòðè êèøêè.", "Âû ÷óâñòâóåòå, êàê ìûøöû êëîàêè [H] ñèëüíî ñæèìàþòñ[ya] íåñêîëüêî ðàç, ïðèáëèæà[ya] âàñ ê îðãàçìó.")
				to_chat(P, message)
				P.lust += 15
			else
				H.moan()
			if (P.stat != DEAD/* && P.stat != UNCONSCIOUS*/)
				P.lust += H.potenzia
				if (P.lust >= P.resistenza)
					P.cum(P, H, "assfuck")
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)
			if (H.species.name == "Promethean")
				playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)

/*	ASSFUCK OLD VER.

		if("assfuck")

			message = pick("ñêà÷åò íà ÷ëåíå [P], ïîãðóæà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ñâîé çàä", "ïðûãàåò çàäîì íà èíñòðóìåíòå [P], ñæàâ àíóñ", "íàñàæèâàåòñ[ya] íà ÷ëåí [P] àíàëüíûì êîëüöîì, ââîä[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] îðãàí â ïð[ya]ìóþ êèøêó")
			if (prob(35))
				message = pick("íàñàæèâàåòñ[ya] íà èíòðóìåíò [P] çàäíèöåé ïî ñàìûå [ya]éö", "ñêà÷åò íà ìàëûøå [P], ïîãðóæà[ya] åãî â ñâîé çàä", "ïðûãàåò íà [P], óäàð[ya][ya]ñü î [P.identifying_gender==FEMALE ? "å¸" : "åãî"] òåëî", "ïîäïðûãèâàåò, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "[P.identifying_gender==FEMALE ? "óï¸ðëàñü" : "óï¸ðñ[ya]"] òàçîì â [P] è åëîçèò, äåðæà [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí âíóòðè ñåá[ya]", "äâèãàåò òàçîì ïî-êðóãó, ñèä[ya] çàäîì íà èíñòðóìåíòå [P], ëàñêà[ya] åãî ", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], ëàñêà[ya] [P.identifying_gender==FEMALE ? "å¸" : "åãî"] ÷ëåí ïð[ya]ìîé êèøêîé", "íàñàæèâàåòñ[ya] íà êðþ÷îê [P], äàâ[ya] íà íåãî ñâîèì òàçîì", "äâèãàåòñ[ya] ââåðõ-âíèç, ñèä[ya] çàäîì íà çâåðüêå [P]")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("ìåäëåííî ñàäèòñ[ya] çàäíèöåé íà èíòðóìåíò [P], ââîä[ya] åãî âíóòðü", "îñòîðîæíî ââîäèò îðãàí [P] â çàäíèé ñâîé ïðîõîä", "íàïðàâë[ya]åò ÷ëåí [P] â ñâîþ øàõòó, ïîìîãà[ya] ñåáå ðóêîé", "îñòîðîæíî ââîäèò ñòâîë [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò çâåðüêà [P] â ñâîþ ïð[ya]ìóþ êèøêó", "çàïóñêàåò øàõò¸ðà [P] â ñâîè óãîëüíûå øàõòû")
				H.lastfucked = P
				H.lfhole = hole

			P.arousal += 30
			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message].</B></font>")
				P.lust += H.potenzia * 2
				P.arousal += 30
				P.moan()
			else
				H.visible_message("<font color=purple>[H] [message].</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message].</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += P.potenzia
			H.arousal += 20
			if (H.lust >= H.resistenza)
				H.cum(H, P)
				message = pick("Âû ÷óâñòâóåòå, êàê àíàëüíîå êîëüöî [H] íà÷èíàåò ðåçêî ñîêðàùàòüñ[ya] âîêðóã âàøåãî èíñòðóìåíòà.", "Âû ÷óâñòâóåòå, êàê ñôèíêòåð [H] êðåïêî ñæèìàþò âàø íàïð[ya]æ¸ííûé ÷ëåí, ïóëüñèðó[ya].", "Âû ÷óâñòâóåòå, êàê àíóñ [H] ðåçêî ñæèìàåòñ[ya] âîêðóã âàøåãî ÷ëåíà.", "Âû ÷óâñòâóåòå, êàê íàïðí[ya]ãñ[ya] ñôèíêòåð [H], óäåðæèâà[ya] âàø ÷ëåí âíóòðè ïð[ya]ìîé êèøêè.", "Âû ÷óâñòâóåòå, êàê ìûøöû ñôèíêòåðà [H] ñèëüíî ñæèìàþòñ[ya] íåñêîëüêî ðàç, ïðèáëèæà[ya] âàñ ê îðãàçìó.")
				to_chat(P, message)
				P.lust += 15
			else
				H.moan()
			if (P.stat != DEAD/* && P.stat != UNCONSCIOUS*/)
				P.lust += H.potenzia
				if (P.lust >= P.resistenza)
					P.cum(P, H, "anus")
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)
			if (H.species.name == "Promethean")
				playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)
*/

/* PETTING */

		if("petting")
			if (P != H)
				switch(P.gender)
					if("male")
						message = pick("ïîãëàæèâàåò ïàõ [P] ÷åðåç îäåæäó.", "ïîãëàæèâàåò ïàõ [P] ÷åðåç îäåæäó, çàñòàâë[ya][ya] åãî òâåðäåòü.", "ãëàäèò èíñòðóìåíò [P] ÷åðåç îäåæäó.", "ñòèìóëèðóåò ÷ëåí [P] ðóêîé ÷åðåç îäåæäó.")
					if("female")
						message = pick("ïîãëàæèâàåò ïðîìåæíîñòü [P] ÷åðåç îäåæäó.", "ãëàäèò ïðîìåæíîñòü [P] ÷åðåç îäåæäó, ïðîâîä[ya] ìåæäó íîã ïàëüöàìè.", "ãëàäèò êèñêó [P] ÷åðåç îäåæäó.", "ëàñêàåò [P] ìåæäó íîã ÷åðåç îäåæäó.")
				H.arousal += 10
			else
				switch(H.gender)
					if("male")
						message = pick("ïîãëàæèâàåò ñâîé ïàõ ÷åðåç îäåæäó.", "ïîãëàæèâàåò ñâîé ïàõ ÷åðåç îäåæäó, çàñòàâë[ya][ya] åãî òâåðäåòü.", "ãëàäèò ñâîé èíñòðóìåíò ÷åðåç îäåæäó.", "ñòèìóëèðóåò ñâîé ÷ëåí ðóêîé ÷åðåç îäåæäó.")
					if("female")
						message = pick("ïîãëàæèâàåò ñâîþ ïðîìåæíîñòü ÷åðåç îäåæäó.", "ãëàäèò ñâîþ ïðîìåæíîñòü ÷åðåç îäåæäó, ïðîâîä[ya] ìåæäó íîã ïàëüöàìè.", "ãëàäèò ñâîþ êèñêó ÷åðåç îäåæäó.", "ëàñêàåò ñåá[ya] ìåæäó íîã ÷åðåç îäåæäó.")

			if (H.lastfucked != P || H.lfhole != hole)
				H.lastfucked = P
				H.lfhole = hole

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				if(P.lust < (P.resistenza / 2))
					P.lust += 5
				P.arousal += 10
				P.moan()
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				if(P.lust < (P.resistenza / 2))
					P.lust += 5
				P.arousal += 10
				P.moan()

mob/living/carbon/human/proc/moan()
	var/ya = "&#255;"
	var/mob/living/carbon/human/H = src
	if(!is_muzzled())
		if(H.species.get_bodytype() == SPECIES_HUMAN || H.species.get_bodytype() == SPECIES_SKRELL || H.species.get_bodytype() == SPECIES_HUMAN_VATBORN || H.species.get_bodytype() == SPECIES_RAPALA || H.species.get_bodytype() == SPECIES_VASILISSAN || H.species.get_bodytype() == SPECIES_AKULA || H.species.get_bodytype() == SPECIES_PROMETHEAN || H.species.get_bodytype() == SPECIES_TAJ || H.species.get_bodytype() == SPECIES_VULPKANIN || H.species.get_bodytype() == SPECIES_SERGAL || H.species.get_bodytype() == SPECIES_ZORREN_HIGH || H.species.get_bodytype() == SPECIES_ZORREN_FLAT)
			if(prob(H.lust / H.resistenza * 65))
				var/message = pick("ïîñòàíûâàåò", "ñòîíåò îò óäîâîëüñòâè[ya]", "çàêàòûâàåò ãëàçà", "çàêóñûâàåò ãóáó", "äîâîëüíî îáëèçûâàåòñ[ya]")
				H.visible_message("<B>[H]</B> [message].")
				var/g = H.gender == FEMALE ? "f" : "m"
				var/moan = rand(1, 7)
				if (moan == lastmoan)
					moan--
				if(!istype(loc, /obj/structure/closet))
					playsound(loc, "honk/sound/interactions/moan_[g][moan].ogg", 70, 1, frequency = get_age_pitch())
				else if (g == "f")
					playsound(loc, "honk/sound/interactions/under_moan_f[rand(1, 4)].ogg", 70, 1, frequency = get_age_pitch())
				lastmoan = moan

				if(istype(H.head, /obj/item/clothing/head/kitty) || istype(H.head, /obj/item/clothing/head/collectable/kitty))
					playsound(loc, "honk/sound/interactions/purr_f[rand(1, 3)].ogg", 70, 1, 0)
/*
			if("Tajara")
				if (prob(H.lust / src.resistenza * 70))
					var/message = pick("ìóðëû÷åò", "ìóðëû÷åò îò óäîâîëüñòâè[ya]", "çàêàòûâàåò ãëàçà", "äîâîëüíî îáëèçûâàåòñ[ya]")
					H.visible_message("<B>[H]</B> [message].")
					playsound(loc, "honk/sound/interactions/purr[rand(1, 3)].ogg", 70, 1, frequency = get_age_pitch())

			if("Vulpkanin", "Sergal", "Flatland Zorren", "Highlander Zorren")
				if (prob(H.lust / src.resistenza * 70))
					var/message = pick("ïîñêóëèâàåò", "ïîñêóëèâàåò îò óäîâîëüñòâè[ya]", "çàêàòûâàåò ãëàçà", "äîâîëüíî îáëèçûâàåòñ[ya]")
					H.visible_message("<B>[H]</B> [message].")
*/
		if(H.species.get_bodytype() == SPECIES_UNATHI)
			if (prob(H.lust / H.resistenza * 65))
				var/message = pick("äîâîëüíî øèïèò", "èçâèâàåòñ[ya] îò óäîâîëüñòâè[ya]")
				H.visible_message("<B>[H]</B> [message].")

		if(H.species.get_bodytype() == SPECIES_TESHARI || H.species.get_bodytype() == SPECIES_VOX || H.species.get_bodytype() == SPECIES_NEVREAN)
			if (prob(H.lust / H.resistenza * 65))
				var/message = pick("äîâîëüíî ïèùèò", "èçâèâàåòñ[ya] îò óäîâîëüñòâè[ya]")
				H.visible_message("<B>[H]</B> [message].")

	else if (prob(H.lust / H.resistenza * 65))
		var/message = pick("òèõî ñòîíåò", "ïîñòàíûâàåò â òèøèíå", "çàêàòûâàåò ãëàçà îò óäîâîëüñòâè[ya]")
		H.visible_message("<B>[H]</B> [message].")

mob/living/carbon/human/proc/handle_lust()
	lust -= 4
	if (lust <= 0)
		lust = 0
		lastfucked = null
		lfhole = ""
		multiorgasms = 0
	if (lust == 0)
		erpcooldown -= 1
	if (erpcooldown < 0)
		erpcooldown = 0
	interactcooldown -= 1
	if (interactcooldown < 0)
		interactcooldown = 0

/mob/living/carbon/human/proc/do_fucking_animation(mob/living/carbon/human/P)
	var/pixel_x_diff = 0
	var/pixel_y_diff = 0
	var/final_pixel_y = initial(pixel_y)

	var/direction = get_dir(src, P)
	if(direction & NORTH)
		pixel_y_diff = 8
	else if(direction & SOUTH)
		pixel_y_diff = -8

	if(direction & EAST)
		pixel_x_diff = 8
	else if(direction & WEST)
		pixel_x_diff = -8

	if(pixel_x_diff == 0 && pixel_y_diff == 0)
		pixel_x_diff = rand(-3,3)
		pixel_y_diff = rand(-3,3)
		animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
		animate(pixel_x = initial(pixel_x), pixel_y = initial(pixel_y), time = 2)
		return

	animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
	animate(pixel_x = initial(pixel_x), pixel_y = final_pixel_y, time = 2)

mob/living/carbon/human/proc/handle_arousal(var/mob/living/carbon/human/H)
	if(erpcooldown > 0)
		arousal -= 20
	if(arousal < 0)
		arousal = 0
	if(arousal > resistenza)
		arousal = resistenza

	if((arousal > 1) && (arousal <= low_arousal))
		arousal -= 2
	else if((arousal > low_arousal) && (arousal <= med_arousal))
		arousal -= 1
		if(prob(10))
			if(gender == FEMALE && species.name != "Teshari" && !(wear_suit || w_uniform))
				flube_splatter(src,H,0)
	else if(arousal > med_arousal)
		arousal -= 0.5
		if(prob(30))
			if(gender == FEMALE && species.name != "Teshari" && !(wear_suit || w_uniform))
				flube_splatter(src,H,0)

/obj/item/weapon/enlarger
	name = "penis enlarger"
	desc = "Very special DNA mixture which helps YOU to enlarge your little captain."
	icon = 'icons/obj/items.dmi'
	icon_state = "dnainjector"
	item_state = "dnainjector"
	hitsound = null
	throwforce = 0
	w_class = 1
	throw_speed = 3
	throw_range = 15
	attack_verb = list("stabbed")

/obj/item/weapon/enlarger/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	if(istype(M, /mob/living/carbon/human) && (M.gender == MALE))
		M.potenzia = 30
		to_chat(user, "<span class='warning'>Your penis extends!</span>")

	else if (istype(M, /mob/living/carbon/human) && M.gender == FEMALE)
		to_chat(user, "<span class='warning'>It didn't affect you since you're female!</span>")

	..()

	qdel(src)

/obj/item/weapon/enlarger/attack_self(mob/user as mob)
	to_chat(user, "<span class='warning'>You break the syringe. Gooey mass is dripping on the floor.</span>")
	qdel(src)

/obj/item/weapon/dildo
	name = "dildo"
	desc = "Hmmm, deal throw"
	icon = 'honk/icons/obj/items/dildo.dmi'
	icon_state = "dildo"
	item_state = "c_tube"
	throwforce = 0
	force = 10
	w_class = 1
	throw_speed = 3
	throw_range = 15
	attack_verb = list("slammed", "bashed", "whipped")
	var/hole = "vagina"
	var/pleasure = 10
	var/ya = "&#255;"


/********************************************************************
****************************Moans for dildo**************************
*******************************FIX NEEDED****************************
****it isn't working properly and i think it isn't working at all****
***********************Todo: fix this shit please********************
********************************************************************/
mob/living/carbon/human/proc/dmoan()
	var/ya = "&#255;"
	var/mob/living/carbon/human/M = src
	if(!is_muzzled())
		if(M.species.get_bodytype() == SPECIES_HUMAN || M.species.get_bodytype() == SPECIES_SKRELL || M.species.get_bodytype() == SPECIES_HUMAN_VATBORN || M.species.get_bodytype() == SPECIES_RAPALA || M.species.get_bodytype() == SPECIES_VASILISSAN || M.species.get_bodytype() == SPECIES_AKULA || M.species.get_bodytype() == SPECIES_PROMETHEAN || M.species.get_bodytype() == SPECIES_TAJ || M.species.get_bodytype() == SPECIES_VULPKANIN || M.species.get_bodytype() == SPECIES_SERGAL || M.species.get_bodytype() == SPECIES_ZORREN_HIGH || M.species.get_bodytype() == SPECIES_ZORREN_FLAT)
			if (prob(M.arousal / M.resistenza * 65))
				var/message = pick("ïîñòàíûâàåò", "ñòîíåò îò óäîâîëüñòâè[ya]", "çàêàòûâàåò ãëàçà", "äîâîëüíî îáëèçûâàåòñ[ya]")
				M.visible_message("<B>[M]</B> [message].")
				var/g = M.gender == FEMALE ? "f" : "m"
				var/moan = rand(1, 7)
				if (moan == lastmoan)
					moan--
				if(!istype(loc, /obj/structure/closet))
					playsound(loc, "honk/sound/interactions/moan_[g][moan].ogg", 70, 1, frequency = get_age_pitch())
				else if (g == "f")
					playsound(loc, "honk/sound/interactions/under_moan_f[rand(1, 4)].ogg", 70, 1, frequency = get_age_pitch())
				lastmoan = moan

				if (istype(M.head, /obj/item/clothing/head/kitty)  || istype(M.head, /obj/item/clothing/head/collectable/kitty))
					playsound(loc, "honk/sound/interactions/purr_f[rand(1, 3)].ogg", 70, 1, 0)
/*
			if("Tajara")
				if (prob(H.lust / src.resistenza * 70))
					var/message = pick("ìóðëû÷åò", "ìóðëû÷åò îò óäîâîëüñòâè[ya]", "çàêàòûâàåò ãëàçà", "äîâîëüíî îáëèçûâàåòñ[ya]")
					H.visible_message("<B>[H]</B> [message].")
					playsound(loc, "honk/sound/interactions/purr[rand(1, 3)].ogg", 70, 1, frequency = get_age_pitch())

			if("Vulpkanin", "Sergal", "Flatland Zorren", "Highlander Zorren")
				if (prob(H.lust / src.resistenza * 70))
					var/message = pick("ïîñêóëèâàåò", "ïîñêóëèâàåò îò óäîâîëüñòâè[ya]", "çàêàòûâàåò ãëàçà", "äîâîëüíî îáëèçûâàåòñ[ya]")
					H.visible_message("<B>[H]</B> [message].")
*/
		if(M.species.get_bodytype() == SPECIES_UNATHI)
			if (prob(M.arousal / M.resistenza * 65))
				var/message = pick("äîâîëüíî øèïèò", "èçâèâàåòñ[ya] îò óäîâîëüñòâè[ya]")
				M.visible_message("<B>[M]</B> [message].")

		if(M.species.get_bodytype() == SPECIES_TESHARI || M.species.get_bodytype() == SPECIES_VOX || M.species.get_bodytype() == SPECIES_NEVREAN)
			if (prob(M.arousal / M.resistenza * 65))
				var/message = pick("äîâîëüíî ïèùèò", "èçâèâàåòñ[ya] îò óäîâîëüñòâè[ya]")
				M.visible_message("<B>[M]</B> [message].")

	else if (prob(M.arousal / M.resistenza * 65))
		var/message = pick("òèõî ñòîíåò", "ïîñòàíûâàåò â òèøèíå", "çàêàòûâàåò ãëàçà îò óäîâîëüñòâè[ya]")
		M.visible_message("<B>[M]</B> [message].")

/obj/item/weapon/dildo/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	var/hasvagina = (M.gender == FEMALE && M.species.genitals && M.species.name != "Stok")
	var/hasanus = M.species.anus
	var/mouthfree = !(M.wear_mask)
	var/message = ""

// Va-Gina

	if(istype(M, /mob/living/carbon/human) && user.zone_sel.selecting == "groin" && M.is_nude())
		if (hole == "vagina" && hasvagina && M.erpcooldown == 0)
			if (user == M)
				message = pick("óäîâëåòâîð[ya]åò ñåá[ya] ñ ïîìîùüþ äèëäî", "ïîãðóæàåò äèëäî â ñâîþ êèñêó", "çàòàëêèâàåò äèëäî â ñâîþ âàãèíó ïî ñàìûå [ya]éöà", "ïîãðóæàåò äèëäî â ñâî¸ ëîíî", "òðàõàåò ñåá[ya] âî âëàãàëèùå ïðè ïîìîùè äèëäî")
			else
				message = pick("óäîâëåòâîð[ya]åò [M] ñ ïîìîùüþ äèëäî", "ïîãðóæàåò äèëäî â êèñêó [M]", "çàòàëêèâàåò äèëäî â âàãèíó [M] ïî ñàìûå [ya]éöà", "ïîãðóæàåò äèëäî â ëîíî [M]", "òðàõàåò [M] âî âçàãàëèùå ïðè ïîìîùè äèëäî")

			if (prob(5) && M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple><B>[user] [message].</B></font>")
				M.lust += pleasure * 2

			else if (M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple>[user] [message].</font>")
				M.lust += pleasure

			if (M.lust >= M.resistenza)
				M.cum(M, user, "floor")
			else
				M.moan()

			user.do_fucking_animation(M)
			playsound(loc, "honk/sound/interactions/bang[rand(4, 6)].ogg", 70, 1, -1)

// A-S-S

	if(istype(M, /mob/living/carbon/human) && user.zone_sel.selecting == "groin" && M.is_nude())
		if (hole == "anus" && hasanus && M.erpcooldown == 0)
			if (user == M)
				message = pick("óäîâëåòâîð[ya]åò ñåá[ya] àíàëüíî ñ ïîìîùüþ äèëäî", "òðàõàåò ñåá[ya] â çàä ïðè ïîìîùè äèëäî", "çàòàëêèâàåò äèëäî ñåáå â àíóñ ïî ñàìûå [ya]éöà", "÷èñòèò ñâîé äûìîõîä, èñïîëüçó[ya] äèëäî", "ìåñèò ãëèíó â ñâîåé øàõòå ïðè ïîìîùè äèëäî")
			else
				message = pick("óäîâëåòâîð[ya]åò [M] àíàëüíî ñ ïîìîùüþ äèëäî", "òðàõàåò [M] â çàä ïðè ïîìîùè äèëäî", "çàòàëêèâàåò äèëäî [M] â àíóñ ïî ñàìûå [ya]éöà", "÷èñòèò äûìîõîä [M], èñïîëüçó[ya] äèëäî", "ìåñèò ãëèíó â øàõòå [M] ïðè ïîìîùè äèëäî")

			if (prob(5) && M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple><B>[user] [message].</B></font>")
				M.lust += pleasure * 2

			else if (M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple>[user] [message].</font>")
				M.lust += pleasure

			if (M.lust >= M.resistenza)
				M.cum(M, user, "floor")
			else
				M.moan()

			user.do_fucking_animation(M)
			playsound(loc, "honk/sound/interactions/bang[rand(4, 6)].ogg", 70, 1, -1)

// Suck it carefully, babe

	if(istype(M, /mob/living/carbon/human) && user.zone_sel.selecting == "mouth" && mouthfree)
		if (hole == "mouth")
			if (user == M)
				message = pick("ðàçðàáàòûâàåò ñâîþ ãîðòàíü ïðè ïîìîùè äèëäî", "çàòàëêèâàåò äèëäî ñåáå â ãëîòêó", "ðàçðàáàòûâàåò ñâîþ ãëîòêó, èñïîëüçó[ya] äèëäî", "òðàõàåò ñåá[ya] â ãîðëî, èñïîëüçó[ya] äèëäî", "çàòàëêèâàåò äèëäî ñåáå â ãëîòêó ïî ñàìûå [ya]éöà", "ñîñ¸ò äèëäî êàê ëåäåíåö")
			else
				message = pick("ðàçðàáàòûâàåò ãîðòàíü [M] ïðè ïîìîùè äèëäî", "çàòàëêèâàåò äèëäî [M] â ãëîòêó", "ðàçðàáàòûâàåò ãëîòêó [M], èñïîëüçó[ya] äèëäî", "òðàõàåò [M] â ãîðëî ïðè ïîìîùè äèëäî", "çàòàëêèâàåò äèëäî â ãëîòêó [M] ïî ñàìûå [ya]éöà")

			if (prob(5) && M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple><B>[user] [message].</B></font>")
				M.arousal += pleasure * 2

			else if (M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple>[user] [message].</font>")
				M.arousal += pleasure

			else if (M.arousal <= M.resistenza / 2) // <-- Maybe issue is here
				M.dmoan()

			user.do_fucking_animation(M)
			playsound(loc, "honk/sound/interactions/oral[rand(1, 2)].ogg", 70, 1, -1)
			if (prob(pleasure))
				M.oxyloss += 5
				M.visible_message("<B>[M]</B> [pick("äàâèòñ[ya] <B>äèëäî</B>", "çàäûõàåòñ[ya]", "êîð÷èòñ[ya] â ðâîòíîì ïîçûâå")].")
				if (istype(M.loc, /obj/structure/closet))
					M.visible_message("<B>[M]</B> [pick("äàâèòñ[ya] <B>äèëäî</B>", "çàäûõàåòñ[ya]", "êîð÷èòñ[ya] â ðâîòíîì ïîçûâå")].")

/*********************************************
*****Switch between rot, pez-da and zhopa*****
*********************************************/
/obj/item/weapon/dildo/attack_self(mob/user as mob)
	if(hole == "vagina")
		hole = "anus"
	else if(hole == "anus")
		hole = "mouth"
	else if(hole == "mouth")
		hole = "vagina"
	user << "<span class='warning'>Hmmm. Maybe we should put it in [hole]?!</span>"


//SEMEN

/datum/reagent/semen
	name = "semen"
	id = "semen"
	description = "Fluid secreted by males during ejaculation."
	reagent_state = LIQUID
	color = "#fffaf0"
	taste_description = "salt"
	taste_mult = 2
	var/nutriment_factor = 0.5
	glass_icon_state = "glass_white"
	glass_name = "glass of cream"
	glass_desc = "Smells suspicious."

/datum/reagent/semen/touch_turf(var/turf/T)
	src = null
	if(!istype(T, /turf/space))
		new /obj/effect/decal/cleanable/cum(T)

//Female lube

/datum/reagent/f_lube
	name = "female lube"
	id = "f_lube"
	description = "Organic substance, natural lubricant to protect the mucous membrane of the genitals from the appearance of microcracks and irritation."
	reagent_state = LIQUID
	color = "#AAAAAA77"
	taste_description = "slimy and salty liquid"
	taste_mult = 2
	var/nutriment_factor = 0.3
	glass_desc = "Probably smells like a fish."

/datum/reagent/f_lube/touch_turf(var/turf/T)
	src = null
	if(!istype(T, /turf/space))
		new /obj/effect/decal/cleanable/f_lube(T)

proc/flube_splatter(var/target,var/datum/reagent/f_lube/source,var/large)

	if(istype(source,/atom/movable))
		var/atom/movable/A = source
		if(!isturf(A.loc))
			return

	var/obj/effect/decal/cleanable/f_lube/B
	var/decal_type = /obj/effect/decal/cleanable/f_lube/splatter
	var/turf/T = get_turf(target)

// Are we dripping or splattering?
	var/list/drips = list()
// Only a certain number of drips (or one large splatter) can be on a given turf.
	for(var/obj/effect/decal/cleanable/f_lube/drip/drop in T)
		drips |= drop.drips
		qdel(drop)
	if(!large && drips.len < 5)
		decal_type = /obj/effect/decal/cleanable/f_lube/drip

// Find a blood decal or create a new one.
	B = locate(decal_type) in T
	if(!B)
		B = new decal_type(T)

	var/obj/effect/decal/cleanable/f_lube/drip/drop = B
	if(istype(drop) && drips && drips.len && !large)
		drop.overlays |= drips
		drop.drips |= drips
