/**********************************************************
*******Interactions code by HONKERTRON feat TestUnit*******
***********Edits by AshtonFox & RenardQueenston************
*******Contains a lot ammount of ERP and MEHANOYEBLYA******
***********************************************************/
// ��� ��������� ���� ����� ����� ����� ��������� ���� Windows 1251 � ������ ����� ����� ��� LF.

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
		to_chat(src, "<span class='warning'>�� ��������� ���� ����� ���-��, ��� ��� ����������...</span>")
		src.arousal += 10
	else if(gender != NEUTER)
		to_chat(src, "<span class='warning'>�� ��� ������� ����������, ����� ���������������[ya] ������ ����!</span>")
	else
		to_chat(src, "<span class='warning'>� ��� ��� ����������� ������� ���������! ��� �� ��������� ��� ����������?</span>")

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
		dat +=  {"� <A href='?src=\ref[src];interaction=bow'>�������� ������.</A><BR>"}
		dat +=  {"� <A href='?src=\ref[src];interaction=wave'>����������������.</A><BR>"}
	if (hashands)
		dat +=  {"<font size=3><B>����:</B></font><BR>"}
		if (Adjacent(P))
			if (P != H)
				dat +=  {"� <A href='?src=\ref[src];interaction=handshake'>������ ����.</A><BR>"}
				dat +=  {"� <A href='?src=\ref[src];interaction=five'>���� �[ya]��.</A><BR>"}
			dat +=  {"� <A href='?src=\ref[src];interaction=hug'>���������!</A><BR>"}
			dat +=  {"� <A href='?src=\ref[src];interaction=cheer'>��������� �� �����</A><BR>"}
			if (hashands_p && (P != H))
				dat +=  {"� <A href='?src=\ref[src];interaction=give'>�������� �������.</A><BR>"}
			dat +=  {"� <A href='?src=\ref[src];interaction=slap'><font color=red>���� ��������!</font></A><BR>"}
			if (hasanus_p)
				dat += {"� <A href='?src=\ref[src];interaction=assslap'>�������� �� �������</A><BR>"}
			if (isnude_p)
				if (hasvagina_p)
					dat += {"� <A href='?src=\ref[src];interaction=fingering'><font color=purple>��������� �������...</font></A><BR>"}
				if (haspenis_p)
					dat += {"� <A href='?src=\ref[src];interaction=jerk'><font color=purple>���������</font></A><BR>"}
			if ((P.species.get_bodytype() == SPECIES_TAJ || P.species.get_bodytype() == SPECIES_TESHARI || P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT || P.species.get_bodytype() == SPECIES_SERGAL) && (P != H))
				dat +=  {"� <A href='?src=\ref[src];interaction=pull'><font color=red>ĸ����� �� �����!</font></A><BR>"}
				if(P.can_inject(H, 1))
					dat +=  {"� <A href='?src=\ref[src];interaction=pet'>���������.</A><BR>"}
			if (P == H)
				dat +=  {"� <A href='?src=\ref[src];interaction=pet'>��������� ���[ya].</A><BR>"}
			if ((haspenis_p || hasvagina_p) && !isnude_p && P.species.name != "Teshari" && P.can_inject(H, 1))
				dat += {"� <A href='?src=\ref[src];interaction=petting'><font color=purple>��������� ���</font></A><BR>"}
			dat +=  {"� <A href='?src=\ref[src];interaction=knock'><font color=red>���� ������������.</font></A><BR>"}
		if (P != H)
			dat +=  {"� <A href='?src=\ref[src];interaction=fuckyou'><font color=red>�������� ������� �����.</font></A><BR>"}
			dat +=  {"� <A href='?src=\ref[src];interaction=threaten'><font color=red>��������� �������.</font></A><BR>"}

	if (mouthfree && H.species.name != "Diona" && P != H)
		dat += {"<font size=3><B>����:</B></font><BR>"}
		dat += {"� <A href='?src=\ref[src];interaction=kiss'>����������.</A><BR>"}
		if (Adjacent(P))
			if (mouthfree_p)
				dat += {"� <A href='?src=\ref[src];interaction=lick'>������� � ����.</A><BR>"}
			if (isnude_p)
				if (haspenis_p)
					dat += {"� <A href='?src=\ref[src];interaction=blowjob'><font color=purple>������� �����.</font></A><BR>"}
				if (hasvagina_p)
					dat += {"� <A href='?src=\ref[src];interaction=vaglick'><font color=purple>��������.</font></A><BR>"}
				if (hasanus_p && P.species.name != "Diona")
					dat += {"� <A href='?src=\ref[src];interaction=asslick'><font color=purple>������������ ������ ���?!</font></A><BR>"}
			dat +=  {"� <A href='?src=\ref[src];interaction=spit'><font color=red>�������.</font></A><BR>"}
		dat +=  {"� <A href='?src=\ref[src];interaction=tongue'><font color=red>�������� [ya]���.</font></A><BR>"}

	if (Adjacent(P) && isnude && P.species.name != "Diona" && P != H)
		if (haspenis && hashands)
			dat += {"<font size=3><B>����:</B></font><BR>"}
			if (hasvagina_p && isnude_p && P.species.name != "Teshari")
				dat += {"� <A href='?src=\ref[src];interaction=vaginal'><font color=purple>�������� ����������.</font></A><BR>"}
			if (hasanus_p && isnude_p && P.species.name != "Vox")
				dat += {"� <A href='?src=\ref[src];interaction=anal'><font color=purple>�������� �������.</font></A><BR>"}
			if (mouthfree_p)
				dat += {"� <A href='?src=\ref[src];interaction=oral'><font color=purple>�������� �������.</font></A><BR>"}
	if (isnude && hashands && P != H)
		if (hasvagina)
			dat += {"<font size=3><B>����:</B></font><BR>"}
			if (isnude_p && haspenis_p && usr.loc == H.partner.loc)
				dat += {"� <A href='?src=\ref[src];interaction=mount'><font color=purple>��������</font></A><BR>"}
				dat += {"� <A href='?src=\ref[src];interaction=rub'><font color=purple>���������[ya]</font></A><BR>"}
			if (mouthfree_p && usr.loc == H.partner.loc)
				dat += {"� <A href='?src=\ref[src];interaction=facesitting'><font color=purple>����� �� ����</font></A><BR>"}
			if (mouthfree_p && (Adjacent(P) || (usr.loc == H.partner.loc)))
				dat += {"� <A href='?src=\ref[src];interaction=forcelick'><font color=purple>��������� ����������</font></A><BR>"}
			if ((usr.loc == H.partner.loc) && hasvagina_p)
				dat += {"� <A href='?src=\ref[src];interaction=tribadism'><font color=purple>���������</font></A><BR>"}
	if (isnude && hashands && P.species.name != "Diona" && P.species.name != "Vox" && P != H)
		if (hasanus && haspenis_p)
			dat += {"<font size=3><B>���:</B></font><BR>"}
			if (isnude_p && usr.loc == H.partner.loc)
				dat += {"� <A href='?src=\ref[src];interaction=assfuck'><font color=purple>�������� �����</font></A><BR>"}

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
�������� rub ��� ���, ����� ������� ������ _���������/����������_ ������, ����� ������ ������ ������� � ������, � �� �������� ��� ������. � ��, ����?
��������� dickrub, ����� ������ ��������� ������� ��� ��������������� � ������ ��������� �������� � ���� �������� ����������.
�������� ������� ����������� ��������� ������ � ���, ��� ��.. ������ ��������� "slit".
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
				message = pick("������� [P] � ���.", "������� [P] � ������.", "������[ya]�� ��� [P] �������.", "�������� ������� � ��� [P].", "�������� �� [ya]����� [P].")
				var/datum/reagents/holder = new
				var/amt = rand(20,30)
				holder.add_reagent("semen", amt)
				holder.trans_to_mob(P, amt, CHEM_INGEST)

			else if (hole == "vagina")
				message = pick("������� � [P]", "�������� � ����� [P]", "������[ya]�� ��������� [P] �������.", "����� ���[ya]������ ���� �� [P], � ����� �������� �� ���.", "��������� � [P] ��������� ���, ����� ����������[ya]. ������ �������� �������� �� ���� [P].")

			else if (hole == "anus")
				message = pick("������� [P] � ���.", "������[ya]�� ������� [P] �������.", "�������� �������� �������� � ��[ya]��� ����� [P].", "����������� ���� �� [P], � ����� ������� ������� �� [P.identifying_gender == MALE ? "���" : "�"] ���.", "���[ya]������ ���� �� ������� [P] � ����� �� �������� �� ���.")

			else if (hole == "floor")
				message = pick("������� �� ���!", "������� �� ������ �������!")

			else if (hole == "cumhand")
				if (P != H)
					message = pick("������� [P] � ����.", "������� � ������ ������� [P].", "������������� ���[ya], �����[ya] ������� � ������ [P].", "�����[ya]�� ����� ����� �������, ���[ya]����[ya] ���� [P].")
				else if (!R)
					message = pick("������� ���� � ����.", "������� � ���� ������ �������.", "������������� ���[ya], �����[ya] ���� ������� � ������.", "�����[ya]�� ����� ����� �������, ���[ya]����[ya] ���� ����.")
				else
					message = pick("������� � [R.name].", "���������[ya] � ���� � ������� � [R.name].", "������[ya]�� [R.name] �������� ���.", "������[ya] ���� � [R.name], �������.")

			else if (hole == "rub")
				message = pick("������� ���� �� �����.", "������[ya] �� ����� [P], �����[ya]�� ����� ����� �������, �� ������������[ya].", "������������� ���[ya] �� ������ [P].", "������[ya]�� ������� ����� ������ [P] ����� �������.")

			else if (hole == "assfuck")
				message = pick("������� [P] � �������.", "������[ya]�� ������� [P] �������.", "�������� �������� �������� � ��� [P].", "��������� ���[ya] � ��[ya]��� ����� [P].", "������������ ������� � ��[ya]��� ����� [P].", "�������� � ��� [P].", "������� � ��� [P].", "��������� ���[ya] � ��� [P].", "�������� � ��[ya]��� ����� [P].", "�������� � ������� [P]")

		else
			message = pick("�������!", "�����������!")

		playsound(loc, "honk/sound/interactions/final_m[rand(1, 5)].ogg", 70, 1, 0)

		H.visible_message("<B>[H] [message]</B>")
		if (istype(P.loc, /obj/structure/closet))
			P.visible_message("<B>[H] [message]</B>")
		H.lust = 5
		H.resistenza += 50

	else
		if(R && (P == H))
			R.reagents.add_reagent("f_lube", rand(5, 15))
			message = pick("���������[ya] � �������� ������� � ������[ya]�� [R.name] ����� �������", "���������� ����� � ����� ������. [R.name] ������[ya]���[ya] ���������� ������", "����������[ya], � ����� ����� ��������[ya]���[ya], �������� [R.name] �������", "��������, ������� �����, � ������� � [R.name] �������")
		else
			message = pick("���������[ya] � �������� �������", "���������� ����� � ����� ������", "����������[ya], � ����� ����� ��������[ya]���[ya]", "��������, ������� �����")
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

			message = pick("���������� [P].", "���������� [P].")
			if (prob(35))
				message = pick("���������� [P].", "�������� ����������� [P] [ya]�����.", "���������� [P].", "������� [P] [ya]������.", "��������� ���� [ya]��� � [P]", "�������[ya] � [P] [ya]������", "�������� �������� [ya]����� ����� ����������� [P]")

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
				retaliation_message = pick("���������� ���� [P].", "���������� ���� [P], �������� [H.identifying_gender==FEMALE ? "��" : "���"] � ���.", "������� ������ [P].", "�������� [ya]����� ������ [P] � ����������� ���.")
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
					message = pick("�� ����������, ��� ����������� ����� [P] �������� ����� ����������[ya].", "�� ����������, ��� � ��� ��� �������� ��������� ���������� ����� [P] � �������� �������.", "�� ����������, ��� ������[ya] ����� [P] ����� ������� ��� [ya]����� ������ ���[ya].", "�� ����������, ��� �� ������ [P] ��������[ya], � � ������ �������� ������������.", "�� ����������, ��� [P] ������� ��� � ��� �������� ������, ���������[ya].")
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
			message = pick("���������� ���� [P]", "��������� �������� �������� ������� [P]")
			if (prob(35))
				message = pick("������� ������ [P], ������[ya] �� ���� ������.", "�������� [ya]��� [P] ����� ������������, ����������� �� [P.identifying_gender==FEMALE ? "�" : "���"] ����.", "���������� ��� [P] ������ ������� ��� � ������ �� ��.", "������ ����[ya] � ���� [P] ������������, ������[ya] �����.", "�������� ���� [P] �������� �������[ya]�� ����.", "�������[ya] � ������� [P], ����[ya] �� ���� ����������.", "�������� �������� ������������ �� ���� [P].", "����������� ���� ���� �� ���������� [P] �������[ya]�� ����.")

			message = pick()
 */
/* FACESITTING */

		if("facesitting")

			message = pick("������ ������� �� ���� [P].", "������� ���� [P].")
			if (prob(35))
				message = pick("������� ������ [P], ������[ya] �� ���� ������.", "�������� [ya]��� [P] ����� ������������, ����������� �� [P.identifying_gender==FEMALE ? "�" : "���"] ����.", "���������� ��� [P] ������ ������� ��� � ������ �� ��.", "������ ����[ya] � ���� [P] ������������, ������[ya] �����.", "�������� ���� [P] �������� �������[ya]�� ����.", "�������[ya] � ������� [P], ����[ya] �� ���� ����������.", "�������� �������� ������������ �� ���� [P].", "����������� ���� ���� �� ���������� [P] �������[ya]�� ����.")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("�[ya]��� ������[ya] [P] �� ����.", "����� �����������[ya] �� ���� [P].", "������[ya] �� ���� [P], �����[ya]�� ���������� ������� [P.identifying_gender==FEMALE ? "��" : "���"] ��� ���.", "������� ���� [P] ����� ������� ������������.")
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
				retaliation_message = pick("���������� ���� [H].", "���������� ���� [H], �������� [P.identifying_gender==FEMALE ? "��" : "���"] � ���.", "������� ������ [H].", "�������� [ya]����� ������ [H] � ����������� ���.")
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
					message = pick("�� ����������, ��� ����������� ����� [H] �������� ����� ����������[ya].", "�� ����������, ��� � ��� ��� �������� ��������� ���������� �[ya]���[ya]�� [H] � �������� �������.", "�� ����������, ��� ������[ya] ����� [H] ����� ��������[ya] �� ����� ����.", "�� ����������, ��� �� ������ [H] ��������[ya], � � ������ �������� ������������.", "�� ����������, ��� [H] ������� ��� �� ���� �������� �[ya]���[ya]��, ���������[ya].")
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
				retaliation_message = pick("������ ������ [H] �� ����.", "������� ���� ����� ��� [H].", "������ ������� ��-��� ����� [H], ����[ya] ������������� ����.", "��� ���� ��� �������[ya] ��������[ya] ��-��� ��� [H].")
				H.visible_message("<font color=red>[P] [retaliation_message]</font>")

/* FORCELICK */

		if("forcelick")

			message = pick("�������[ya]�� [P] ����������.", "���������� [P] ���������� ����.")
			if (prob(35))
				message = pick("������ ��������� ������ [P] � ����.", "������� ��� � ��� [P], ������[ya] �����.", "�������� ���������� [P], ���������� � [P.identifying_gender==FEMALE ? "�" : "���"] ������.", "����������� ������ [P] � ������ ���������, ��������[ya]�� ������� [ya]����.", "����� ������� ������ �� ������ [P], ����� [P.identifying_gender==FEMALE ? "�" : "���"] [ya]��� ����������[ya] ������.")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("�[ya]��� ������[ya]�� [P] � ����� �������.", "����� ������� ������ [P] � �������[ya]�� � ����� �����������.", "������[ya]�� ���� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ��� � ���� ���������� �����.", "�������[ya]�� ��� [P] � ����� ������� �����������.")
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
				retaliation_message = pick("���������� ���� [H].", "���������� ���� [H], �������� [P.identifying_gender==FEMALE ? "��" : "���"] � ���.", "������� ������ [H].", "�������� [ya]����� ������ [H] � ����������� ���.")
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
					message = pick("�� ����������, ��� ����������� ����� [H] �������� ����� ����������[ya].", "�� ����������, ��� � ��� ��� �������� ��������� ���������� �[ya]���[ya]�� [H] � �������� �������.", "�� ����������, ��� ������[ya] ����� [H] ����� ������� ��� [ya]����� ������ ���[ya].", "�� ����������, ��� �� ������ [H] ��������[ya], � [H.identifying_gender==FEMALE ? "�" : "���"] ������ �������� ������������.", "�� ����������, ��� [H] ������� ��� � ��� �������� �[ya]���[ya]��, ���������[ya].")
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
				retaliation_message = pick("[ya]������ ������ [H] �� ����.", "������� ������ ����� [H].", "����[ya]��� ����� [P.identifying_gender==FEMALE ? "�����������" : "�����������"] ����� ����������� �����.", "��� ���� ��� �������[ya] ��������[ya] ��-��� ���� [H].")
				H.visible_message("<font color=red>[P] [retaliation_message]</font>")

/* FINGERING */

		if("fingering")
			if (P != H)
				message = pick("������ ��� ������ � ������ [P].", "������� [P] ��������.")
				H.arousal += 12
			else
				message = pick("������ ��� ������ � ���� ������.", "������� ���[ya] ��������.")
			if (prob(35))
				if(P.species.get_bodytype() == SPECIES_UNATHI || P.species.get_bodytype() == SPECIES_XENOHYBRID || P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_PROTEAN || P.species.get_bodytype() == SPECIES_ALRAUNE)
					if (P != H)
						message = pick("������ ��� ������ � ������ [P].", "������� �������� [P].", "����� �������� [P].", "������� [P] ����������.", "����� ����������� ����������� [P].", "��������� ������ ������� � [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] �������.", "������� ������� [P].")
						H.arousal += 12
					else
						message = pick("������ ��� ������ � ���� ������.", "������� ���� ��������.", "����� � ���[ya] ��������.", "������� ���[ya] ����������.", "����� ����������� ���� �����������.", "��������� ������ ������� �� ���������, �����[ya] ���[ya] �������.", "������� ���� �������.")
				if(P.species.get_bodytype() == SPECIES_TAJ || P.species.get_bodytype() == SPECIES_XENOCHIMERA || P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT || P.species.get_bodytype() == SPECIES_SERGAL)
					if (P != H)
						message = pick("������ ��� ������ � �������� ������ [P].", "������� �������� [P].", "����� �������� [P].", "������� [P] ����������.", "����� ����������� �������� ����������� [P].", "��������� ������ ������� � [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] �������.", "������� ������� [P].")
						H.arousal += 12
					else
						message = pick("������ ��� ������ � ���� �������� ������.", "������� ���� ��������.", "����� � ���[ya] ��������.", "������� ���[ya] ����������.", "����� ����������� ���� �������� �����������.", "��������� ������ ������� �� ���������, �����[ya] ���[ya] �������.", "������� ���� �������.")

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
					message = pick("�� ����������, ��� ����������� ����� [P] �������� ����� ����������[ya] ������ ����� �������.", "�� ����������, ��� ��������� ������ [P] ������ ������� ���� ��������� ������.", "�� ����������, ��� ������[ya] ����� [P] ����� ������� ���� ������ ������ ���[ya].", "�� ����������, ��� ����� ������� ���������[ya] ����� ������ ���[ya]��� ������� [P].", "�� ����������, ��� �� ���������� ������� ����� ������ ������� ����[ya] ������� �[ya]���[ya]�� [P].")
					to_chat(H, message)
				else
					P.moan()
			playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)
			H.do_fucking_animation(P)

/* JERK */

		if("jerk")
			if (P != H)
				message = pick("����������� ���������� [P] ���������-��������������� �������[ya]��.", "������ ����� [P] � ������� �����.", "�������� ������� ���� [P] ����������.", "����������� [P] ��������.", "������ ���� [P], �������� ��� � ������� �� ���� �������.", "�������� ����������� ����� [P].", "������ [P], �������� ��� ���� �����.", "����������� ���� [P].", "����������� ������� ����� [P] ������� �������.", "������ ������� ����� [P].", "������������ [P].", "������ [P].")
				H.arousal += 10
			else
				message = pick("����������� ���� ���������� ���������-��������������� �������[ya]��.", "������ ���� ����� � ������� �����.", "�������� ������� ���� ���� ����������.", "����������� ���� ��������.", "������ ���� ����, �������� ��� � ������� �� ���� �������.", "�������� ����������� ���� �����.", "������ ����, �������� ���� ���� �����.", "����������� ���� [P.identifying_gender == MALE ? "������" : "�����"] ����.", "����������� ������� ������ ����� ������� �������.", "������ ���� ������� �����.", "������������ ����.", "������ ����.")
			if (H.lastfucked != P || H.lfhole != hole)
				if (P != H)
					message = pick("�[ya]��� ����������� ���� [P] �����.", "���� ���� [P] � ����.", "���� ����� [P] � ���� � �������� ����������� [P].")
				else
					message = pick("�[ya]��� ����������� ���� ���� �����.", "���� ���� ���� � ����.", "���� ���� ����� � ���� � �������� ����������� ����.")
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
				message = pick("���������� [P].", "����� ���� [P].", "����������� ���� [P] [ya]�����.")
				if (prob(35))
					message = pick("������ ����� [P], ������� ����� �� �����������[ya].", "�����������, ������� �����, �� ������[ya] ���� [P] ��� ���.", "������� ���� [P] [ya]������, ����������[ya] ��� �����.", "���������� ���� [P] �� ���� �����.", "��������� ���� [P] ��� ������ ���� � ���.", "�������� [ya]���� ���������� ������� ����� [P].", "���� ������� [P].", "������� ������� ����-�����, ���������[ya] ���� [P].", "��������� ���������� ���� [P].", "������������, ��������� ����������� ������ [P].", "������� ���� [P], ������[ya] ���� ������.")
				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�[ya]��� ����������� ���� [P] ������.", "���������� ������ ���� [P].")
					H.lastfucked = P
					H.lfhole = hole

			if(H.species.get_bodytype() == SPECIES_UNATHI || H.species.get_bodytype() == SPECIES_AKULA || H.species.get_bodytype() == SPECIES_SERGAL || H.species.get_bodytype() == SPECIES_TESHARI || H.species.get_bodytype() == SPECIES_XENOHYBRID)
				message = pick("���������� ���� [P].", "����������� ����� [P] [ya]�����.", "��� ���� [P] � ���� [ya]���.", "������������ ���� [P] ���� � �����, �����[ya]�� �� �������� ��� ������.", "����������� ���� [P] [ya]�����.")
				if (prob(35))
					message = pick("���������� ����� [P], ������� ����� �� �����������[ya].", "�����������, ������� �����, �� ������[ya] ���� [P] �� �����.", "������� ���� [P] [ya]������, ����������[ya] ��� �����.", "���������� ���� [P] �� ���� �����.", "��������� ���� [P] ��� ������ ���� � �����.", "�������� [ya]���� ���������� ������� ����� [P].", "���������� ������� [P].", "������� ������� ����-�����, ���������[ya] ���� [P].", "��������� ���������� ���� [P].", "������������, ��������� ����������� ������ [P].", "������� ���� [P], ������[ya] ���� ������.")
				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� [ya]���� �������[ya] ����� [P].", "���������� ���������� ���� [P].")
					H.lastfucked = P
					H.lfhole = hole

			if(H.species.get_bodytype() == SPECIES_TAJ || H.species.get_bodytype() == SPECIES_VULPKANIN || H.species.get_bodytype() == SPECIES_ZORREN_HIGH || H.species.get_bodytype() == SPECIES_ZORREN_FLAT || H.species.get_bodytype() == SPECIES_XENOCHIMERA)
				message = pick("���������� ���� [P].", "������� ����� [ya]������ ������ ����� [P].", "������������ ���� [P] ���� � �����, �����[ya]�� �� �������� ��� ������.", "����������� ���� [P] [ya]�����.")
				if (prob(35))
					message = pick("���������� ����� [P], ������� ����� �� �����������[ya].", "�����������, ������� �����, �� ������[ya] ���� [P] �� �����.", "������� ���� [P] [ya]������, ����������[ya] ��� �����.", "���������� ���� [P] �� ���� �����.", "��������� ���� [P] ��� ������ ���� � �����.", "�������� [ya]���� ���������� ������� ����� [P].", "���������� ������� [P].", "������� ������� ����-�����, ���������[ya] ���� [P].", "��������� ���������� ���� [P].", "������������, ��������� ����������� ������ [P].", "������� ���� [P], ������[ya] ���� ������.")
				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� [ya]���� �������[ya] ����� [P].", "���������� ���������� ���� [P].")
					H.lastfucked = P
					H.lfhole = hole

			if(H.species.get_bodytype() == SPECIES_VOX || H.species.get_bodytype() == SPECIES_NEVREAN)
				message = pick("���������� ���� [P].", "����������� ����� [P] [ya]�����.", "��� ���� [P] � ���� [ya]���.", "������������ ���� [P] ���� � ������, �����[ya]�� �� �������� ��� ������.", "����������� ���� [P] [ya]�����.")
				if (prob(35))
					message = pick("���������� ����� [P], ������� ����� �� �����������[ya].", "�����������, ������� �����, �� ������[ya] ���� [P] �� �����.", "������� ���� [P] [ya]������, ����������[ya] ��� ������.", "���������� ���� [P] �� ���� �����.", "��������� ���� [P] ��� ������ ���� � ����.", "�������� [ya]���� ���������� ������� ����� [P].", " ���������� ������� [P].", "������� ������� ����-�����, ���������[ya] ���� [P].", "��������� ���������� ���� [P].", "������������, ��������� ����������� ������ [P].", "������� ���� [P] [ya]�����.")
				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� [ya]���� �������[ya] ����� [P].", "���������� ���������� ���� [P].")
					H.lastfucked = P
					H.lfhole = hole

			if(H.species.get_bodytype() == SPECIES_PROMETHEAN)
				message = pick("���������� [P].", "����� ���� [P].", "����������� ���� [P] [ya]�����.")
				if (prob(35))
					message = pick("������ ������ ����� [P], ������� ����� �� �����������[ya].", "�����������, ������� �����, �� ������[ya] ���� [P] ��� ���.", "������� ���� [P] [ya]������, �������[ya] ��� �[ya]���� ������.", "���������� ���� [P] �� ���� �����, ������[ya][ya] ���� �� �����.", "��������� ���� [P] ��� ������ ���� � ���.", "�������� [ya]���� ���������� ������� ����� [P].", "��������� ������ ����� [P] ������ ������ � ����� ���� ��� � ���.", "����� ������� [P].", "������� ������� ����-�����, ���������[ya] ���� [P].", "��������� ���������� ���� [P].", "������������, ��������� ����������� ������ [P].", "������� ���� [P], ������[ya] ���� ������.")
				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�[ya]��� ����������� ���� [P] ������, ����������[ya] ��� ������.", "���������� ������ ���� [P].")
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
				H.visible_message("<B>[H]</B> [pick("������[ya] ������������ <B>[P]</B>", "���������[ya]", "�������[ya] � ������� ������")].")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> [pick("������[ya] ������������ <B>[P]</B>", "���������[ya]", "�������[ya] � ������� ������")].")


/*  VAGINAL */

		if("vaginal")

			message = pick("������� [P].", "������� [P].", "������ [P].")
			if (prob(35))
				message = pick("����� ������� [P].", "�������[ya] ��������� ����� � [P].", "������ ��������� ����������[ya] ������ [P].", "�������[ya] ������ [P].", "������� �����, ��������[ya] ���� � [P].", "������, ��������[ya]�� �� [P].", "������ ����������[ya] ����� � [P].", "���������� [P] �� ���� ����.", "���������� ����� [P].")
				playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("��������� ���� ���� �� ����� [ya]��� � [P].", "������ ���� ����� ����� � ���� [P].", "��������� ���� ������ ������ ������ [P].", "��������� � [P].")
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
					message = pick("�� ����������, ��� ����������� ����� [P] �������� ����� ����������[ya] ������ ������ �����������.", "�� ����������, ��� ��������� ������ [P] ������ ������� ��� ����[ya]����� ����.", "�� ����������, ��� ������[ya] ����� [P] ����� ������� ��� ���� ������ ���[ya].", "�� ����������, ��� ������ ������� ���������[ya] ����� ������ ���[ya]��� ������� [P].", "�� ����������, ��� ����� ������ ������[ya]������ ������ [P] ������ ��������[ya] ��������� ���, ��������[ya] ��� � �������.")
					to_chat(H, message)
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)

/* ANAL */

		if("anal")

			message = pick("������ [P] � ����.", "������� ������� [P].", "������� [P] � ����.", "������� [P] � ��[ya]��� �����", "������� [P] � �������� ���������")
			if (prob(35))
				if(P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_SKRELL || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_SERGAL || P.species.get_bodytype() == SPECIES_NEVREAN || P.species.get_bodytype() == SPECIES_PROTEAN || P.species.get_bodytype() == SPECIES_ALRAUNE)
					message = pick("������� [P] � �������.", "������� [P] � ��[ya]��� �����", "��������� ���� � �������� ������ [P] �� ����� [ya]���.", "����� ����� � ����� [P].", "��������� [P] ���� �������� ������[ya]��.", "��������� ������ ������� � ����� [P].")
				if(P.species.get_bodytype() == SPECIES_TAJ || P.species.get_bodytype() == SPECIES_XENOCHIMERA || P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT)
					message = pick("������� [P] ��� �������� �����.", "���������� ������� [P] ��� �������� �����", "������� �������� ������� [P]", "������� [P] � ��[ya]��� �����", "��������� ���� [P] � �������� ������ ��� ������� �� ����� [ya]���.", "������ [P] ��� �������� �������.", "����� ����� � ����� [P].", "��������� �������� ���� [P] �������� ������[ya]��.", "��������� ������ ������� � ����� [P].")
				if(P.species.get_bodytype() == SPECIES_UNATHI || P.species.get_bodytype() == SPECIES_XENOHYBRID)
					message = pick("������� [P] ��� �����.", "���������� ������� [P] ��� �����", "������� [P] � ��[ya]��� �����", "��������� ���� � �������� ������ ��� ������� [P] �� ����� [ya]���.", "������ [P] ��� �������.", "����� ����� � ����� [P].", "��������� ���� [P] �������� ������[ya]��.", "��������� ������ ������� � ����� [P].")
				if(P.species.get_bodytype() == SPECIES_TESHARI || P.species.get_bodytype() == SPECIES_VOX)
					message = pick("������� [P] � ������.", "��������� ���� � ������ [P] �� ����� [ya]���.", "����� ����� � ����� [P].", "��������� ������ [P] �������� ������[ya]��.", "��������� ������ ������� � ����� [P].")
				if(P.species.get_bodytype() == SPECIES_PROMETHEAN)
					message = pick("������� [P] � �������� �������.", "��������� ���� � ��� [P] �� ����� [ya]���, �[ya]��[ya]�� � �[ya]���� �����.", "��c�[ya]������ ����� [P] �������� ������[ya]��.")
					playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("����������� ��������� �������� ��������� [P].", "��������� ���� [P] � ����.", "��������� � ���� [P]")
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

			message = pick("������� [P], ��������[ya] ���� ���� [P.identifying_gender == FEMALE ? "��" : "���"] � ������.", "������� ������� [P].")
			if (prob(35))
				if(P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_PROTEAN || P.species.get_bodytype() == SPECIES_SKRELL || P.species.get_bodytype() == SPECIES_ALRAUNE)
					message = pick("��������[ya] �� ����� [P], ����������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] � ��������[ya] ���� �� ������� � ������� [P.identifying_gender==FEMALE ? "��" : "���"] � ������.", "������� [P] � ���.", "���������� ������ [P] �� ���� ����.", "������ [P] �� ������ ����[ya] ������ � ��������� �������[ya] �����.", "��� �������� [P], ��������[ya] ����� ������ � ���.", "��� �������� [P], ��������[ya] ����� [P.identifying_gender == FEMALE ? "�������" : "����[ya]"] � ���.", "��������� ���������[ya] ������� [P].", ", ���� ������ ����, ���[ya]������ ������ [P] �� ������ ������.", "������� �������� ������ [P].", ", ���������� ���������, ������ ������ ���� ��� [P], ������[ya] ������ [P.identifying_gender == FEMALE ? "��" : "���"] �� ����.")
				if(P.species.get_bodytype() == SPECIES_UNATHI || P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_SERGAL || P.species.get_bodytype() == SPECIES_TESHARI || P.species.get_bodytype() == SPECIES_XENOHYBRID)
					message = pick("��������[ya] �� ����� [P], ����������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] � ��������[ya] ���� �� ������� � ������� [P.identifying_gender==FEMALE ? "��" : "���"] � ������.", "������� [P] � �������� �����.", "���������� ������ [P] �� ���� ����.", "������ [P] �� ������ ����[ya] ������ � ��������� �������[ya] �����.", "��� �������� [P], ��������[ya] ����� [P.identifying_gender == FEMALE ? "������ [ya]�����" : "������� [ya]����"] � �����.", "��������� ���������[ya] ������� [P].", ", ���� ������ ����, ���[ya]������ ������ [P] �� ������ ������.", "������� �������� ������ [P].", ", ���������� ���������, ������ ������ ���� ��� [P], ������[ya] ������ [P.identifying_gender == FEMALE ? "��" : "���"] �� ���� � ������ �� ��������� ��������.")
				if(P.species.get_bodytype() == SPECIES_TAJ || P.species.get_bodytype() == SPECIES_XENOCHIMERA)
					message = pick("��������[ya] �� �������� ����� [P], ����������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] � ��������[ya] ���� �� ������� � ������� [P.identifying_gender==FEMALE ? "��" : "���"] � ������.", "������� [P] � �������� �����.", "���������� ������ [P] �� ���� ����.", "������ [P] �� ������ ����[ya] ������ � ��������� �������[ya] �����.", "��� �������� [P], ��������[ya] ����� [P.identifying_gender == FEMALE ? "������ �������" : "������� ������"] � �����.", "��������� ���������[ya] ������� [P].", ", ���� ������ ����, ���[ya]������ ������ [P] �� ������ ������.", "������� �������� ������ [P].", ", ���������� ���������, ������ ������ ���� ��� [P], ������[ya] ������ [P.identifying_gender == FEMALE ? "��" : "���"] �� ���� � ������ �� ������������[ya] ������.")
				if(P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT)
					message = pick("��������[ya] �� �������� ����� [P], ����������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] � ��������[ya] ���� �� ������� � ������� [P.identifying_gender==FEMALE ? "��" : "���"] � ������.", "������� [P] � �������� �����.", "���������� ������ [P] �� ���� ����.", "������ [P] �� ������ ����[ya] ������ � ��������� �������[ya] �����.", "��� �������� [P], ��������[ya] ����� [P.identifying_gender == FEMALE ? "������ �������" : "������� �����"] � �����.", "��������� ���������[ya] ������� [P].", ", ���� ������ ����, ���[ya]������ ������ [P] �� ������ ������.", "������� �������� ������ [P].", ", ���������� ���������, ������ ������ ���� ��� [P], ������[ya] ������ [P.identifying_gender == FEMALE ? "��" : "���"] �� ���� � ������ �� ������������[ya] ������.")
				if(P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN)
					message = pick("��������[ya] �� ����� [P], ����������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] � ��������[ya] ���� �� ������� � ������� [P.identifying_gender==FEMALE ? "��" : "���"] � ������.", "������� [P] ��[ya]�� � ����.", "���������� ������ [P] �� ���� ����, �����[ya]�� �� ���������[ya] � ������� �� �����.", "������ [P] �� ������ ����[ya] ������ � ��������� �������[ya] �����.", "������� ����[ya] �� ������ [P], ��������[ya] ����� ������ ������ � ���.", "��������� ���������[ya] ������� [P].", ", ���� ������ ����, ���[ya]������ ������ [P] �� ������ ������.", "������� �������� ������ [P].", ", ���������� ���������, ������ ������ ���� ��� [P], ������[ya] ������ [P.identifying_gender == FEMALE ? "��" : "���"] �� ���� � ������ �� ��������� ��������.")
				if(P.species.get_bodytype() == SPECIES_PROMETHEAN)
					message = pick("��������[ya] �� ������������ ����� [P], ����������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] � ��������[ya] ���� �� ������� � ������� [P.identifying_gender==FEMALE ? "��" : "���"] � ������.", "������� [P] � ���, ���[ya]����[ya] ���� ���� � ������ �����.", "���������� ������ [P] �� ���� ����.", "������ [P] �� ������ ����[ya] ������ � ��������� �������[ya] �����.", "���������� ����� [P.identifying_gender == FEMALE ? "������ �����������" : "������� �����[ya]"] � ���.", "��������� ���������[ya] ������� [P].", ", ���������� ���������, ������ ������ ���� ��� [P] � ������ �� ��������� ��������.", "������� �������� ������ [P].")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("������������ ������������ ���� ���� [P] � ������.")
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
				retaliation_message = pick("������ ������ ���� [H].", "������� ������ ���� [H], ���� �� �������� ���� �����.", "������ ������� ��-��� ����� [H], ����[ya] ������������� ����.", "��� ���� ��� �������[ya] ��������[ya] ��-��� ��� [H].")
				H.visible_message("<font color=red>[P] [retaliation_message]</font>")
				if (prob(5))
					H.apply_damage(20, BRUTE, BP_GROIN)
					blood_splatter(src,H,1)
					retaliation_message = pick("������� ������ ���� [H], � ����� �������� ���, �����[ya]�� � �����!", "����������� ���� [H] � �� ���������, ���� �� �� ���������[ya]!", "���������� ���� ������� ��������� � �������� ��������[ya]!")
					H.visible_message("<font color=red><b>[P] [retaliation_message]</font></b>")
					H.potenzia = -1

/*
MOUNT REWORKED - �������� ������� ������� �� �������������� ��� ���� � ������, �������� � ����� ���� ��� ���� - � �������� ��� ���������.

������: ����� ������� �������, ������� �������� �� ��������� �� ������ �������� �� ���� ���� ���������� �������, �� � � ����������� �� ���� ���� ����������.
��� � �������, ��� ����� ���������� ��������� ������� �������������� ��� ��� ������ �� ���������: ��_��������, ��������, ��������, �������������/����-���.
�� � ��������� ��� �������� � ���� ���� � �������� ��� � ������� ���-�� ������� ���� ���� �� ����, � ����� ���� ������ - ��� �������.

��, ������ �����, ���� �� �� ������.

 UPD: � �������� ����� ���� �� ������ ����������, ������������ "���������" ���� � ������� ������������� ���������...
...� ������� ���� �� �������� �� ��������� ������/�����/������/��� � � ����������� �� ����� ����������� �� ������ �����-��������.
 */

		if ("mount")

			if(P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_SKRELL || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_SERGAL || P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN || P.species.get_bodytype() == SPECIES_XENOHYBRID || P.species.get_bodytype() == SPECIES_ALRAUNE || P.species.get_bodytype() == SPECIES_TESHARI)
				message = pick("��������� ������ �� ����� [P]", "������� �� ����������� [P]", "�����������[ya] �� [P]", "��������[ya] � [P]", "������� �� ����������� [P], �����[ya] ����� ���������")
				if (prob(35))
					message = pick("����[ya]�� ��������� [P] � ��� ��������� �� ����� [ya]���", "������ �� ������ [P], �������[ya] ��� � ��� ����", "�����������[ya] �������� �� ����� [P], ����[ya] ��� � ���[ya] �� �����", "������� �� ����������� [P], �����[ya] ����� ���������", "������ �� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���� ����", "������� �� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ����", "������ �� �����, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������ ���[ya]", "������� ����� ��-�����, ���[ya] �� ����������� [P], �����[ya] ��� �������� ���������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������������ ������", "����������� ���� �� ������ [P], ���[ya] �� ���� ����� �����", "��������[ya] �����-����, ���[ya] �� ������� [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ���������[ya] �� ����� [P]", "������ ���� [P] � ���� �����, �������[ya][ya] ��� �����", "�������[ya]�� ���� [P] � ���� ������� �����", "���������� ������ ����� [P] � ���� ������ �������", "��������� ������� [P] � ��� ����")
					H.lastfucked = P
					H.lfhole = hole


			if(P.species.get_bodytype() == SPECIES_TAJ || P.species.get_bodytype() == SPECIES_XENOCHIMERA)
				message = pick("��������� ������ �� �������� ����� [P]", "������� �� ����������� [P]", "�����������[ya] �� [P]", "��������[ya] � [P]", "������� �� �������� ������ ����������� [P]")
				if (prob(35))
					message = pick("�����������[ya] �������� �� �������� ����� [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���[ya] �� �����", "����[ya]�� �������� ��������� [P] � ���[ya] �� ����� [ya]���", "������ �� �������� �������� ������ [P], �������[ya] ��� � ���[ya]", "������ �� �������� ����� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ��� ����", "������ �� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ����", "������ �� �������� ������ �����, �������[ya][ya] ������������ ���� � [P]", "�����������[ya] �������� �� �������� ����� [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���[ya] �� �����", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] �������� ���� ������ ���[ya]", "������� ����� ��-�����, ���[ya] �� �������� ����������� [P], �����[ya] ��� �������� ���������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ������������ ������", "����������� ���� �� ������ [P], ���[ya] �� ���� ����� �����", "��������[ya] �����-����, ���[ya] �� �������� ������� [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ���������[ya] �� �������� ����� [P]", "������ �������� ������ ����� [P] � ���� �����, �������[ya][ya] ��� �����", "�������[ya]�� �������� ���� [P] � ���� ������� �����", "����� �������[ya]�� ���� [P] � ��� ���������", "���������� ������ �������� ����� [P] � ���� ������ �����", "��������� ��������� ������� [P] � ��� ����")
					H.lastfucked = P
					H.lfhole = hole


			if(P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT)
				message = pick("��������� ������ �� ��������� ����� [P]", "������� �� ����������� [P]", "��������[ya] � [P]", "������� ���� [P] ������ ���������", "������ �� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���[ya] �� ����")
				if (prob(35))
					message = pick("�����������[ya] �������� �� ��������� ����� [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���[ya] �� �����", "�����������[ya] �� ���� [P]", "����[ya]�� ��������� ��������� [P] � ���[ya] �� ����� [ya]���", "������� �� ��������� ����������� [P], ���� ����� ���������", "������ �� ��������� ����� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ��� ����", "�����������[ya] �� ����� [P] ��������, ����[ya] ��� � ���[ya] �� ����", "�����������[ya] �� ��������� ��������� [P] �� ����� [ya]���", "������ �� ������ [P], ���[ya] �������� ������ �� ����", "������� �� [P], ����[ya]�� [P.identifying_gender==FEMALE ? "�" : "���"] ���� ��������", "������, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������ ���[ya]", "������� ����� ��-�����, ���[ya] �� ��������� ����������� [P], �����[ya] ��� �������� ���������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������������ ������", "�����������[ya] �� ����[P], ���[ya] �� ���� ������", "��������[ya] �����-����, ���[ya] �� ����� [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ���������[ya] �� ��������� ����� [P], ����[ya] ��� ������", "������ ��������� ����� [P] � ���� �����, �������[ya][ya] ��� �����", "�������[ya]�� ��������� ���� [P] � ���� ������� �����", "����� �������[ya]�� ���� [P] � ��� ���������", "��������� ������ ����� [P] � ��� �����", "��������� ���������� ������� [P] � ��� ����")
					H.lastfucked = P
					H.lfhole = hole


			if(P.species.get_bodytype() == SPECIES_UNATHI)
				message = pick("��������� ������ �� ����� [P]", "������� ���� [P], ������ ���������", "�����������[ya] �� [P]", "��������[ya] � [P]", "���������[ya] �����-���� �� ����� �� ������ [P]", "������ �� ������� [P]")
				if (prob(35))
					message = pick("�����������[ya] �������� �� ����� [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���[ya] �� �����", "��������� �����������[ya] �� ����� [P]", "������ �� ����� ��������� [P] �����, �������[ya] �� � ���� ����� �� �����", "�����������[ya] �������� �� ���������� [P] �� ����� [ya]���", "������ �� ����� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ��� ����", "������[ya] �� [P], �������[ya] ��� ����� � ���[ya] �� ����� � ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ����", "������ �� �����, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������ ���[ya]", "������� ����� ��-�����, ���[ya] �� ����������� [P], �����[ya] ��� �������� ���������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������������ ������", "����������� ���� �� ������ [P], ���[ya] �� ���� ����� �����", "��������[ya] �����-����, ���[ya] �� ������� ����� [P]", "�����������[ya] �� ���� [P], ���[ya] �� ���� ������")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ���������[ya] �� ���� �� ������� [P]", "������ ���� �� ������� [P] � ���� �����, �������[ya][ya] ��� �����", "�������[ya]�� ���� [P] � ���� ������� �����", "����� �������[ya]�� ���� �� ������ [P] � ��� ���������", "��������� ������ ����� [P] � ��� �����", "��������� ������ �� �������� [P] � ��� ����")
					H.lastfucked = P
					H.lfhole = hole


			if(P.species.get_bodytype() == SPECIES_PROMETHEAN)
				message = pick("������� �������� ���� [P], ������ ���������", "�����������[ya] ����� �������� ����� �� ���������� ���������� [P], �����[ya] ���", "�����������[ya] �� �������� ���� [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���[ya]")
				if (prob(35))
					message = pick("�����������[ya] �� �������� ��������� [P] �� ����� [ya]���", "��������� ������ �� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] �������� ����� � ����[ya]", "������ �� ������ [P], �������[ya] ��� � ���[ya]", "������� �� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ����", "������ �� �����, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������ ���[ya]", "������� ����� ��-�����, ���[ya] �� ����������� [P], �����[ya] ��� ����� ������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� ����� ������", "�����������[ya] �� ����� [P], ���[ya] �� ���� ����� ������", "��������[ya] �����-����, ���[ya] �� �������� ������� [P]", "�����������[ya] �� �������� ���� [P], ���[ya] �� ���� ������")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ���������[ya] �� �������� ������� ����� [P]", "������ ������ �������� ����� [P] ������ ���[ya]", "������ ����� [P] � ��� �����", "��������� ��������� ������� [P] � ���[ya]", "�������[ya]�� �������� �������� [P] � ���� ������� �����")
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
				message = pick("�� ����������, ��� ����������� ����� [H] �������� ����� ����������[ya] ������ ������ �����������.", "�� ����������, ��� ��������� ������ [H] ������ ������� ��� ����[ya]����� ����.", "�� ����������, ��� ������[ya] ����� [H] ����� ������� ��� ���� ������ ���[ya].", "�� ����������, ��� ������ ������� ���������[ya] ����� ������ ���[ya]��� ������� [H].", "�� ����������, ��� ����� ������ ������[ya]������ ������ [H] ������ ��������[ya] ��������� ���, ��������[ya] ��� � �������.")
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

			message = pick("������ �� ����� [P]", "������� �� ����������� [P]", "�����������[ya] �� [P]")
			if (prob(35))
				message = pick("������� ���� [P], ������ ���������", "������ �� ������ [P]", "������� �� [P], ����[ya][ya]�� � ��� ����", "�������� ������������, �������[ya][ya] ������������ ���� � [P]", "�������� ����� � [P] � ������, ����� ��� ���� ������", "������� ����� ��-�����, ���[ya] �� ����������� [P]", "���������� �����������[ya] �� [P], ��[ya]� ������ ��� ����", "����������� ��� ���� �� ������ [P], ���[ya] �� ���� ����� �����", "�������� ������ ���[ya] ������� [P]")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("��������� �����������[ya] �� ������� ����� [P]", "�������[ya]�� ���� [P] � ���� ������� �����, ������[ya] ���� �����", "�������� ������ � ���[ya] ����� [P]")
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
				message = pick("�� ����������, ��� ����������� ����� [H] �������� ����� ����������[ya] ������ ������ �����������.", "�� ����������, ��� ��������� ������ [H] ������ ������� ��� ����[ya]����� ����.", "�� ����������, ��� ������[ya] ����� [H] ����� ������� ��� ���� ������ ���[ya].", "�� ����������, ��� ������ ������� ���������[ya] ����� ������ ���[ya]��� ������� [H].", "�� ����������, ��� ����� ������ ������[ya]������ ������ [H] ������ ��������[ya] ��������� ���, ��������[ya] ��� � �������.")
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

			message = pick("����[ya] � ���� [P]", "����[ya] �� ���������� [P]", "����������� ���� [P] ����� ������")
			if (prob(35))
				message = pick("������ �������� ������ �� ����� [P] � ���� ���������", "�������� ������ [P], ������ ���������� �����", "� ���������� ����� ��������� �������, ������[ya] ������ � ���� [P]", "������� ������� �����, �������� � ������ [P.identifying_gender==FEMALE ? "��������" : "�������"], �������[ya][ya] ������������ ���� � [P]", "�������� ����� � [P] � ������", "������� ����� ��-�����, ������� ���������[ya] ���������� [P]", "����� �������� ����� [P] ����� ������� ���, ������[ya] ���� �����", "����[ya] � ������ [P] �� �����, ���[ya] �� �� ����� �����", "����������� ������ � ������� [P]")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("��������� ������[ya] ������������ �� ������� �����, �������[ya] ��� � ������ [P]", "������������ ���� [P] ����� � ��������� � ������ [P.identifying_gender==FEMALE ? "��������" : "�������"], ����� ���� ������[ya] ������� �������� �� �����", "�������� ������[ya] �� [P] � �������� [P.identifying_gender==FEMALE ? "�" : "���"] ���� ����� ����� ������� ���")
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

			message = pick("����[ya] ����� ������ � ������� ���� [P]", "����������� ������ �� ������ [P]", "����[ya] � ����� [P]", "������� [P], �������[ya][ya] �� ����� �������[ya] ���� � �����")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("��������� ���� ����� � ����� [P]")
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

	//P.Basics + others and humans

			if((P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_SKRELL || P.species.get_bodytype() == SPECIES_TESHARI || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_SERGAL || P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN || P.species.get_bodytype() == SPECIES_XENOHYBRID || P.species.get_bodytype() == SPECIES_ALRAUNE) && (H.species.get_bodytype() != SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_PROMETHEAN))
				message = pick("������� ���[ya] � ��� ������� [P], ��������[ya]�� �� ����", "���������� ������� ���[ya] ������ [P]", "������� ����� �� ����������� [P], ���� �������� �������", "�����������[ya] ������ �� ����� [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ��[ya]��� �����")
				if (prob(35))
					message = pick("����[ya]�� ��������� [P] � ���� ��� �� ����� [ya]���", "��������� ������ �� ����� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���� ���", "������ �� ������ [P], �������[ya] ��� � ���� �����", "������� �� ����� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ����", "������ �� �����, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������ ���[ya]", "������� ����� ��-�����, ���[ya] ����� �� ����������� [P], �����[ya] ��� ������", "���������� �����������[ya] �� [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� � ��[ya]��� ����� �� �����", "�����������[ya] �� ����� [P], ���[ya] �� ���� ����� �����", "��������[ya] �����-����, ���[ya] ����� �� ������� [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ������[ya] �������� ������� �� �������� [P], ����[ya] � ������", "��������� ������ ������� ������ [P] � ���� ������ ������", "�������[ya]�� ������� ����� [P] � ���� ����, ������[ya] ���� �����", "��������� ������ ������� ������ [P] � ���� ��[ya]��� �����", "��������� ������� [P] � ���� �����", "��������� ������� [P] � ���� ��[ya]��� �����", "��������� ������ [P] � ���� �����")
					H.lastfucked = P
					H.lfhole = hole


	//P.Basics + taj

			if((P.species.get_bodytype() == SPECIES_TAJ || P.species.get_bodytype() == SPECIES_XENOCHIMERA) && (H.species.get_bodytype() != SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_PROMETHEAN))
				message = pick("��������� ������ �� �������� ����� [P], �������[ya] ��� ����� � ���� ���", "���������� ������� ���[ya] �������� ������ [P]", "������� ����� �� ���������� ����������� [P], ���� �������� �������")
				if (prob(35))
					message = pick("�����������[ya] ������ �� �������� ����� [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ��[ya]��� ����� �� �����", "����[ya]�� �������� ��������� [P] � ���� ��� �� ����� [ya]���", "������ �� �������� �������� ������ [P], �������[ya] ��� � ���[ya]", "������ �� ����� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ����", "������ �������� �� �������� ������ �����, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] �������� ������ ����� ������ ���[ya]", "������� ����� ��-�����, ���[ya] ����� �� �������� ����������� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� �������� ��[ya]��� �����", "���������� �����������[ya] �� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] �������� ������ ���� � ��[ya]��� ����� �� �����", "�����������[ya] �� �������� ����� [P], ���[ya] �� ���� ����� �����", "��������[ya] �����-����, ���[ya] ����� �� �������� ������� [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ������[ya] ������ �� ������� ��������� �������� [P], ����[ya] � ������", "��������� ������ �������� �������� ������� [P] � ���� ������ ������", "�������[ya]�� �������� ������� ����� [P] � ���� ����, ������[ya] ���� �����", "��������� ������ �������� ����� [P] � ���� ��[ya]��� �����", "��������� ��������� ������� [P] � ���� �����", "��������� ��������� ������� [P] � ���� ��[ya]��� �����", "��������� �������� ������ [P] � ���� �����")
					H.lastfucked = P
					H.lfhole = hole

	//P.Basics + vulps

			if(P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT && H.species.get_bodytype() != SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_PROMETHEAN)
				message = pick("������� ���[ya] � ��� ������� [P], ��������[ya]�� �� ����", "���������� ������� ���[ya] ��������� ������ [P]", "��������� ������ �� ����� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���� ��� �� ����", "������� �� ��������� ����������� [P], ���� �������� �������", "�����������[ya] ������ �� ����� [P], ����[ya] ��� � ��[ya]��� �����")
				if (prob(35))
					message = pick("������ �� ������ [P], �������[ya] ��� � ���� ��� � ���[ya] ������� �������� �� ����", "������ �� ��������� ����� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ����", "������� �� ����� [P], ����[ya]�� [P.identifying_gender==FEMALE ? "�" : "���"] ���� ����������", "������, �������[ya][ya] ������������ ���� � [P]", "������� ����� ��-�����, ���[ya] ����� �� ����������� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� �������� ��[ya]��� �����", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� ��[ya]��� ������", "������[ya] �� ���� [P], ���[ya] �� ���� ����� �����", "��������[ya] �����-����, ���[ya] ����� �������� ������� [P]")
				else if (prob(10))
					message = pick("�����������[ya] �������� �� �������������[ya] ����� ��������� [P] �� ����� [ya]���", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������ ���[ya]", "�����������[ya] �� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ��������� ���� � ��[ya]��� ����� �� �����",)

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ������[ya] ������ �� ������ ���������� �������� [P], ����[ya] ��� ������", "��������� ������ ������ ���������� ������ [P] � ���� ������ ������", "�������[ya]�� ��������� ���� [P] � ���� ����, ������[ya] ���� �����", "��������� ������ ����� [P] � ���� ��[ya]��� ����� �� ����", "��������� ���������� ������� [P] � ���� �����", "��������� ���������� ������� [P] � ���� ��[ya]��� �����", "��������� ���������� ������ [P] � ���� �����")
					H.lastfucked = P
					H.lfhole = hole

	//P.Basics + unathi ------- ������� �������� � ������ �� 1 � 2 �����

			if(P.species.get_bodytype() == SPECIES_UNATHI && H.species.get_bodytype() != SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_PROMETHEAN)
				message = pick("������� ���[ya] � ��� ������� [P], ��������[ya]�� �� ����", "���������� ������� ���[ya] ����� �� ������ [P]", "��������� ������ �� ����� �� ������ [P], �������[ya] ��� � ���� ���, �������[ya][ya] ������ �������[ya] � [H.identifying_gender==FEMALE ? "� ������ ��� [ya]�����" : "��� ������ ��� [ya]�����"]", "������ �� ����� �� ������ [P], �������[ya] ��� � ���� ���, �������[ya][ya] ������ �������[ya] � [H.gender==FEMALE ? "���� �����" : "���� [ya]����"]", "�������� ����� �����-���� �� ����� �� ������ [P], ���� �������� �������", "������ �� ������ [P], �������[ya] ��� � ���� ���")
				if (prob(35))
					message = pick("��������� �����������[ya] �������� ���������� �� ����� [P], ����[ya] �� � ��[ya]��� �����", "������� �� [P],", "������ �� �����, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������ ���[ya]", "������� ����� ��-�����, ���[ya] ����� �� ����������� [P], �����[ya] ��� ������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� �������� ��[ya]��� �����", "�����������[ya] �� ����� [P], ���[ya] �� ���� ����� �����", "��������[ya] �����-����, ���[ya] �������[ya] ������� ���� [P] � ���� �����")
				else if (prob(10))
					message = pick("�����������[ya] �������� ���������� �� ������ [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ������ � ����� �� �����", "������ �� ����� ��������� [P], �������[ya] �� � ���� ��� �� �����", "�����������[ya] �� ���������� [P] �������� �� ����� [ya]���", "�������� ������� �� ����� ��������� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ���� �����", "�������[ya] ��� ����� � ��[ya]��� ����� � ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ����", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ����� ������ ��[ya]��� �����", "�����������[ya] ������ �� ������ [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ������ � ���[ya] �� �����")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ������[ya] ������ �� ������ �� ��������� [P], ����[ya] ��� ������", "��������� ������ ����� [P] � ���� ������ ������", "�������[ya]�� ���� �� ������ [P] � ���� ����, ������[ya] ���� �����", "��������� ������ ����� [P] � ���� ��[ya]��� �����", "��������� ������ �� �������� [P] � ���� �����", "��������� ������ �� �������� [P] � ���� ��[ya]��� �����",  "��������� ���[ya] [P] � ���� �����")
					H.lastfucked = P
					H.lfhole = hole



//Teshari

	//P.Teshari + basics
			if(P.species.get_bodytype() == SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_PROMETHEAN)
				message = pick("������� ���[ya] � ���, ��������[ya]�� �� ����� [P]", "������� ����� �� ����������� [P], ���� �������� �������", "���������� ������� ���[ya] ������ [P]")
				if (prob(35))
					message = pick("�����������[ya] �������� ���������� �� ���� [P]", "��������� ������ �� ����� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���� ���", "������ �� ������ [P], �������[ya] ��� � ���� ����", "������� �� ����� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ���� �����", "������ �� �����, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������ ��[ya]��� �����", "���������� ������� ����� ��-�����, ���[ya] ����� �� ����������� [P], �����[ya] ��� ������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� �������� ��[ya]��� �����", "�����������[ya] �������� �������� �� ����� [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ��[ya]��� ����� �� �����", "��������[ya] �����-����, ���[ya] �� ������� [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ������[ya] ������ �� �������� [P], ����[ya] ��� ������", "��������� ������ ����� [P] � ���� ������ ������", "�������[ya]�� ���� [P] � ���� ����, ������[ya] ���� �����", "��������� ������ ����� [P] � ���� ��[ya]��� �����", "��������� ������� [P] � ���� �����", "��������� ������� [P] � ���� ��[ya]��� �����", "��������� ������ [P] � ���� �����")
					H.lastfucked = P
					H.lfhole = hole

	//H.Teshari + humans or tesharis
			if((H.species.get_bodytype() == SPECIES_TESHARI) && (P.species.get_bodytype() == SPECIES_TESHARI || P.species.get_bodytype() == SPECIES_SKRELL || P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_PROTEAN || P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_SERGAL || P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN || P.species.get_bodytype() == SPECIES_ALRAUNE))
				message = pick("������� ���[ya], ��������[ya]�� ������� �� ����� [P]", "������� ����� �� ����������� [P], ���� ������")
				if (prob(35))
					message = pick("�����������[ya] ���������� ������ �� ���� [P]", "��������� ������ �� ����� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���� ������", "������� �� ����� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ���� �����", "������ �� �����, �������[ya][ya] ������������ ���� � [P]", "���������� ������� ����� ��-�����, ���[ya] ����� �� ����������� [P], �����[ya] ��� ����� ������", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������ ������", "���������� ������� ���[ya] ������ [P]", "��������[ya] �����-����, ���[ya] �� ������� [P]", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� �������� ������", "�����������[ya] �������� ������ �� ����� [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ����� �� �����")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ������[ya] ������� �� ������� �������� [P], ����[ya] � ������", "��������� ������ ��������� ������ [P] � ���� ������", "�������[ya]�� ���� [P] � ���� ������, ������[ya] ���� �����", "��������� ������ ������ ������ [P] � ���� ������", "��������� ������ ������� [P] � ���� ������", "��������� ������ [P] � ���� �����")
					H.lastfucked = P
					H.lfhole = hole

	//H.Teshari + tajara
			if((H.species.get_bodytype() == SPECIES_TESHARI) && (P.species.get_bodytype() == SPECIES_TAJ || P.species.get_bodytype() == SPECIES_XENOCHIMERA))
				message = pick("������� ���[ya] � ������, ��������[ya]�� �� �������� �������� ����� [P]", "������� ����� �� �������� ����������� [P], ���� ������", "���������� ������� ���[ya] ������ [P]")
				if (prob(35))
					message = pick("�����������[ya] ���������� ������ �� �������� ���� [P]", "��������� ������ �� ����� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���� ������", "������� �� ����� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ���� �����", "������ �� �����, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������ ������", "���������� ������� ����� ��-�����, ���[ya] �� �������� ����������� [P], �����[ya] ��� ����� ������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] �������� ���� �������� ������", "�����������[ya] �������� ������ �� ����� [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ����� �� �����", "��������[ya] �����-����, ���[ya] �� �������� ������ ������� [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ������[ya] ������� �� ������� ��������� ������ �������� [P], ����[ya] � ������", "��������� ������ ��������� ��������� ������ [P] � ���� ������", "�������[ya]�� �������� ���� [P] � ���� ������, ������[ya] ���� �����", "��������� ������ ������ ������ [P] � ���� ������", "��������� ������ ��������� ������� [P] � ���� ������", "��������� ������ [P] � ���� �����")
					H.lastfucked = P
					H.lfhole = hole

	//H.Teshari + unathi ------- ������� �������� � ������ �� 1 � 2 �����.
			if(H.species.get_bodytype() == SPECIES_TESHARI && P.species.get_bodytype() == SPECIES_UNATHI)
				message = pick("������� ���[ya] � ������, ��������[ya]�� �� ����� [P]", "������� ����� �� ����������� [P], ���� ��������� ������", "���������� ������� ���[ya] ������ [P]")
				if (prob(35))
					message = pick("��������� �����������[ya] ������� �� ����� [P], ����[ya] �� � �����","�����������[ya] ������� �� ���� �� ������ [P], ������[ya][ya] ������ �������[ya] � [H.identifying_gender==FEMALE ? "� �����" : "��� �����"]", "�����������[ya] �� ���� �� ������ [P] �������, ������[ya][ya] ������ �������[ya] � [H.identifying_gender==FEMALE ? "� ����������" : "��� ����������"]", "��������� ������ �� ����� �� ��������� [P]", "������ �� ����� �� ������, �������[ya][ya] ������������ ���� � [P]", "���������� ������� ����� ��-�����, ���[ya] ����� �� ����������� [P], �����[ya] ��� ����� ������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� �������", "��������[ya] �����-����, ���[ya] �� ������� [P]")
				else if (prob(15))
					message = pick("�����������[ya] �������� ������ �� ������ [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ������ � ����� �� �����", "�������� ������� �� ����� ��������� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ���� �����", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ����� ������ ������", "�����������[ya] ������� �� ������ [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ������ � ���[ya] �� �����")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ������[ya] ������� �� ������� ������ �� ��������� [P], ����[ya] � ������", "��������� ������ ��������� ������ [P] � ���� ������", "�������[ya]�� ���� [P] � ���� ������, ������[ya] ���� �����", "��������� ������ ������ ������ [P] � ���� ������", "��������� ������ ������� [P] � ���� ������", "��������� ������ [P] � ���� �����")
					H.lastfucked = P
					H.lfhole = hole

	//H.Teshari + vulps
			if((H.species.get_bodytype() == SPECIES_TESHARI) && (P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT))
				message = pick("������� ���[ya] � ������, ��������[ya]�� �� ��������� ����� [P]", "������� ����� �� ��������� ����������� [P], ���� ��������� ������", "���������� ������� ���[ya] ������ [P]")
				if (prob(35))
					message = pick("�����������[ya] ���������� ������ �� ��������� ���� [P]", "������� �� ����� [P], ���������[ya] �� [P.identifying_gender==FEMALE ? "�" : "���"] ���� �������", "������ �� �����, �������[ya][ya] ������������ ���� � [P]", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������", "��������[ya] �����-����, ���[ya] �� ������� [P]")
				else if (prob(15))
					message = pick("[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������ ������", "��������� ������ �� ����� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���� ������ �� ����", "�����������[ya] ������� �� ����� [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ����� �� �����", "���������� ������� ����� ��-�����, ���[ya] �� ��������� ����������� [P], �����[ya] ��� ����� ������")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ������[ya] ������� �� ������ ���������� �������� [P], ����[ya] ��� ������", "��������� ������ ��������� ���������� ������ [P] � ���� ������", "�������[ya]�� ���� [P] � ���� ������, ������[ya] ���� �����", "��������� ������ ������ ���������� ������ [P] � ���� ������", "��������� ������ ���������� ������� [P] � ���� ������", "��������� ���������� ������ [P] � ���� �����")
					H.lastfucked = P
					H.lfhole = hole

	//H.Teshari + prometheans
			if(H.species.get_bodytype() == SPECIES_TESHARI && P.species.get_bodytype() == SPECIES_PROMETHEAN)
				message = pick("������� ���[ya] � ������ �������� ������� [P]", "������� ����� �� �������� ����������� [P], ���� ������", "������ �� �������� ������ [P]", "��������[ya] �����-����, ���[ya] ������� �� ����� [P]", "���������� ��������[ya] � [P]")
				if (prob(35))
					message = pick("����[ya]�� ��������� ��������� [P] � ���� ����� �� ����� [ya]���", "�����������[ya] ��������� ������ �� �������� �������� [P], ����[ya] ��� � ��[ya]��� ����� �� �����", "��������� ������ �� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] �������� ����� � ���� ������", "������� �� ����� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] �������� ����", "������ �� ������������ �����, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] �������� ���� ������ ���[ya]", "������� ����� ��-�����, ���[ya] ����� �� ����������� [P], �����[ya] ��� ������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� �������� ���������", "�����������[ya] �� ����� [P], ���[ya] �� ���� ����� �����")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ������[ya] �� ������ ��������� �������� [P], ����[ya] ��� ������", "��������� ������ �������� ����� [P] � ���� �����", "�������[ya]�� �������� �������� [P] � ���� ������, ������[ya] ���� �����", "��������� ������ ����� [P] � ���� ������", "��������� ������� [P] � ���� rkjfre", "��������� ��������� ������� [P] � ���� ��������", "��������� ������ [P] � ���� �����")
					H.lastfucked = P
					H.lfhole = hole

//Prometheans

	//P.Prometheans + basics

			if((P.species.get_bodytype() == SPECIES_PROMETHEAN) && (H.species.get_bodytype() != SPECIES_PROMETHEAN && H.species.get_bodytype() != SPECIES_TESHARI))
				message = pick("������� ���[ya] � ��� �������� ������� [P]", "��������� ������ �� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] �������� ����� � ���� ���", "������� ����� �� �������� ����������� [P], ���� �������� �������", "���������� ������� ���[ya] �������� ������ [P]")
				if (prob(35))
					message = pick("����[ya]�� ��������� ��������� [P] � ���� ���", "������ �� �������� ������ [P], �������[ya] ��� � ���� ���", "������� �� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] �������� ����", "�����������[ya] �������� ���������� �� �������� �������� [P], ����[ya] ��� � ��[ya]��� ����� �� �����", "������ �� ������������ �����, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] �������� ���� ������ ���[ya]", "������� ����� ��-�����, ���[ya] ����� �� ����������� [P], �����[ya] ��� ������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� ��[ya]��� ������", "�����������[ya] �� ����� [P], ���[ya] �� ���� ����� �����", "��������[ya] �����-����, ���[ya] ����� �� ����� [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ������[ya] �������� �� ������ ��������� �������� [P], ����[ya] ��� ������", "��������� ������ ����� [P] � ���� ������ ������", "�������[ya]�� �������� �������� [P] � ���� ����, ������[ya] ���� �����", "��������� ������ ����� [P] � ���� ��[ya]��� �����", "��������� ��������� ������� [P] � ���� �����", "��������� ������ [P] � ���� �����")
					H.lastfucked = P
					H.lfhole = hole

	//H.Prometheans + basics

			if((H.species.get_bodytype() == SPECIES_PROMETHEAN) && (P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_TESHARI || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_PROTEAN || P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_SERGAL || P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN || P.species.get_bodytype() == SPECIES_ALRAUNE))
				message = pick("��������[ya], ��������[ya]�� �������� ����� �� ����� [P]", "������� �������� ����� �� ����������� [P]", "���������� ������� ������ ���� [P]")
				if (prob(35))
					message = pick("�����������[ya]�������� ����� �� ���� [P]", "��������� �������� �� ����� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ��� ����", "������ �� ������ [P], �������[ya] ��� ������ ���[ya]", "������� �� ����� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ���� �����", "������ �� �����, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������ ��������� ����", "���������� �������� ����� ��-�����, ���[ya] �� ����������� [P], �����[ya] ��� ������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������", "�����������[ya] �� ����� [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���[ya] �� �����", "��������[ya] �����-����, ���[ya] �� ������� [P]")
				else if(prob(2))
					message = pick("�����������[ya] �� ���� [P] �� [ya]��, ������ �������[ya] � ������ [P] ����� ������", "������� � ���[ya] ������� [P], ������ ��������� � ������� ������")
				else if(prob(0.1))
					message = pick("����� ������ �� ���� [P] - ����[ya][ya] ��� � ���[ya] �� ��������[ya] - � ������� �������������� ������ � ������", "����� ���� ������� [P], ������� �������������� � ���� ������")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ������[ya] �������� ����� �� �������� [P], ����[ya] ��� ������", "������������ ����� [P] �����[ya] ��� � ���[ya]", "�������[ya]�� ���� [P] ����� � ��� �������� ����, ����������[ya]", "��������� ������ ����� [P] � ���� �����", "��������� ������� [P] � ��� �������� ����")
					H.lastfucked = P
					H.lfhole = hole


	//H.Prometheans + taj
			if(H.species.get_bodytype() == SPECIES_PROMETHEAN && P.species.get_bodytype() == SPECIES_TAJ)
				message = pick("��������[ya], ��������[ya]�� �������� ����� �� �������� ����� [P]", "������� �������� ����� �� �������� ������ ����������� [P]", "���������� ������� ������ �������� ���� [P]")
				if (prob(35))
					message = pick("�����������[ya]�������� ����� �� �������� ����� [P]", "��������� �������� �� �������� ����� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ��� ����", "������ �� ������ [P], �������[ya] ��� ������ ���[ya]", "������� �� �������� ������ ����� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ���� �����", "������ �� �����, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] �������� ���� ������ ��������� ����", "���������� �������� ����� ��-�����, ���[ya] �� �������� ������ ����������� [P], �����[ya] ��� ������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������", "�����������[ya] �� �������� ������ ����� [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���[ya] �� �����", "��������[ya] �����-����, ���[ya] �� �������� ������� [P]")
				else if(prob(2))
					message = pick("�����������[ya] �� �������� ��������� [P] �� ����� [ya]���, ������ �������[ya] � ������ [P] ����� ������", "������� � ���[ya] ��������� ������� [P], ������ ��������� � ������� ������")
				else if(prob(0.1))
					message = pick("����� ������ �� ���� [P] - ����[ya][ya] ��� � ���[ya] �� ��������[ya] - � ������� �������������� ������ � ������", "����� ���� ��������� ������� [P], ������� �������������� � ���� ������")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ������[ya] �������� ����� �� ��������� �������� [P], ����[ya] ��� ������", "������������ �������� ������ ����� [P], �����[ya] ��� � ���[ya]", "�������[ya]�� ���� [P] ����� � ��� �������� ����, ����������[ya]", "��������� ������ ����� [P] � ���� �����", "��������� ������� [P] � ��� �������� ����")
					H.lastfucked = P
					H.lfhole = hole

	//H.Prometheans + unathi ------- ������� �������� � ������ �� 1 � 2 �����

			if(H.species.get_bodytype() == SPECIES_PROMETHEAN && P.species.get_bodytype() == SPECIES_UNATHI)
				message = pick("��������[ya], ��������[ya]�� �������� ����� �� ���� �� ������ [P]", "������� �������� ����� �� ����������� [P]", "���������� ������� ������ ���� ���� [P]", "������ �� ���� ������ [P] �����")
				//1 dick
				if (prob(35))
					message = pick("��������� �������� �� ����� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ��� ����", "������ �� ������ [P], �������[ya] ��� ������ ���[ya]", "�����[ya] � ����[ya][ya]�� � ���� [P] �������� �� ��� �����", "������ �� ����� �� ���������, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ����� ������ ������ ��������� ����", "���������� �������� ����� ��-�����, ���[ya] �� ����� �� ������������ [P], �����[ya] ��� ������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������", "�����������[ya] �� ����� [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���[ya] �� �����", "��������[ya] �����-����, ���[ya] �� ������� [P]")
				else if(prob(2))
					message = pick("�����������[ya] �� ���� �� ������ [P], ������� ��������� ����� ������ � ��� ������", "������� � ���[ya] ������ ������� [P], ������ ��������� � ������� ������")
				else if(prob(0.1))
					message = pick("����� ������ �� ���� �� ������ [P] - ����[ya][ya] ��� � ���[ya] �� ��������[ya] - � ������� �������������� ������ � ������", "����� ���� ������� [P], ������� �������������� � ���� ������")
				//2 dicks
				else if (prob(35))
					message = pick("�����������[ya]�������� ����� �� ������������ ���� [P]", "��������� �������� �� ������ [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ������ � ��� ����", "������ �� ������� [P], �������[ya] �� ������ ���[ya]", "�����[ya] � ����[ya][ya]�� � ���� [P] �������� �� ��� ������", "������ �� ������, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� ��� [P.identifying_gender==FEMALE ? "�" : "���"] ������ ������ ������ ��������� ����", "���������� �������� ����� ��-�����, ���[ya] �� ������������ [P], �����[ya] �� ������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� ������", "�����������[ya] �� ������ [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ������ � ���[ya] �� �����", "��������[ya] �����-����, ���[ya] �� �������� [P]")
				else if(prob(2))
					message = pick("�����������[ya] �� ��� ���������� [P] �� �����, ����-���� ��������� ������ � ������", "������� � ���[ya] ����� �������� [P], ������ �������[ya] � ������� ������")
				else if(prob(0.1))
					message = pick("����� ������ �� ��� ���������� [P] - ����[ya][ya] �� � ���[ya] �� ��������[ya] - � ������� �������������� ������ � ������", "����� ���� �������� [P], ������� �������������� � ��� ������")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ������[ya] �������� ����� �� �������� [P], ����[ya] ��� ������", "������������ ������ [P], �����[ya] �� � ���[ya]", "�������[ya]�� ����� [P] ����� � ��� �������� ����, ����������[ya]", "��������� ������ ����� [P] � ���� �����", "��������� �������� [P] � ��� �������� ����")
					H.lastfucked = P
					H.lfhole = hole

	//H.Prometheans + vulps

			if((H.species.get_bodytype() == SPECIES_PROMETHEAN) && (P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_FLAT || P.species.get_bodytype() == SPECIES_ZORREN_HIGH))
				message = pick("��������[ya], ��������[ya]�� �������� ����� �� ��������� ����� [P]", "������� �������� ����� �� ��������� ����������� [P]", "���������� ������� ������ ���� ����� [P]")
				if (prob(35))
					message = pick("�����������[ya]�������� ����� �� ��������� ����� [P]", "��������� �������� �� ��������� ����� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ��� ����", "������ �� ������ [P], �������[ya] ��� ������ ���[ya]", "������� �� ��������� ����� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ���� �����", "������ �� �����, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ���[ya]��� ���[ya]����[ya] ���� �� ����", "���������� �������� ����� ��-�����, ���[ya] �� ����������� [P], �����[ya] ��� ���� ������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������", "�����������[ya] �� ����� [P], ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���[ya] �� �����", "��������[ya] �����-����, ���[ya] �� ��������� ������� [P]")
				else if(prob(2))
					message = pick("�����������[ya] �� ��������� ��������� [P] �� ����� [ya]���, ������ ��������� � ������ [P] ����� ������", "������� � ���[ya] ������� [P], ������ �������[ya] � ������� ������")
				else if(prob(0.1))
					message = pick("����� ������ �� ���� �� ������ [P] - ����[ya][ya] ��� � ���[ya] �� ��������[ya] - � ������� �������������� ������ � ������", "����� ���� ���� ������� [P], ������� �������������� � ���� ������")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("������[ya] �������� ����� �� ���������� �������� [P], ����[ya] ��� ������", "������������ ��������� ����� [P], �����[ya] ��� � ���[ya]", "�������[ya]�� ���� [P] ����� � ��� �������� ����, ����������[ya]", "��������� ������ ����� [P] � ���� �����", "��������� ������� [P] � ��� �������� ����")
					H.lastfucked = P
					H.lfhole = hole

	//H.Prometheans + prometheans
			if(H.species.get_bodytype() == SPECIES_PROMETHEAN && P.species.get_bodytype() == SPECIES_PROMETHEAN)
				message = pick("���������� ���������[ya] ������ � [P]", "��������� ������ �� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] �������� ����� � ���� �������� ���", "������� �� �������� ����������� [P], �����[ya]")
				if (prob(35))
					message = pick("����[ya]�� ��������� ��������� [P] � ���� ��� �� ����� [ya]���", "������ �� �������� ������ [P], �������[ya] ��� � ���� ���", "������� �� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] �������� ����", "������ �� ������������ �����, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] �������� ���� ������ ���[ya]", "������� ����� ��-�����, ���[ya] ����� �� ����������� [P], �����[ya] ��� ������", "���������� �����������[ya] �� [P]", "�����������[ya] �� ����� [P], ���[ya] �� ���� ����� �����", "��������[ya] �����-����, ���[ya] ����� �� ����� [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ������[ya] ����� �������� �������� �� ��������� �������� [P], �����[ya] ��� ������", "��������� ������� ����� [P] � ���[ya]", "�������[ya]�� �������� �������� [P] � ���� �������� �����, ������[ya] ���� �����", "��������� ������ ����� [P] � ��� �������� ����", "��������� ��������� ������� [P] � ��� �������� ����")
					H.lastfucked = P
					H.lfhole = hole

/*
			if(P.species.get_bodytype() != SPECIES_PROMETHEAN && H.species.get_bodytype() == SPECIES_PROMETHEAN && H.species.get_bodytype() != SPECIES_TESHARI)
				message = pick("������� ���[ya] � ��� �������� ������� [P]", "��������� ������ �� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] �������� ����� � ���� ���", "������� ����� �� �������� ����������� [P], ���� �������� �������", "���������� ������� ���[ya] �������� ������ [P]")
				if (prob(35))
					message = pick("����[ya]�� ��������� ��������� [P] � ���� ��� �� ����� [ya]���", "������ �� �������� ������ [P], �������[ya] ��� � ���� ���", "������� �� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] �������� ����", "�����������[ya] �������� ���������� �� �������� �������� [P], ����[ya] ��� � ��[ya]��� ����� �� �����", "������ �� ������������ �����, �������[ya][ya] ������������ ���� � [P]", "[H.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] �������� ���� ������ ���[ya]", "������� ����� ��-�����, ���[ya] ����� �� ����������� [P], �����[ya] ��� ������", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� ��[ya]��� ������", "�����������[ya] �� ����� [P], ���[ya] �� ���� ����� �����", "��������[ya] �����-����, ���[ya] ����� �� ����� [P]")
				else if (prob(1))
					message = pick("�����������[ya] �� ��������� [P] �� ����� [ya]���, ������� �������[ya] � ������ [P]", "�����������[ya] �� ��������� [P] �� ����� [ya]���, ������� �������[ya] � ������ [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("�������� ������[ya] �������� �� ������ ��������� �������� [P], ����[ya] ��� ������", "��������� ������ ����� [P] � ���� ������ ������", "�������[ya]�� �������� �������� [P] � ���� �����, ������[ya] ���� �����", "��������� ������ ����� [P] � ���� ��[ya]��� �����", "��������� ��������� ������� [P] � ���� ��[ya]��� �����", "��������� ������ [P] � ���� �������� �����")
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
					message = pick("�� ����������, ��� �������� [H] �������� ����� ����������[ya] ������ ������ �����������.", "�� ����������, ��� �������� [H] ������ ������� ��� ����[ya]����� ����, ��������[ya].", "�� ����������, ��� �������� [H] �[ya]��� ��������[ya] ������ ������ �����.", "�� ����������, ��� �����[ya]��[ya] �������� [H], ��������[ya] ��� ���� ������ ��[ya]��� �����.", "�� ����������, ��� ����� ��������� [H] ������ ��������[ya] ��������� ���, ��������[ya] ��� � �������.")
				else if(H.species.get_bodytype() == SPECIES_PROMETHEAN)
					message = pick("�� ����������, ��� ����� [H] �������� ����� ����������[ya] ������ ������ �����������.", "�� ����������, ��� ����� [H] ������ ������� ��� ����[ya]����� ����, ��������[ya].", "�� ����������, ��� ������������ [H] �[ya]��� ��������[ya] ������ ������ �����.", "�� ����������, ��� �����[ya]��[ya] ����� [H], ��������[ya] ��� ���� ������ ���[ya].", "�� ����������, ��� ����� [H] ������ ��������[ya] ��������� ���, ��������[ya] ��� � �������.")
				else if(H.species.get_bodytype() == SPECIES_TESHARI)
					message = pick("�� ����������, ��� ������ [H] �������� ����� ����������[ya] ������ ������ �����������.", "�� ����������, ��� ������ [H] ������ ������� ��� ����[ya]����� ����, ��������[ya].", "�� ����������, ��� �������� [H] �[ya]��� ��������[ya] ������ ������ �����.", "�� ����������, ��� �����[ya]��[ya] ������ [H], ��������[ya] ��� ���� ������ �����.", "�� ����������, ��� ����� ������ [H] ������ ��������[ya] ��������� ���, ��������[ya] ��� � �������.")
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

			message = pick("������ �� ����� [P], �������[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ���� ���", "������� ����� �� ����������� [P], ���� ����", "�����������[ya] �� ���� [P] �������� �������, ����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ����� � ��[ya]��� �����")
			if (prob(35))
				message = pick("�����������[ya] �� ��������� [P] �������� �� ����� [ya]��", "������ �� ������ [P], �������[ya] ��� � ���� ���", "������� �� [P], ����[ya][ya]�� � [P.identifying_gender==FEMALE ? "�" : "���"] ����", "������������, �������[ya][ya] ������������ ���� � [P]", "[P.identifying_gender==FEMALE ? "�������" : "����[ya]"] ����� � [P] � ������, ����� [P.identifying_gender==FEMALE ? "�" : "���"] ���� ������ ���[ya]", "������� ����� ��-�����, ���[ya] ����� �� ����������� [P], �����[ya] ��� ", "���������� �����������[ya] �� [P], �����[ya] [P.identifying_gender==FEMALE ? "�" : "���"] ���� ��[ya]��� ������", "�����������[ya] �� ������ [P], ���[ya] �� ���� ����� �����", "��������[ya] �����-����, ���[ya] ����� �� ������� [P]")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("�������� ������[ya] �������� �� ��������� [P], ����[ya] ��� ������", "��������� ������ ����� [P] � ������ ���� ������", "�������[ya]�� ���� [P] � ���� �����, ������[ya] ���� �����", "��������� ������ ����� [P] � ���� ��[ya]��� �����", "��������� ������� [P] � ���� ��[ya]��� �����", "��������� ������ [P] � ���� �������� �����")
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
				message = pick("�� ����������, ��� �������� ������ [H] �������� ����� ����������[ya] ������ ������ �����������.", "�� ����������, ��� �������� [H] ������ ������� ��� ����[ya]����� ����, ��������[ya].", "�� ����������, ��� ���� [H] ����� ��������[ya] ������ ������ �����.", "�� ����������, ��� �����[ya]��[ya] �������� [H], ��������[ya] ��� ���� ������ ��[ya]��� �����.", "�� ����������, ��� ����� ��������� [H] ������ ��������[ya] ��������� ���, ��������[ya] ��� � �������.")
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
						message = pick("����������� ��� [P] ����� ������.", "����������� ��� [P] ����� ������, �������[ya][ya] ��� ��������.", "������ ���������� [P] ����� ������.", "����������� ���� [P] ����� ����� ������.")
					if("female")
						message = pick("����������� ����������� [P] ����� ������.", "������ ����������� [P] ����� ������, ������[ya] ����� ��� ��������.", "������ ����� [P] ����� ������.", "������� [P] ����� ��� ����� ������.")
				H.arousal += 10
			else
				switch(H.gender)
					if("male")
						message = pick("����������� ���� ��� ����� ������.", "����������� ���� ��� ����� ������, �������[ya][ya] ��� ��������.", "������ ���� ���������� ����� ������.", "����������� ���� ���� ����� ����� ������.")
					if("female")
						message = pick("����������� ���� ����������� ����� ������.", "������ ���� ����������� ����� ������, ������[ya] ����� ��� ��������.", "������ ���� ����� ����� ������.", "������� ���[ya] ����� ��� ����� ������.")

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
		if(H.species.get_bodytype() == SPECIES_HUMAN || H.species.get_bodytype() == SPECIES_SKRELL || H.species.get_bodytype() == SPECIES_HUMAN_VATBORN || H.species.get_bodytype() == SPECIES_RAPALA || H.species.get_bodytype() == SPECIES_VASILISSAN || H.species.get_bodytype() == SPECIES_AKULA || H.species.get_bodytype() == SPECIES_PROMETHEAN || H.species.get_bodytype() == SPECIES_TAJ || H.species.get_bodytype() == SPECIES_VULPKANIN || H.species.get_bodytype() == SPECIES_SERGAL || H.species.get_bodytype() == SPECIES_ZORREN_HIGH || H.species.get_bodytype() == SPECIES_ZORREN_FLAT || H.species.get_bodytype() == SPECIES_ALRAUNE)
			if(prob(H.lust / H.resistenza * 65))
				var/message = pick("�����������", "������ �� �����������[ya]", "���������� �����", "���������� ����", "�������� �����������[ya]")
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
					var/message = pick("��������", "�������� �� �����������[ya]", "���������� �����", "�������� �����������[ya]")
					H.visible_message("<B>[H]</B> [message].")
					playsound(loc, "honk/sound/interactions/purr[rand(1, 3)].ogg", 70, 1, frequency = get_age_pitch())

			if("Vulpkanin", "Sergal", "Flatland Zorren", "Highlander Zorren")
				if (prob(H.lust / src.resistenza * 70))
					var/message = pick("�����������", "����������� �� �����������[ya]", "���������� �����", "�������� �����������[ya]")
					H.visible_message("<B>[H]</B> [message].")
*/
		if(H.species.get_bodytype() == SPECIES_UNATHI)
			if (prob(H.lust / H.resistenza * 65))
				var/message = pick("�������� �����", "���������[ya] �� �����������[ya]")
				H.visible_message("<B>[H]</B> [message].")

		if(H.species.get_bodytype() == SPECIES_TESHARI || H.species.get_bodytype() == SPECIES_VOX || H.species.get_bodytype() == SPECIES_NEVREAN)
			if (prob(H.lust / H.resistenza * 65))
				var/message = pick("�������� �����", "���������[ya] �� �����������[ya]")
				H.visible_message("<B>[H]</B> [message].")

	else if (prob(H.lust / H.resistenza * 65))
		var/message = pick("���� ������", "����������� � ������", "���������� ����� �� �����������[ya]")
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
				var/message = pick("�����������", "������ �� �����������[ya]", "���������� �����", "�������� �����������[ya]")
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
					var/message = pick("��������", "�������� �� �����������[ya]", "���������� �����", "�������� �����������[ya]")
					H.visible_message("<B>[H]</B> [message].")
					playsound(loc, "honk/sound/interactions/purr[rand(1, 3)].ogg", 70, 1, frequency = get_age_pitch())

			if("Vulpkanin", "Sergal", "Flatland Zorren", "Highlander Zorren")
				if (prob(H.lust / src.resistenza * 70))
					var/message = pick("�����������", "����������� �� �����������[ya]", "���������� �����", "�������� �����������[ya]")
					H.visible_message("<B>[H]</B> [message].")
*/
		if(M.species.get_bodytype() == SPECIES_UNATHI)
			if (prob(M.arousal / M.resistenza * 65))
				var/message = pick("�������� �����", "���������[ya] �� �����������[ya]")
				M.visible_message("<B>[M]</B> [message].")

		if(M.species.get_bodytype() == SPECIES_TESHARI || M.species.get_bodytype() == SPECIES_VOX || M.species.get_bodytype() == SPECIES_NEVREAN)
			if (prob(M.arousal / M.resistenza * 65))
				var/message = pick("�������� �����", "���������[ya] �� �����������[ya]")
				M.visible_message("<B>[M]</B> [message].")

	else if (prob(M.arousal / M.resistenza * 65))
		var/message = pick("���� ������", "����������� � ������", "���������� ����� �� �����������[ya]")
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
				message = pick("����������[ya]�� ���[ya] � ������� �����", "��������� ����� � ���� �����", "����������� ����� � ���� ������ �� ����� [ya]���", "��������� ����� � ��� ����", "������� ���[ya] �� ��������� ��� ������ �����")
			else
				message = pick("����������[ya]�� [M] � ������� �����", "��������� ����� � ����� [M]", "����������� ����� � ������ [M] �� ����� [ya]���", "��������� ����� � ���� [M]", "������� [M] �� ��������� ��� ������ �����")

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
				message = pick("����������[ya]�� ���[ya] ������� � ������� �����", "������� ���[ya] � ��� ��� ������ �����", "����������� ����� ���� � ���� �� ����� [ya]���", "������ ���� �������, ��������[ya] �����", "����� ����� � ����� ����� ��� ������ �����")
			else
				message = pick("����������[ya]�� [M] ������� � ������� �����", "������� [M] � ��� ��� ������ �����", "����������� ����� [M] � ���� �� ����� [ya]���", "������ ������� [M], ��������[ya] �����", "����� ����� � ����� [M] ��� ������ �����")

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
				message = pick("������������� ���� ������� ��� ������ �����", "����������� ����� ���� � ������", "������������� ���� ������, ��������[ya] �����", "������� ���[ya] � �����, ��������[ya] �����", "����������� ����� ���� � ������ �� ����� [ya]���", "���� ����� ��� �������")
			else
				message = pick("������������� ������� [M] ��� ������ �����", "����������� ����� [M] � ������", "������������� ������ [M], ��������[ya] �����", "������� [M] � ����� ��� ������ �����", "����������� ����� � ������ [M] �� ����� [ya]���")

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
				M.visible_message("<B>[M]</B> [pick("������[ya] <B>�����</B>", "���������[ya]", "�������[ya] � ������� ������")].")
				if (istype(M.loc, /obj/structure/closet))
					M.visible_message("<B>[M]</B> [pick("������[ya] <B>�����</B>", "���������[ya]", "�������[ya] � ������� ������")].")

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