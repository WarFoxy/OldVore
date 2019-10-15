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
		to_chat(src, "<span class='warning'>Вы занимаете свои мысли чем-то, что вас возбуждает...</span>")
		src.arousal += 10
	else if(gender != NEUTER)
		to_chat(src, "<span class='warning'>Вы уже слишком возбуждены, чтобы довольствоватьс[ya] только этим!</span>")
	else
		to_chat(src, "<span class='warning'>У вас нет необходимых половых признаков! Как вы собрались это провернуть?</span>")

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
	var/hasvagina_p = (P.gender == FEMALE && P.species.genitals && P.species.name != "Stok" && H.species.name != "Teshari")
	var/hasanus_p = P.species.anus
	var/hasanus = H.species.anus
	var/isnude = H.is_nude()
	var/isnude_p = P.is_nude()

	H.lastfucked = null
	H.lfhole = ""

	var/dat = "<B><HR><FONT size=3>INTERACTIONS - [H.partner]</FONT></B><BR><HR>"
	var/ya = "&#1103;"

	if (P != H)
		dat +=  {"• <A href='?src=\ref[src];interaction=bow'>Отвесить поклон.</A><BR>"}
		dat +=  {"• <A href='?src=\ref[src];interaction=wave'>Поприветствовать.</A><BR>"}
	if (hashands)
		dat +=  {"<font size=3><B>Руки:</B></font><BR>"}
		if (Adjacent(P))
			if (P != H)
				dat +=  {"• <A href='?src=\ref[src];interaction=handshake'>Пожать руку.</A><BR>"}
				dat +=  {"• <A href='?src=\ref[src];interaction=five'>Дать п[ya]ть.</A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=hug'>Обнимашки!</A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=cheer'>Похлопать по плечу</A><BR>"}
			if (hashands_p && (P != H))
				dat +=  {"• <A href='?src=\ref[src];interaction=give'>Передать предмет.</A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=slap'><font color=red>Дать пощечину!</font></A><BR>"}
			if (hasanus_p)
				dat += {"• <A href='?src=\ref[src];interaction=assslap'>Шлепнуть по заднице</A><BR>"}
			if (isnude_p)
				if (hasvagina_p)
					dat += {"• <A href='?src=\ref[src];interaction=fingering'><font color=purple>Просунуть пальчик...</font></A><BR>"}
				if (haspenis_p)
					dat += {"• <A href='?src=\ref[src];interaction=jerk'><font color=purple>Подрочить</font></A><BR>"}
			if ((P.species.get_bodytype() == SPECIES_TAJ || P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT || P.species.get_bodytype() == SPECIES_SERGAL) && (P != H))
				dat +=  {"• <A href='?src=\ref[src];interaction=pull'><font color=red>Дёрнуть за хвост!</font></A><BR>"}
				if(P.can_inject(H, 1))
					dat +=  {"• <A href='?src=\ref[src];interaction=pet'>Погладить.</A><BR>"}
			if (P == H)
				dat +=  {"• <A href='?src=\ref[src];interaction=pet'>Погладить себ[ya].</A><BR>"}
			if ((haspenis_p || hasvagina_p) && !isnude_p && P.species.name != "Teshari" && P.can_inject(H, 1))
				dat += {"• <A href='?src=\ref[src];interaction=petting'><font color=purple>Потрогать пах</font></A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=knock'><font color=red>Дать подзатыльник.</font></A><BR>"}
		if (P != H)
			dat +=  {"• <A href='?src=\ref[src];interaction=fuckyou'><font color=red>Показать средний палец.</font></A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=threaten'><font color=red>Погрозить кулаком.</font></A><BR>"}

	if (mouthfree && H.species.name != "Diona" && P != H)
		dat += {"<font size=3><B>Лицо:</B></font><BR>"}
		dat += {"• <A href='?src=\ref[src];interaction=kiss'>Поцеловать.</A><BR>"}
		if (Adjacent(P))
			if (mouthfree_p)
				dat += {"• <A href='?src=\ref[src];interaction=lick'>Лизнуть в щеку.</A><BR>"}
			if (isnude_p)
				if (haspenis_p)
					dat += {"• <A href='?src=\ref[src];interaction=blowjob'><font color=purple>Сделать минет.</font></A><BR>"}
				if (hasvagina_p)
					dat += {"• <A href='?src=\ref[src];interaction=vaglick'><font color=purple>Вылизать.</font></A><BR>"}
				if (hasanus_p && P.species.name != "Diona")
					dat += {"• <A href='?src=\ref[src];interaction=asslick'><font color=purple>Отполировать черный ход?!</font></A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=spit'><font color=red>Плюнуть.</font></A><BR>"}
		dat +=  {"• <A href='?src=\ref[src];interaction=tongue'><font color=red>Показать [ya]зык.</font></A><BR>"}

	if (Adjacent(P) && isnude && P.species.name != "Diona" && P != H)
		if (haspenis && hashands)
			dat += {"<font size=3><B>Член:</B></font><BR>"}
			if (hasvagina_p && isnude_p && P.species.name != "Teshari")
				dat += {"• <A href='?src=\ref[src];interaction=vaginal'><font color=purple>Трахнуть вагинально.</font></A><BR>"}
			if (hasanus_p && isnude_p)
				dat += {"• <A href='?src=\ref[src];interaction=anal'><font color=purple>Трахнуть анально.</font></A><BR>"}
			if (mouthfree_p)
				dat += {"• <A href='?src=\ref[src];interaction=oral'><font color=purple>Трахнуть орально.</font></A><BR>"}
	if (isnude && hashands && P != H)
		if (hasvagina)
			dat += {"<font size=3><B>Лоно:</B></font><BR>"}
			if (isnude_p && haspenis_p && usr.loc == H.partner.loc)
				dat += {"• <A href='?src=\ref[src];interaction=mount'><font color=purple>Оседлать</font></A><BR>"}
				dat += {"• <A href='?src=\ref[src];interaction=rub'><font color=purple>Потеретьс[ya]</font></A><BR>"}
			if (mouthfree_p && usr.loc == H.partner.loc)
				dat += {"• <A href='?src=\ref[src];interaction=facesitting'><font color=purple>Сесть на лицо</font></A><BR>"}
			if (mouthfree_p && (Adjacent(P) || (usr.loc == H.partner.loc)))
				dat += {"• <A href='?src=\ref[src];interaction=forcelick'><font color=purple>Заставить отлизывать</font></A><BR>"}
			if ((usr.loc == H.partner.loc) && hasvagina_p)
				dat += {"• <A href='?src=\ref[src];interaction=tribadism'><font color=purple>Трибадизм</font></A><BR>"}
	if (isnude && hashands && P.species.name != "Diona" && P != H)
		if (hasanus && haspenis_p)
			dat += {"<font size=3><B>Зад:</B></font><BR>"}
			if (isnude_p && usr.loc == H.partner.loc)
				dat += {"• <A href='?src=\ref[src];interaction=assfuck'><font color=purple>Оседлать задом</font></A><BR>"}

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
Запилить rub для рас, чтобы таяране тёрлись _пушистыми/волосатыми_ пёздами, чтобы тераши тёрлись перьями и прочее, а не обычными как сейчас. А шо, каво?
Запилитть dickrub, чтобы каждый настоящий мужчина мог посоревноваться с другим настоящим мужчиной в своём мужыцком фехтовании.
Запилить унатхам возможность трахаться сексом в эти, как их.. Хуйные отверстия "slit".
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
				message = pick("кончает [P] в рот.", "кончает [P] в глотку.", "заполн[ya]ет рот [P] семенем.", "брызгает спермой в рот [P].", "спускает на [ya]зычок [P].")
				var/datum/reagents/holder = new
				var/amt = rand(20,30)
				holder.add_reagent("semen", amt)
				holder.trans_to_mob(P, amt, CHEM_INGEST)

			else if (hole == "vagina")
				message = pick("кончает в [P]", "спускает в киску [P]", "заполн[ya]ет влагалище [P] спермой.", "резко выт[ya]гивает член из [P], а затем спускает на пол.", "проникает в [P] последний раз, затем содрагаетс[ya]. Сперма медленно вытекает из щели [P].")

			else if (hole == "anus")
				message = pick("кончает [P] в зад.", "заполн[ya]ет задницу [P] спермой.", "спускает семенную жидкость в пр[ya]мую кишку [P].", "выдергивает член из [P], а затем обильно кончает на [P.identifying_gender == MALE ? "его" : "её"] попку.", "выт[ya]гивает член из задницы [P] и сразу же спускает на пол.")

			else if (hole == "floor")
				message = pick("кончает на пол!", "кончает на своего партнёра!")

			else if (hole == "cumhand")
				if (P != H)
					message = pick("кончает [P] в руку.", "кончает в сжатый кулачок [P].", "разбрызгивает сем[ya], пачка[ya] ладошку и пальцы [P].", "стрел[ya]ет тугой струёй малафьи, зал[ya]пыва[ya] руку [P].")
				else if (!R)
					message = pick("кончает себе в руку.", "кончает в свой сжатый кулачок.", "разбрызгивает сем[ya], пачка[ya] свою ладошку и пальцы.", "стрел[ya]ет тугой струёй малафьи, зал[ya]пыва[ya] свою руку.")
				else
					message = pick("кончает в [R.name].", "опускаетс[ya] к полу и кончает в [R.name].", "заполн[ya]ет [R.name] образцом ДНК.", "поднес[ya] член к [R.name], кончает.")

			else if (hole == "rub")
				message = pick("кончает себе на живот.", "целитс[ya] на живот [P], стрел[ya]ет тугой струёй малафьи, но промахиваетс[ya].", "разбрызгивает сем[ya] по пузику [P].", "заполн[ya]ет внешнюю часть вагины [P] тёплой спермой.")

/*			else if (hole == "assfuck")
				message = pick("доводит [H] до предела и [H.identifying_gender == MALE ? "он" : "она"] кончает [H] в зад.", "доводит [H] до сем[ya]извержени[ya] заполн[ya]ет задницу [H] спермой.", "довед[ya] [H] до предела позвол[ya]ет [H.identifying_gender == MALE ? "ему" : "ей"] спустить семенную жидкость себе в пр[ya]мую кишку.", "в последний момент выт[ya]гивает член из задницы, из-за чего [H] обильно кончает на свой лобок.", "в последний момент выт[ya]гивает член из своей пр[ya]мой кишки, из-за чего [H] кончает на свой лобок", "в последний момент выт[ya]гивает член из своей пр[ya]мой кишки, из-за чего [H] обильно кончает на свой лобок", "в последний момент выт[ya]гивает член из своей пр[ya]мой кишки, из-за чего [H] кончает на [H.identifying_gender == MALE ? "его" : "её"] промежность")

Сюда впилить выдачу сообщения логичную для вышенаписанного, добавить ещё всяких сообщений.

*/
			else if (hole == "assfuck")
				message = pick("кончает [P] в задницу.", "извергает сем[ya] в пр[ya]мую кишку [P].", "спускает семенную жидкость в пр[ya]мую кишку [P].", "обильно спускает в [P]", "держа [P] за бёдра кончает [P.identifying_gender == MALE ? "ему" : "ей"] в задницу.", "извергает сем[ya] в пр[ya]мую кишку [P], держа [P.identifying_gender == MALE ? "того" : "ту"] за бёдра.", "спускает в пр[ya]мую кишку [P].", "обильно спускает в задницу [P]")

		else
			message = pick("кончает!", "оргазмирует!")

		playsound(loc, "honk/sound/interactions/final_m[rand(1, 5)].ogg", 70, 1, 0)

		H.visible_message("<B>[H] [message]</B>")
		if (istype(P.loc, /obj/structure/closet))
			P.visible_message("<B>[H] [message]</B>")
		H.lust = 5
		H.resistenza += 50

	else
		if(R && (P == H))
			R.reagents.add_reagent("f_lube", rand(5, 15))
			message = pick("извиваетс[ya] в приступе оргазма и заполн[ya]ет [R.name] своей смазкой", "прикрывает глаза и мелко дрожит. [R.name] наполн[ya]етс[ya] стекающими соками", "содрагаетс[ya], а затем резко расслабл[ya]етс[ya], заполнив [R.name] смазкой", "замирает, закатив глаза, и кончает в [R.name] смазкой")
		else
			message = pick("извиваетс[ya] в приступе оргазма", "прикрывает глаза и мелко дрожит", "содрагаетс[ya], а затем резко расслабл[ya]етс[ya]", "замирает, закатив глаза")
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

			message = pick("вылизывает [P].", "отлизывает [P].")
			if (prob(35))
				message = pick("вылизывает [P].", "полирует промежность [P] [ya]зыком.", "отлизывает [P].", "ласкает [P] [ya]зычком.", "погружает свой [ya]зык в [P]", "играетс[ya] с [P] [ya]зычком", "медленно проводит [ya]зыком вдоль промежности [P]")

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
				retaliation_message = pick("сглатывает соки [P].", "сглатывает соки [P], попавшие [H.identifying_gender==FEMALE ? "ей" : "ему"] в рот.", "глотает смазку [P].", "собирает [ya]зыком нектар [P] и проглатывет его.")
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
					message = pick("Вы чувствуете, как вагинальные мышцы [P] начинают резко сокращатьс[ya].", "Вы чувствуете, как в ваш рот попадает некоторое количество соков [P] в процессе оргазма.", "Вы чувствуете, как влажна[ya] киска [P] резко сжимает ваш [ya]зычок внутри себ[ya].", "Вы чувствуете, как всё внутри [P] сжимаетс[ya], а её клитор начинает пульсировать.", "Вы чувствуете, как [P] кончает вам в рот струйкой смазки, оргазмиру[ya].")
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
			message = pick("вылизывает анус [P]", "тщательно полирует анальное колечко [P]")
			if (prob(35))
				message = pick("трахает личико [P], провод[ya] по нему киской.", "полирует [ya]зык [P] своей промежностью, устроившись на [P.identifying_gender==FEMALE ? "её" : "его"] лице.", "засовывает нос [P] промеж половых губ и ёрзает на нём.", "крепко жмётс[ya] к лицу [P] промежностью, выгиба[ya] спину.", "насилует лицо [P] быстрыми движени[ya]ми таза.", "играетс[ya] с ротиком [P], елоз[ya] по нему влагалищем.", "медленно проводит промежностью по лицу [P].", "размазывает свои соки по физиономии [P] движени[ya]ми таза.")

			message = pick()
 */
/* FACESITTING */

		if("facesitting")

			message = pick("елозит вагиной по лицу [P].", "сношает лицо [P].")
			if (prob(35))
				message = pick("трахает личико [P], провод[ya] по нему киской.", "полирует [ya]зык [P] своей промежностью, устроившись на [P.identifying_gender==FEMALE ? "её" : "его"] лице.", "засовывает нос [P] промеж половых губ и ёрзает на нём.", "крепко жмётс[ya] к лицу [P] промежностью, выгиба[ya] спину.", "насилует лицо [P] быстрыми движени[ya]ми таза.", "играетс[ya] с ротиком [P], елоз[ya] по нему влагалищем.", "медленно проводит промежностью по лицу [P].", "размазывает свои соки по физиономии [P] движени[ya]ми таза.")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("м[ya]гко садитс[ya] [P] на лицо.", "грубо насаживаетс[ya] на лицо [P].", "садитс[ya] на лицо [P], упира[ya]сь горошинкой клитора [P.identifying_gender==FEMALE ? "ей" : "ему"] под нос.", "седлает лицо [P] своей влажной промежностью.")
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
				retaliation_message = pick("сглатывает соки [H].", "сглатывает соки [H], попавшие [P.identifying_gender==FEMALE ? "ей" : "ему"] в рот.", "глотает смазку [H].", "собирает [ya]зыком нектар [H] и проглатывет его.")
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
					message = pick("Вы чувствуете, как вагинальные мышцы [H] начинают резко сокращатьс[ya].", "Вы чувствуете, как в ваш рот попадает некоторое количество э[ya]кул[ya]та [H] в процессе оргазма.", "Вы чувствуете, как влажна[ya] киска [H] резко сжимаетс[ya] на вашем лице.", "Вы чувствуете, как всё внутри [H] сжимаетс[ya], а её клитор начинает пульсировать.", "Вы чувствуете, как [H] кончает вам на лицо струйкой э[ya]кул[ya]та, оргазмиру[ya].")
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
				retaliation_message = pick("сильно кусает [H] за ногу.", "сжимает зубы между ног [H].", "злобно смотрит из-под колен [H], скал[ya] окровавленные зубы.", "изо всех сил пытаетс[ya] вырватьс[ya] из-под ног [H].")
				H.visible_message("<font color=red>[P] [retaliation_message]</font>")

/* FORCELICK */

		if("forcelick")

			message = pick("заставл[ya]ет [P] отлизывать.", "принуждает [P] вылизывать лоно.")
			if (prob(35))
				message = pick("сильно прижимает голову [P] к себе.", "трахает рот и нос [P], работа[ya] тазом.", "насилует физиономию [P], вцепившись в [P.identifying_gender==FEMALE ? "её" : "его"] голову.", "задерживает голову [P] у своего влагалища, наслажда[ya]сь работой [ya]зыка.", "грубо сжимает пальцы на голове [P], когда [P.identifying_gender==FEMALE ? "её" : "его"] [ya]зык погружаетс[ya] глубже.")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("м[ya]гко наклон[ya]ет [P] к своей писечке.", "грубо хватает голову [P] и прислон[ya]ет к своей промежности.", "наклон[ya]ет лицо [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] нос в свою мокренькую киску.", "прислон[ya]ет рот [P] к своей влажной промежности.")
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
				retaliation_message = pick("сглатывает соки [H].", "сглатывает соки [H], попавшие [P.identifying_gender==FEMALE ? "ей" : "ему"] в рот.", "глотает смазку [H].", "собирает [ya]зыком нектар [H] и проглатывет его.")
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
					message = pick("Вы чувствуете, как вагинальные мышцы [H] начинают резко сокращатьс[ya].", "Вы чувствуете, как в ваш рот попадает некоторое количество э[ya]кул[ya]та [H] в процессе оргазма.", "Вы чувствуете, как влажна[ya] киска [H] резко сжимает ваш [ya]зычок внутри себ[ya].", "Вы чувствуете, как всё внутри [H] сжимаетс[ya], а [H.identifying_gender==FEMALE ? "её" : "его"] клитор начинает пульсировать.", "Вы чувствуете, как [H] кончает вам в рот струйкой э[ya]кул[ya]та, оргазмиру[ya].")
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
				retaliation_message = pick("[ya]ростно кусает [H] за ноги.", "сжимает зубами киску [H].", "выгл[ya]дит очень [P.identifying_gender==FEMALE ? "недовольной" : "недовольным"] своим нахождением здесь.", "изо всех сил пытаетс[ya] вырватьс[ya] из-под бёдер [H].")
				H.visible_message("<font color=red>[P] [retaliation_message]</font>")

/* FINGERING */

		if("fingering")
			if (P != H)
				message = pick("вводит два пальца в вагину [P].", "трахает [P] пальцами.")
				H.arousal += 12
			else
				message = pick("вводит два пальца в свою вагину.", "трахает себ[ya] пальцами.")
			if (prob(35))
				if(P.species.get_bodytype() == SPECIES_UNATHI || P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_PROTEAN)
					if (P != H)
						message = pick("вводит два пальца в вагину [P].", "теребит горошину [P].", "тычет пальцами [P].", "ласкает [P] пальчиками.", "нежно поглаживает промежность [P].", "погружает пальцы глубоко в [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] изнутри.", "изучает глубины [P].")
						H.arousal += 12
					else
						message = pick("вводит два пальца в свою вагину.", "теребит свою горошину.", "тычет в себ[ya] пальцами.", "ласкает себ[ya] пальчиками.", "нежно поглаживает свою промежность.", "погружает пальцы глубоко во влагалище, ласка[ya] себ[ya] изнутри.", "изучает свои глубины.")
				if(P.species.get_bodytype() == SPECIES_TAJ || P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT || P.species.get_bodytype() == SPECIES_SERGAL)
					if (P != H)
						message = pick("вводит два пальца в пушистую вагину [P].", "теребит горошину [P].", "тычет пальцами [P].", "ласкает [P] пальчиками.", "нежно поглаживает пушистую промежность [P].", "погружает пальцы глубоко в [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] изнутри.", "изучает глубины [P].")
						H.arousal += 12
					else
						message = pick("вводит два пальца в свою пушистую вагину.", "теребит свою горошину.", "тычет в себ[ya] пальцами.", "ласкает себ[ya] пальчиками.", "нежно поглаживает свою пушистую промежность.", "погружает пальцы глубоко во влагалище, ласка[ya] себ[ya] изнутри.", "изучает свои глубины.")

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
					message = pick("Вы чувствуете, как вагинальные мышцы [P] начинают резко сокращатьс[ya] вокруг ваших пальцев.", "Вы чувствуете, как ребристые стенки [P] крепко сжимают ваши промокшие пальцы.", "Вы чувствуете, как влажна[ya] киска [P] резко сжимает ваши пальцы внутри себ[ya].", "Вы чувствуете, что вашим пальцам становитс[ya] тесно внутри гор[ya]чей писечки [P].", "Вы чувствуете, как по внутренней стороне вашей ладони стекает тёпла[ya] струйка э[ya]кул[ya]та [P].")
					to_chat(H, message)
				else
					P.moan()
			playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)
			H.do_fucking_animation(P)

/* JERK */

		if("jerk")
			if (P != H)
				message = pick("стимулирует инструмент [P] возвратно-поступательными движени[ya]ми.", "дрочит орган [P] в быстром темпе.", "медленно ласкает член [P] пальчиками.", "надрачивает [P] кулачком.", "дрочит член [P], заключив его в колечко из двух пальцев.", "медленно стимулирует орган [P].", "дрочит [P], обхватив его член рукой.", "надрачивает член [P].", "поглаживает головку члена [P] большим пальцем.", "дёргает половой орган [P].", "передёргивает [P].", "дрочит [P].")
				H.arousal += 10
			else
				message = pick("стимулирует свой инструмент возвратно-поступательными движени[ya]ми.", "дрочит свой орган в быстром темпе.", "медленно ласкает свой член пальчиками.", "надрачивает себе кулачком.", "дрочит свой член, заключив его в колечко из двух пальцев.", "медленно стимулирует свой орган.", "дрочит себе, обхватив свой член рукой.", "надрачивает член [P.identifying_gender == MALE ? "самому" : "самой"] себе.", "поглаживает головку своего члена большим пальцем.", "дёргает свой половой орган.", "передёргивает себе.", "дрочит себе.")
			if (H.lastfucked != P || H.lfhole != hole)
				if (P != H)
					message = pick("м[ya]гко обхватывает член [P] рукой.", "берёт член [P] в руку.", "берёт орган [P] в руку и начинает надрачивать [P].")
				else
					message = pick("м[ya]гко обхватывает свой член рукой.", "берёт свой член в руку.", "берёт свой орган в руку и начинает надрачивать себе.")
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
				message = pick("отсасывает [P].", "сосет член [P].", "стимулирует член [P] [ya]зыком.")
				if (prob(35))
					message = pick("целует орган [P], прикрыв глаза от удовольстви[ya].", "постанывает, прикрыв глаза, не вынима[ya] член [P] изо рта.", "ласкает член [P] [ya]зычком, придержива[ya] его рукой.", "облизывает член [P] по всей длине.", "погружает член [P] все глубже себе в рот.", "кончиком [ya]зыка облизывает головку члена [P].", "сосёт леденец [P].", "двигает головой взад-вперёд, стимулиру[ya] член [P].", "тщательно вылизывает член [P].", "зажмурившись, полностью заглатывает малыша [P].", "ласкает член [P], помога[ya] себе руками.")
				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("м[ya]гко обхватывает член [P] губами.", "приступает сосать член [P].")
					H.lastfucked = P
					H.lfhole = hole

			if(H.species.get_bodytype() == SPECIES_UNATHI || H.species.get_bodytype() == SPECIES_AKULA || H.species.get_bodytype() == SPECIES_SERGAL || H.species.get_bodytype() == SPECIES_TESHARI)
				message = pick("облизывает член [P].", "стимулирует орган [P] [ya]зыком.", "трёт член [P] о свой [ya]зык.", "проталкивает член [P] себе в пасть, стара[ya]сь не зацепить его зубами.", "стимулирует член [P] [ya]зыком.")
				if (prob(35))
					message = pick("облизывает орган [P], прикрыв глаза от удовольстви[ya].", "постанывает, прикрыв глаза, не вынима[ya] член [P] из пасти.", "ласкает член [P] [ya]зычком, придержива[ya] его рукой.", "облизывает член [P] по всей длине.", "погружает член [P] все глубже себе в пасть.", "кончиком [ya]зыка облизывает головку члена [P].", "облизывает леденец [P].", "двигает головой взад-вперёд, стимулиру[ya] член [P].", "тщательно вылизывает член [P].", "зажмурившись, полностью заглатывает малыша [P].", "ласкает член [P], помога[ya] себе руками.")
				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("кончиком [ya]зыка касаетс[ya] члена [P].", "приступает облизывать член [P].")
					H.lastfucked = P
					H.lfhole = hole

			if(H.species.get_bodytype() == SPECIES_TAJ || H.species.get_bodytype() == SPECIES_VULPKANIN || H.species.get_bodytype() == SPECIES_ZORREN_HIGH || H.species.get_bodytype() == SPECIES_ZORREN_FLAT)
				message = pick("вылизывает член [P].", "обводит своим [ya]зычком вокруг члена [P].", "проталкивает член [P] себе в пасть, стара[ya]сь не зацепить его зубами.", "стимулирует член [P] [ya]зыком.")
				if (prob(35))
					message = pick("вылизывает орган [P], прикрыв глаза от удовольстви[ya].", "постанывает, прикрыв глаза, не вынима[ya] член [P] из пасти.", "ласкает член [P] [ya]зычком, придержива[ya] его рукой.", "облизывает член [P] по всей длине.", "погружает член [P] все глубже себе в пасть.", "кончиком [ya]зыка облизывает головку члена [P].", "вылизывает леденец [P].", "двигает головой взад-вперёд, стимулиру[ya] член [P].", "тщательно вылизывает член [P].", "зажмурившись, полностью заглатывает малыша [P].", "ласкает член [P], помога[ya] себе руками.")
				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("кончиком [ya]зыка касаетс[ya] члена [P].", "приступает вылизывать член [P].")
					H.lastfucked = P
					H.lfhole = hole

			if(H.species.get_bodytype() == SPECIES_VOX || H.species.get_bodytype() == SPECIES_NEVREAN)
				message = pick("облизывает член [P].", "стимулирует орган [P] [ya]зыком.", "трёт член [P] о свой [ya]зык.", "проталкивает член [P] себе в глотку, стара[ya]сь не зацепить его клювом.", "стимулирует член [P] [ya]зыком.")
				if (prob(35))
					message = pick("облизывает орган [P], прикрыв глаза от удовольстви[ya].", "постанывает, прикрыв глаза, не вынима[ya] член [P] из клюва.", "ласкает член [P] [ya]зычком, придержива[ya] его крылом.", "облизывает член [P] по всей длине.", "погружает член [P] все глубже себе в клюв.", "кончиком [ya]зыка облизывает головку члена [P].", " облизывает леденец [P].", "двигает головой взад-вперёд, стимулиру[ya] член [P].", "тщательно вылизывает член [P].", "зажмурившись, полностью заглатывает малыша [P].", "ласкает член [P] [ya]зыком.")
				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("кончиком [ya]зыка касаетс[ya] члена [P].", "приступает облизывать член [P].")
					H.lastfucked = P
					H.lfhole = hole

			if(H.species.get_bodytype() == SPECIES_PROMETHEAN)
				message = pick("отсасывает [P].", "сосет член [P].", "стимулирует член [P] [ya]зыком.")
				if (prob(35))
					message = pick("смачно целует орган [P], прикрыв глаза от удовольстви[ya].", "постанывает, прикрыв глаза, не вынима[ya] член [P] изо рта.", "ласкает член [P] [ya]зычком, покрыва[ya] его в[ya]зкой слизью.", "облизывает член [P] по всей длине, оставл[ya][ya] след из слизи.", "погружает член [P] все глубже себе в рот.", "кончиком [ya]зыка облизывает головку члена [P].", "смачивает кончик члена [P] липкой слизью и снова берёт его в рот.", "сосет леденец [P].", "двигает головой взад-вперёд, стимулиру[ya] член [P].", "тщательно вылизывает член [P].", "зажмурившись, полностью заглатывает малыша [P].", "ласкает член [P], помога[ya] себе руками.")
				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("м[ya]гко обхватывает член [P] губами, обволакива[ya] его слизью.", "приступает сосать член [P].")
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
				H.visible_message("<B>[H]</B> [pick("давитс[ya] инструментом <B>[P]</B>", "задыхаетс[ya]", "корчитс[ya] в рвотном позыве")].")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> [pick("давитс[ya] инструментом <B>[P]</B>", "задыхаетс[ya]", "корчитс[ya] в рвотном позыве")].")

/* VAGINAL */

		if("vaginal")

			message = pick("трахает [P].", "сношает [P].", "долбит [P].")
			if (prob(35))
				message = pick("грубо трахает [P].", "предаётс[ya] страстной любви с [P].", "резким движением погружаетс[ya] внутрь [P].", "движетс[ya] внутри [P].", "двигает тазом, засажива[ya] член в [P].", "стонет, навалива[ya]сь на [P].", "сильно прижимаетс[ya] пахом к [P].", "насаживает [P] на свой член.", "чувственно имеет [P].")
				playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("всаживает свой член по самые [ya]йца в [P].", "вводит свой орган любви в лоно [P].", "погружает свой корень похоти внутрь [P].", "проникает в [P].")
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
					message = pick("Вы чувствуете, как вагинальные мышцы [P] начинают резко сокращатьс[ya] вокруг вашего инструмента.", "Вы чувствуете, как ребристые стенки [P] крепко сжимают ваш напр[ya]жённый член.", "Вы чувствуете, как влажна[ya] киска [P] резко сжимает ваш член внутри себ[ya].", "Вы чувствуете, что вашему прибору становитс[ya] тесно внутри гор[ya]чей писечки [P].", "Вы чувствуете, как мышцы внутри разгор[ya]чённой вагины [P] сильно сжимаютс[ya] несколько раз, приближа[ya] вас к оргазму.")
					to_chat(H, message)
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)

/* ANAL */

		if("anal")

			message = pick("долбит [P] в очко.", "анально сношает [P].", "трахает [P] в анус.", "трахает [P] в пр[ya]мую кишку", "сношает [P] в анальное отверстие")
			if (prob(35))
				if(P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_PROTEAN || P.species.get_bodytype() == SPECIES_AKULA)
					message = pick("трахает [P] в задницу.", "трахает [P] в пр[ya]мую кишку", "всаживает член [P] в анальное кольцо по самые [ya]йца.", "месит глину в шахте [P].", "разрывает [P] очко бешеными фрикци[ya]ми.", "запускает своего шахтера в угольные шахты [P].")
				if(P.species.get_bodytype() == SPECIES_TAJ || P.species.get_bodytype() == SPECIES_UNATHI || P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT)
					message = pick("трахает [P] под хвост.", "чувственно сношает [P] под пушистый хвост", "сношает пушистыю задницу [P]", "трахает [P] в пр[ya]мую кишку", "всаживает член [P] в анальное кольцо под хвостом по самые [ya]йца.", "долбит [P] под пушистый хвостик.", "месит глину в шахте [P].", "разрывает [P] очко бешеными фрикци[ya]ми.", "запускает своего шахтера в угольные шахты [P].")
				if(P.species.get_bodytype() == SPECIES_UNATHI)
					message = pick("трахает [P] под хвост.", "чувственно сношает [P] под хвост", "трахает [P] в пр[ya]мую кишку", "всаживает член [P] в анальное кольцо под хвостом по самые [ya]йца.", "долбит [P] под хвостик.", "месит глину в шахте [P].", "разрывает [P] очко бешеными фрикци[ya]ми.", "запускает своего шахтера в угольные шахты [P].")
				if(P.species.get_bodytype() == SPECIES_SKRELL || P.species.get_bodytype() == SPECIES_TESHARI || P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN)
					message = pick("трахает [P] в клоаку.", "всаживает член в клоаку [P] по самые [ya]йца.", "месит глину в шахте [P].", "разрывает клоаку [P] бешеными фрикци[ya]ми.", "запускает своего шахтера в угольные шахты [P].")
				if(P.species.get_bodytype() == SPECIES_PROMETHEAN)
					message = pick("трахает [P] в задницу.", "всаживает член [P] в анальное кольцо по самые [ya]йца, л[ya]па[ya]сь в в[ya]зкой слизи.", "раcт[ya]гивает [P] очко бешеными фрикци[ya]ми.")
					playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("безжалостно прорывает анальное отверстие [P].", "всаживает член [P] в очко.", "проникает в анус [P]")
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

			message = pick("трахает [P], засажива[ya] свой член [P.identifying_gender == FEMALE ? "ей" : "ему"] в глотку.", "орально сношает [P].")
			if (prob(35))
				if(P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_PROTEAN || P.species.get_bodytype() == SPECIES_SKRELL)
					message = pick("опираетс[ya] на плечи [P], придержива[ya] [P.identifying_gender==FEMALE ? "её" : "его"] и засажива[ya] член всё сильнее и сильнее [P.identifying_gender==FEMALE ? "ей" : "ему"] в глотку.", "трахает [P] в рот.", "насаживает голову [P] на свой член.", "держит [P] за голову двум[ya] руками и совершает движени[ya] тазом.", "даёт пощёчины [P], продолжа[ya] ебать жертву в рот.", "даёт пощёчины [P], продолжа[ya] ебать [P.identifying_gender == FEMALE ? "девушку" : "парн[ya]"] в рот.", "безжастно пользуетс[ya] глоткой [P].", ", рыча сквозь зубы, нат[ya]гивает глотку [P] на своего малыша.", "нещадно насилует глотку [P].", ", черезмерно увлекшись, тыкает членом мимо рта [P], провод[ya] членом [P.identifying_gender == FEMALE ? "ей" : "ему"] по щеке.")
				if(P.species.get_bodytype() == SPECIES_UNATHI || P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_SERGAL || P.species.get_bodytype() == SPECIES_TESHARI)
					message = pick("опираетс[ya] на плечи [P], придержива[ya] [P.identifying_gender==FEMALE ? "её" : "его"] и засажива[ya] член всё сильнее и сильнее [P.identifying_gender==FEMALE ? "ей" : "ему"] в глотку.", "трахает [P] в зубастую пасть.", "насаживает голову [P] на свой член.", "держит [P] за голову двум[ya] руками и совершает движени[ya] тазом.", "даёт пощёчины [P], продолжа[ya] ебать [P.identifying_gender == FEMALE ? "бедную [ya]щерку" : "бедного [ya]щера"] в пасть.", "безжастно пользуетс[ya] глоткой [P].", ", рыча сквозь зубы, нат[ya]гивает глотку [P] на своего малыша.", ", черезмерно увлекшись, тыкает членом мимо рта [P] и дрожит от прикосновени[ya] твёрдой чешуи.")
				if(P.species.get_bodytype() == SPECIES_TAJ || P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT)
					message = pick("опираетс[ya] на плечи [P], придержива[ya] [P.identifying_gender==FEMALE ? "её" : "его"] и засажива[ya] член всё сильнее и сильнее [P.identifying_gender==FEMALE ? "ей" : "ему"] в глотку.", "трахает [P] в зубастую пасть.", "насаживает голову [P] на свой член.", "держит [P] за голову двум[ya] руками и совершает движени[ya] тазом.", "даёт пощёчины [P], продолжа[ya] ебать [P.identifying_gender == FEMALE ? "бедную кошечку" : "бедного котёнка"] в пасть.", "безжастно пользуетс[ya] глоткой [P].", ", рыча сквозь зубы, нат[ya]гивает глотку [P] на своего малыша.", ", черезмерно увлекшись, тыкает членом мимо рта [P] и дрожит от прикосновени[ya] шерсти.")
				if(P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN)
					message = pick("опираетс[ya] на плечи [P], придержива[ya] [P.identifying_gender==FEMALE ? "её" : "его"] и засажива[ya] член всё сильнее и сильнее [P.identifying_gender==FEMALE ? "ей" : "ему"] в глотку.", "трахает [P] пр[ya]мо в клюв.", "насаживает голову [P] на свой член, стара[ya]сь не порезатьс[ya] о выступы на клюве.", "держит [P] за голову двум[ya] руками и совершает движени[ya] тазом.", "сжимает перь[ya] на голове [P], продолжа[ya] ебать бедную птичку в рот.", "безжастно пользуетс[ya] глоткой [P].", ", рыча сквозь зубы, нат[ya]гивает глотку [P] на своего малыша.", ", черезмерно увлекшись, тыкает членом мимо рта [P] и дрожит от внезапных ощущений.")
				if(P.species.get_bodytype() == SPECIES_PROMETHEAN)
					message = pick("опираетс[ya] на желеобразные плечи [P], придержива[ya] [P.identifying_gender==FEMALE ? "её" : "его"] и засажива[ya] член всё сильнее и сильнее [P.identifying_gender==FEMALE ? "ей" : "ему"] в глотку.", "трахает [P] в рот, зал[ya]пыва[ya] свой член в липкой слизи.", "насаживает голову [P] на свой член.", "держит [P] за голову двум[ya] руками и совершает движени[ya] тазом.", "продолжает ебать [P.identifying_gender == FEMALE ? "бедную слизнедевку" : "бедного слизн[ya]"] в рот.", "безжастно пользуетс[ya] ротиком [P].", ", черезмерно увлекшись, тыкает членом мимо рта [P] и дрожит от внезапных ощущений.", "нещадно насилует глотку [P].")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("бесцеремонно проталкивает свой член [P] в глотку.")
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
				retaliation_message = pick("сильно кусает член [H].", "сжимает зубами член [H], пока не начинает течь кровь.", "злобно смотрит из-под колен [H], скал[ya] окровавленные зубы.", "изо всех сил пытаетс[ya] вырватьс[ya] из-под ног [H].")
				H.visible_message("<font color=red>[P] [retaliation_message]</font>")
				if (prob(5))
					H.apply_damage(20, BRUTE, BP_GROIN)
					blood_splatter(src,H,1)
					retaliation_message = pick("сжимает зубами член [H], а затем отрывает его, пачка[ya]сь в крови!", "прикусывает член [H] и не отпускает, пока он не отрываетс[ya]!", "откусывает член партнёра полностью в попытках вырватьс[ya]!")
					H.visible_message("<font color=red><b>[P] [retaliation_message]</font></b>")
					H.potenzia = -1

/*
MOUNT REWORKED - допилить попарно реакции на взаимодействия рас друг с другом, учитывая в какой роли эта раса - в активной или пассивной.

Кратко: думал сделать систему, которая выбирала бы сообщение не только зависимо от типа тела седлаемого партнёра, но и в зависимости от типа тела седлающего.
Как я полагаю, для этого необходимо прописать попарно взаимодействия рас для каждой из категорий: не_пушистое, пушистое, пернатое, слизеподобное/нано-рой.
Но к сожалению мои познания в коде малы и уместить это в меньшее кол-во строчек кода пока не могу, а тонну кода писать - уже написал.

Да, пилить хохуя, если всё же пилить.

 UPD: В принципе можно было бы ввести переменные, обозначающие "категорию" расы и сделать универсальные сообщения...
...в которых была бы проверка на категории шерсть/перья/латекс/итп и в зависимости от этого вставлялось бы нужное слово-описание.
 */

		if ("mount")

			if(P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_TESHARI || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_PROTEAN || P.species.get_bodytype() == SPECIES_SKRELL)
				message = pick("неумолимо скачет на члене [P]", "прыгает на инструменте [P]", "насаживаетс[ya] на [P]", "сношаетс[ya] с [P]", "прыгает на инструменте [P], сжима[ya] мышцы влагалища")
				if (prob(35))
					message = pick("вгон[ya]ет интрумент [P] в своё влагалище по самые [ya]йца", "скачет на малыше [P], погружа[ya] его в своё лоно", "насаживаетс[ya] писечкой на ствол [P], ввод[ya] его в себ[ya] до упора", "прыгает на инструменте [P], сжима[ya] мышцы влагалища", "скачет на [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в свою щель", "прыгает на [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело", "скачет на члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] член внутри себ[ya]", "двигает тазом по-кругу, сид[ya] на инструменте [P], ласка[ya] его стенками влагалища", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член пульсирующей киской", "набрасывает лоно на крючок [P], дав[ya] на него своим тазом", "двигаетс[ya] вверх-вниз, сид[ya] на зверьке [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно опускаетс[ya] на пенис [P]", "вводит член [P] в свою киску, направл[ya][ya] его рукой", "направл[ya]ет член [P] в свою влажную киску", "чувственно вводит орган [P] в свою мокрую писечку", "запускает зверька [P] в свою промежность")
					H.lastfucked = P
					H.lfhole = hole


			if(P.species.get_bodytype() == SPECIES_TAJ)
				message = pick("неумолимо скачет на шипастом члене [P]", "прыгает на инструменте [P]", "насаживаетс[ya] на [P]", "сношаетс[ya] с [P]", "прыгает на покрытом шипами инструменте [P]")
				if (prob(35))
					message = pick("насаживаетс[ya] писечкой на шипастый ствол [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в себ[ya] до упора", "вгон[ya]ет шипастый интрумент [P] в себ[ya] по самые [ya]йца", "скачет на покрытом шипиками малыше [P], погружа[ya] его в себ[ya]", "скачет на шипастом члене [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в своё лоно", "скачет на [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело", "скачет на покрытом шипами члене, доставл[ya][ya] удовольствие себе и [P]", "насаживаетс[ya] писечкой на шипастый ствол [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в себ[ya] до упора", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] шипастый член внутри себ[ya]", "двигает тазом по-кругу, сид[ya] на шипастом инструменте [P], ласка[ya] его стенками влагалища", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] пульсирующей киской", "набрасывает лоно на крючок [P], дав[ya] на него своим тазом", "двигаетс[ya] вверх-вниз, сид[ya] на шипастом зверьке [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно опускаетс[ya] на шипастый пенис [P]", "вводит покрытый шипами орган [P] в свою киску, направл[ya][ya] его рукой", "рукой направл[ya]ет член [P] в своё влагалище", "чувственно вводит шипастый ствол [P] в свою мокрую киску", "запускает шипастого зверька [P] в свою промежность")
					H.lastfucked = P
					H.lfhole = hole


			if(P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT)
				message = pick("неумолимо скачет на узловатом члене [P]", "прыгает на инструменте [P]", "сношаетс[ya] с [P]", "седлает тело [P] словно наездница", "скачет на [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в себ[ya] до узла")
				if (prob(35))
					message = pick("насаживаетс[ya] писечкой на узловатый ствол [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в себ[ya] до упора", "насаживаетс[ya] на узел [P]", "вгон[ya]ет шипастый интрумент [P] в себ[ya] по самые [ya]йца", "прыгает на узловатом инструменте [P], сжав мышцы влагалища", "скачет на узловатом члене [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в своё лоно", "насаживаетс[ya] на ствол [P] писечкой, ввод[ya] его в себ[ya] до узла", "насаживаетс[ya] на узловатый интрумент [P] по самые [ya]йца", "скачет на малыше [P], дав[ya] половыми губами на узел", "прыгает на [P], каса[ya]сь [P.identifying_gender==FEMALE ? "её" : "его"] узла клитором", "скачет, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] узел внутри себ[ya]", "двигает тазом по-кругу, сид[ya] на узловатом инструменте [P], ласка[ya] его стенками влагалища", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член пульсирующей киской", "насаживаетс[ya] на узел[P], дав[ya] на него сверху", "двигаетс[ya] вверх-вниз, сид[ya] на члене [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно опускаетс[ya] на узловатый пенис [P], ввод[ya] его внутрь", "вводит узловатый орган [P] в свою киску, направл[ya][ya] его рукой", "рукой направл[ya]ет член [P] в своё влагалище", "осторожно вводит ствол [P] в своё нутро", "запускает узловатого зверька [P] в свою промежность")
					H.lastfucked = P
					H.lfhole = hole


			if(P.species.get_bodytype() == SPECIES_UNATHI)
				message = pick("неумолимо скачет на члене [P]", "седлает тело [P], словно наездница", "насаживаетс[ya] на [P]", "сношаетс[ya] с [P]", "двигатетс[ya] вверх-вниз на одном из членов [P]", "скачет на малышах [P]")
				if (prob(35))
					message = pick("насаживаетс[ya] писечкой на ствол [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в себ[ya] до упора", "поочерёдно насаживаетс[ya] на члены [P]", "скачет на обоих отростках [P] сразу, погружа[ya] их в свою киску до упора", "насаживаетс[ya] писечкой на интрументы [P] по самые [ya]йца", "скачет на члене [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в своё лоно", "садитс[ya] на [P], погружа[ya] оба члена в себ[ya] до упора и удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело", "скачет на члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] член внутри себ[ya]", "двигает тазом по-кругу, сид[ya] на инструменте [P], ласка[ya] его стенками влагалища", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член пульсирующей киской", "набрасывает лоно на крючок [P], дав[ya] на него своим тазом", "двигаетс[ya] вверх-вниз, сид[ya] на двойном члене [P]", "насаживаетс[ya] на член [P], дав[ya] на него сверху")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно опускаетс[ya] на один из огранов [P]", "вводит один из органов [P] в свою киску, направл[ya][ya] его рукой", "направл[ya]ет один из членов [P] в свою шахту, помога[ya] себе рукой", "осторожно вводит ствол [P] в своё нутро", "запускает одного из зверьков [P] в свою промежность")
					H.lastfucked = P
					H.lfhole = hole


			if(P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_SERGAL || P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN)
				message = pick("неумолимо скачет на члене [P]", "седлает тело [P], словно наездница", "скачет на члене [P]", "прыгает на инструменте [P]", "насаживаетс[ya] на [P]", "сношаетс[ya] с [P]")
				if (prob(35))
					message = pick("вгон[ya]ет интрумент [P] в своё влагалище по самые [ya]йца", "скачет на малыше [P], погружа[ya] его в своё лоно", "насаживаетс[ya] писечкой на ствол [P], ввод[ya] его в себ[ya] до упора", "прыгает на инструменте [P], сжима[ya] мышцы влагалища", "скачет на [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в свою щель", "прыгает на [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело", "скачет на члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] член внутри себ[ya]", "двигает тазом по-кругу, сид[ya] на инструменте [P], ласка[ya] его стенками влагалища", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член пульсирующей киской", "набрасывает лоно на крючок [P], дав[ya] на него своим тазом", "двигаетс[ya] вверх-вниз, сид[ya] на зверьке [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно опускаетс[ya] на половой орган [P]", "вводит орган [P] в свою киску, направл[ya][ya] его рукой", "направл[ya]ет член [P] в свою влажную киску", "чувственно вводит орган [P] в свою мокрую писечку", "запускает зверька [P] в свою промежность")
					H.lastfucked = P
					H.lfhole = hole


			if(P.species.get_bodytype() == SPECIES_PROMETHEAN)
				message = pick("седлает склизлое тело [P], словно наездница", "насаживаетс[ya] своим склизлым телом на податливый инструмент [P], сжима[ya] его", "насаживаетс[ya] на склизлый член [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в себ[ya]")
				if (prob(35))
					message = pick("насаживаетс[ya] на склизлый интрумент [P] по самые [ya]йца", "неумолимо скачет на [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] склизлый орган в свеб[ya]", "скачет на малыше [P], погружа[ya] его в себ[ya]", "прыгает на [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело", "скачет на члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] член внутри себ[ya]", "двигает тазом по-кругу, сид[ya] на инструменте [P], ласка[ya] его своим нутром", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член своим нутром", "насаживаетс[ya] на ствол [P], дав[ya] на него своим нутром", "двигаетс[ya] вверх-вниз, сид[ya] на склизлом зверьке [P]", "насаживаетс[ya] на склизлый член [P], дав[ya] на него сверху")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно опускаетс[ya] на склизлый половой орган [P]", "плавно вводит склизлый орган [P] внутрь себ[ya]", "вводит ствол [P] в своё нутро", "запускает склизлого зверька [P] в себ[ya]")
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
				message = pick("Вы чувствуете, как вагинальные мышцы [H] начинают резко сокращатьс[ya] вокруг вашего инструмента.", "Вы чувствуете, как ребристые стенки [H] крепко сжимают ваш напр[ya]жённый член.", "Вы чувствуете, как влажна[ya] киска [H] резко сжимает ваш член внутри себ[ya].", "Вы чувствуете, что вашему прибору становитс[ya] тесно внутри гор[ya]чей писечки [H].", "Вы чувствуете, как мышцы внутри разгор[ya]чённой вагины [H] сильно сжимаютс[ya] несколько раз, приближа[ya] вас к оргазму.")
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

			message = pick("скачет на члене [P]", "прыгает на инструменте [P]", "насаживаетс[ya] на [P]")
			if (prob(35))
				message = pick("седлает тело [P], словно наездница", "скачет на малыше [P]", "прыгает на [P], удар[ya][ya]сь о его тело", "радостно подпрыгивает, доставл[ya][ya] удовольствие себе и [P]", "уперлась тазом в [P] и елозит, держа его член внутри", "двигает тазом по-кругу, сид[ya] на инструменте [P]", "вприпрыжку наваливаетс[ya] на [P], вз[ya]в внутрь его член", "набрасывает своё лоно на крючок [P], дав[ya] на него своим тазом", "впускает внутрь себ[ya] зверька [P]")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("осторожно насаживаетс[ya] на половой орган [P]", "направл[ya]ет член [P] в свою влажную киску, помога[ya] себе рукой", "медленно вводит в себ[ya] ствол [P]")
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
				message = pick("Вы чувствуете, как вагинальные мышцы [H] начинают резко сокращатьс[ya] вокруг вашего инструмента.", "Вы чувствуете, как ребристые стенки [H] крепко сжимают ваш напр[ya]жённый член.", "Вы чувствуете, как влажна[ya] киска [H] резко сжимает ваш член внутри себ[ya].", "Вы чувствуете, что вашему прибору становитс[ya] тесно внутри гор[ya]чей писечки [H].", "Вы чувствуете, как мышцы внутри разгор[ya]чённой вагины [H] сильно сжимаютс[ya] несколько раз, приближа[ya] вас к оргазму.")
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

			message = pick("трётс[ya] о член [P]", "трётс[ya] об инструмент [P]", "стимулирует член [P] своей киской")
			if (prob(35))
				message = pick("елозит половыми губами по члену [P] в позе наездницы", "натирает малыша [P], крепко уперевшись тазом", "в ускоренном темпе совершает фрикции, натира[ya] клитор о член [P]", "трахает половой орган, прижатый к животу [P.identifying_gender==FEMALE ? "партнёрши" : "партнёра"], доставл[ya][ya] удовольствие себе и [P]", "уперлась тазом в [P] и елозит", "двигает тазом по-кругу, трением стимулиру[ya] инструмент [P]", "водит головкой члена [P] между половых губ, помога[ya] себе рукой", "трётс[ya] о крючок [P] на месте, дав[ya] на неё своим тазом", "стимулирует клитор о зверька [P]")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("осторожно садитс[ya] промежностью на половой орган, прижима[ya] его к животу [P]", "придерживает член [P] рукой в положении у живота [P.identifying_gender==FEMALE ? "партнёрши" : "партнёра"], после чего садитс[ya] влажной писечкой на ствол", "медленно садитс[ya] на [P] и зажимает [P.identifying_gender==FEMALE ? "её" : "его"] член между своих половых губ")
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

			message = pick("трётс[ya] своей киской о половые губы [P]", "надавливает киской на вагину [P]", "трётс[ya] о киску [P]", "трахает [P], заставл[ya][ya] их киски теретьс[ya] друг о друга")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("прижимает свою киску к киске [P]")
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
				message = pick("сношает себ[ya] в зад ограном [P], насажива[ya]сь на него", "чувственно сношает себ[ya] членом [P]", "прыгает задом на инструменте [P], сжав анальное колечко", "насаживаетс[ya] анусом на ствол [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в пр[ya]мую кишку")
				if (prob(35))
					message = pick("вгон[ya]ет интрумент [P] в свой зад по самые [ya]йца", "неумолимо скачет на члене [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в свой зад", "скачет на малыше [P], погружа[ya] его в свою кишку", "прыгает на члене [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело", "скачет на члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] член внутри себ[ya]", "двигает тазом по-кругу, сид[ya] задом на инструменте [P], ласка[ya] его нутром", "вприпрыжку наваливаетс[ya] на [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член в пр[ya]мую кишку до упора", "насаживаетс[ya] на пенис [P], дав[ya] на него своим тазом", "двигаетс[ya] вверх-вниз, сид[ya] задом на зверьке [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] задницей головку на гузнотёра [P], ввод[ya] её внутрь", "осторожно вводит головку органа [P] в свой задний проход", "направл[ya]ет головку члена [P] в свою попку, помога[ya] себе рукой", "осторожно вводит головку ствола [P] в свою пр[ya]мую кишку", "запускает головку зверька [P] в свою пр[ya]мую кишку", "запускает шахтёра [P] в свои угольные шахты")
					H.lastfucked = P
					H.lfhole = hole


	// Basics + taj

			if(P.species.get_bodytype() == SPECIES_TAJ && H.species.get_bodytype() != SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_PROMETHEAN)
				message = pick("неумолимо скачет на шипастом члене [P], погружа[ya] его орган в свой зад", "чувственно сношает себ[ya] шипастым членом [P]", "прыгает задом на пупырчатом инструменте [P], сжав анальное колечко")
				if (prob(35))
					message = pick("насаживаетс[ya] анусом на шипастый ствол [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в пр[ya]мую кишку до упора", "вгон[ya]ет шипастый интрумент [P] в свой зад по самые [ya]йца", "скачет на покрытом шипиками малыше [P], погружа[ya] его в себ[ya]", "скачет на члене [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело", "скачет задницей на покрытом шипами члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] покрытый шипами пенис внутри себ[ya]", "двигает тазом по-кругу, сид[ya] задом на шипастом инструменте [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член стенками пр[ya]мой кишки", "вприпрыжку наваливаетс[ya] на [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] покрытый шипами член в пр[ya]мую кишку до упора", "насаживаетс[ya] на шипастый пенис [P], дав[ya] на него своим тазом", "двигаетс[ya] вверх-вниз, сид[ya] задом на пушистом зверьке [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] анусом на головку шипастого гузнотёра [P], ввод[ya] её внутрь", "осторожно вводит покрытую шипиками головку [P] в свой задний проход", "направл[ya]ет шипастую головку члена [P] в свою попку, помога[ya] себе рукой", "осторожно вводит шипастый ствол [P] в свою пр[ya]мую кишку", "запускает шипастого зверька [P] в свою пр[ya]мую кишку", "запускает колючего шахтёра [P] в свои угольные шахты")
					H.lastfucked = P
					H.lfhole = hole

	// Basics + vulps

			if(P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT && H.species.get_bodytype() != SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_PROMETHEAN)
				message = pick("сношает себ[ya] в зад ограном [P], насажива[ya]сь на него", "чувственно сношает себ[ya] узловатым членом [P]", "неумолимо скачет на члене [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в свой зад до узла", "прыгает на узловатом инструменте [P], сжав анальное колечко", "насаживаетс[ya] анусом на ствол [P], ввод[ya] его в пр[ya]мую кишку")
				if (prob(35))
					message = pick("насаживаетс[ya] задницей на оканчивающийс[ya] узлом интрумент [P] по самые [ya]йца", "скачет на малыше [P], погружа[ya] его в свой зад и дав[ya] анаьным колечком на узел", "скачет на узловатом члене [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело", "прыгает на члене [P], каса[ya]сь [P.identifying_gender==FEMALE ? "её" : "его"] узла сфинктером", "скачет, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] узел внутри себ[ya]", "двигает тазом по-кругу, сид[ya] задом на инструменте [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член стенками пр[ya]мой кишки", "наваливаетс[ya] на [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] узловатый член в пр[ya]мую кишку до упора", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член пр[ya]мой кишкой", "садитс[ya] на узел [P], дав[ya] на него своим тазом", "двигаетс[ya] вверх-вниз, сид[ya] задом пушистом зверьке [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] анусом на кончик узловатого гузнотёра [P], ввод[ya] его внутрь", "осторожно вводит кончик узловатого органа [P] в свой задний проход", "направл[ya]ет узловатый член [P] в свою попку, помога[ya] себе рукой", "осторожно вводит ствол [P] в свою пр[ya]мую кишку до узла", "запускает узловатого зверька [P] в свою пр[ya]мую кишку", "запускает шахтёра [P] в свои угольные шахты")
					H.lastfucked = P
					H.lfhole = hole

	// Basics + unathi ------- сделать вариации и кнопки на 1 и 2 члена

			if(P.species.get_bodytype() == SPECIES_UNATHI && H.species.get_bodytype() != SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_PROMETHEAN)
				message = pick("сношает себ[ya] в зад ограном [P], насажива[ya]сь на него", "чувственно сношает себ[ya] одним из членов [P]", "неумолимо скачет на одном из членов [P], погружа[ya] его в свой зад, заставл[ya][ya] второй теретьс[ya] о спину", "скачет на одном из членов [P], погружа[ya] его в свой зад, заставл[ya][ya] второй теретьс[ya] о свою промежность", "двигатет задом вверх-вниз на одном из членов [P], сжав анальное колечко", "скачет на малыше [P], погружа[ya] его в свой зад")
				if (prob(35))
					message = pick("поочерёдно насаживаетс[ya] анальным отверстием на члены [P], ввод[ya] их в пр[ya]мую кишку", "скачет на обоих отростках [P], погружа[ya] их в свой зад до упора", "насаживаетс[ya] на интрументы [P] задницей по самые [ya]йца", "прыгает на [P], погружа[ya] оба члена в пр[ya]мую кишку и удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело", "скачет на члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] член внутри себ[ya]", "двигает тазом по-кругу, сид[ya] задом на инструменте [P], ласка[ya] его нутром", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член стенками пр[ya]мой кишки", "насаживаетс[ya] на пенис [P], дав[ya] на него своим тазом", "двигаетс[ya] вверх-вниз, сид[ya] погружа[ya] двойной член в свою кишку [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] анусом на одного из гузнотёров [P], ввод[ya] его внутрь", "осторожно вводит орган [P] в свой задний проход", "направл[ya]ет один из членов [P] в свою попку, помога[ya] себе рукой", "осторожно вводит ствол [P] в свою пр[ya]мую кишку", "запускает одного из зверьков [P] в свою пр[ya]мую кишку", "запускает зме[ya] [P] в свои угольные шахты")
					H.lastfucked = P
					H.lfhole = hole

	// Basics + akula sergal vox

			if(P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_SERGAL || P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN && H.species.get_bodytype() != SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_PROMETHEAN)
				message = pick("сношает себ[ya] в зад ограном [P], насажива[ya]сь на него", "прыгает задом на инструменте [P], сжав анальное колечко", "чувственно сношает себ[ya] членом [P]", "насаживаетс[ya] анусом на ствол [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в пр[ya]мую кишку")
				if (prob(35))
					message = pick("вгон[ya]ет интрумент [P] в свой зад по самые [ya]йца", "неумолимо скачет на члене [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в свой зад", "скачет на малыше [P], погружа[ya] его в свою кишку", "прыгает на члене [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело", "скачет на члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] член внутри себ[ya]", "двигает тазом по-кругу, сид[ya] задом на инструменте [P], ласка[ya] его нутром", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член стенками пр[ya]мой кишки", "насаживаетс[ya] на пенис [P], дав[ya] на него своим тазом", "двигаетс[ya] вверх-вниз, сид[ya] задом на зверьке [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] задницей головку на гузнотёра [P], ввод[ya] её внутрь", "осторожно вводит головку органа [P] в свой задний проход", "направл[ya]ет головку члена [P] в свою попку, помога[ya] себе рукой", "осторожно вводит головку ствола [P] в свою пр[ya]мую кишку", "запускает головку зверька [P] в свою пр[ya]мую кишку", "запускает шахтёра [P] в свои угольные шахты")
					H.lastfucked = P
					H.lfhole = hole

	// Basics + teshari





//Teshari

	//P.Teshari + basics
			if(P.species.get_bodytype() == SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_TESHARI && H.species.get_bodytype() != SPECIES_PROMETHEAN)
				message = pick("сношает себ[ya] в зад, насажива[ya]сь на огран [P]", "прыгает задом на инструменте [P], сжав анальное колечко", "чувственно сношает себ[ya] членом [P]")
				if (prob(35))
					message = pick("насаживаетс[ya] анальным отверстием на член [P]", "неумолимо скачет на члене [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в свой зад", "скачет на малыше [P], погружа[ya] его в свой анус", "прыгает на члене [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело задом", "скачет на члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] член внутри пр[ya]мой кишки", "чувственно двигает тазом по-кругу, сид[ya] задом на инструменте [P], ласка[ya] его нутром", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член стенками пр[ya]мой кишки", "насаживаетс[ya] анальным колечком на ствол [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в пр[ya]мую кишку до упора", "двигаетс[ya] вверх-вниз, сид[ya] на зверьке [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] анусом на гузнотёра [P], ввод[ya] его внутрь", "осторожно вводит орган [P] в свой задний проход", "направл[ya]ет член [P] в свою попку, помога[ya] себе рукой", "осторожно вводит ствол [P] в свою пр[ya]мую кишку", "запускает зверька [P] в свою пр[ya]мую кишку", "запускает шахтёра [P] в свои угольные шахты")
					H.lastfucked = P
					H.lfhole = hole

	//H.Teshari + humans or tesharis
			if((H.species.get_bodytype() == SPECIES_TESHARI) && (P.species.get_bodytype() == SPECIES_TESHARI || P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_PROTEAN || P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_SERGAL || P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN))
				message = pick("сношает себ[ya], насажива[ya]сь клоакой на огран [P]", "прыгает задом на инструменте [P], сжав клоаку")
				if (prob(35))
					message = pick("насаживаетс[ya] отверстием клоаки на член [P]", "неумолимо скачет на члене [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в свою клоаку", "прыгает на члене [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело задом", "скачет на члене, доставл[ya][ya] удовольствие себе и [P]", "чувственно двигает тазом по-кругу, сид[ya] задом на инструменте [P], ласка[ya] его своим нутром", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] член внутри клоаки", "чувственно сношает себ[ya] членом [P]", "двигаетс[ya] вверх-вниз, сид[ya] на зверьке [P]", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член стенками клоаки", "насаживаетс[ya] колечком клоаки на ствол [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в кишку до упора")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] клоакой на головку гузнотёра [P], ввод[ya] её внутрь", "осторожно вводит окончание органа [P] в свою клоаку", "направл[ya]ет член [P] в свою клоаку, помога[ya] себе рукой", "осторожно вводит кончик ствола [P] в свою клоаку", "запускает кончик зверька [P] в свою клоаку", "запускает шахтёра [P] в свои шахты")
					H.lastfucked = P
					H.lfhole = hole

	//H.Teshari + tajara
			if(H.species.get_bodytype() == SPECIES_TESHARI && P.species.get_bodytype() == SPECIES_TAJ)
				message = pick("сношает себ[ya] в клоаку, насажива[ya]сь на покрытый шипиками огран [P]", "прыгает задом на шипастом инструменте [P], сжав клоаку", "чувственно сношает себ[ya] членом [P]")
				if (prob(35))
					message = pick("насаживаетс[ya] отверстием клоаки на шипастый член [P]", "неумолимо скачет на члене [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в свою клоаку", "прыгает на члене [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело задом", "скачет на члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] член внутри клоаки", "чувственно двигает тазом по-кругу, сид[ya] на шипастом инструменте [P], ласка[ya] его своим нутром", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] шипастый член стенками клоаки", "насаживаетс[ya] колечком клоаки на ствол [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в кишку до упора", "двигаетс[ya] вверх-вниз, сид[ya] на покрытом шипами зверьке [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] клоакой на головку покрытого шипами гузнотёра [P], ввод[ya] её внутрь", "осторожно вводит окончание шипастого органа [P] в свою клоаку", "направл[ya]ет шипастый член [P] в свою клоаку, помога[ya] себе рукой", "осторожно вводит кончик ствола [P] в свою клоаку", "запускает кончик шипастого зверька [P] в свою клоаку", "запускает шахтёра [P] в свои шахты")
					H.lastfucked = P
					H.lfhole = hole

	//H.Teshari + unathi ------- сделать вариации и кнопки на 1 и 2 члена
			if(H.species.get_bodytype() == SPECIES_TESHARI && P.species.get_bodytype() == SPECIES_UNATHI)
				message = pick("сношает себ[ya] в клоаку, насажива[ya]сь на огран [P]", "прыгает задом на инструменте [P], сжав отверстие клоаки", "чувственно сношает себ[ya] членом [P]")
				if (prob(35))
					message = pick("поочерёдно насаживаетс[ya] клоакой на члены [P], ввод[ya] их в кишку","насаживаетс[ya] клоакой на один из членов [P], оставл[ya][ya] второй теретьс[ya] о лобок", "насаживаетс[ya] на один из членов [P] клоакой, оставл[ya][ya] второй теретьс[ya] о подхвостье", "неумолимо скачет на одном из отростков [P]", "скачет на одном из членов, доставл[ya][ya] удовольствие себе и [P]", "чувственно двигает тазом по-кругу, сид[ya] задом на инструменте [P], ласка[ya] его своим нутром", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] члены клоакой", "двигаетс[ya] вверх-вниз, сид[ya] на зверьке [P]")
				else if (prob(20))
					message = pick("насаживаетс[ya] колечком клоаки на стволы [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] органы в кишку до упора", "радостно прыгает на обоих отростках [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело задом", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] члены внутри клоаки", "насаживаетс[ya] клоакой на стволы [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] органы в себ[ya] до упора")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] клоакой на головку одного из гузнотёров [P], ввод[ya] её внутрь", "осторожно вводит окончание органа [P] в свою клоаку", "направл[ya]ет член [P] в свою клоаку, помога[ya] себе рукой", "осторожно вводит кончик ствола [P] в свою клоаку", "запускает кончик зверька [P] в свою клоаку", "запускает шахтёра [P] в свои шахты")
					H.lastfucked = P
					H.lfhole = hole

	//H.Teshari + vulps
			if((H.species.get_bodytype() == SPECIES_TESHARI) && (P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_HIGH || P.species.get_bodytype() == SPECIES_ZORREN_FLAT))
				message = pick("сношает себ[ya] в клоаку, насажива[ya]сь на узловатый огран [P]", "прыгает задом на узловатом инструменте [P], сжав отверстие клоаки", "чувственно сношает себ[ya] членом [P]")
				if (prob(35))
					message = pick("насаживаетс[ya] отверстием клоаки на узловатый член [P]", "прыгает на члене [P], надавлива[ya] на [P.identifying_gender==FEMALE ? "её" : "его"] узел клоакой", "скачет на члене, доставл[ya][ya] удовольствие себе и [P]", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член анусом", "двигаетс[ya] вверх-вниз, сид[ya] на зверьке [P]")
				else if (prob(20))
					message = pick("[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] член внутри клоаки", "неумолимо скачет на члене [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в свою клоаку до узла", "насаживаетс[ya] клоакой на ствол [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в кишку до упора", "чувственно двигает тазом по-кругу, сид[ya] на узловатом инструменте [P], ласка[ya] его своим нутром")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] клоакой на кончик узловатого гузнотёра [P], ввод[ya] его внутрь", "осторожно вводит окончание узловатого органа [P] в свою клоаку", "направл[ya]ет член [P] в свою клоаку, помога[ya] себе рукой", "осторожно вводит кончик узловатого ствола [P] в свою клоаку", "запускает кончик узловатого зверька [P] в свою клоаку", "запускает шахтёра [P] в свои шахты")
					H.lastfucked = P
					H.lfhole = hole

	//H.Teshari + prometheans
			if(H.species.get_bodytype() == SPECIES_TESHARI && P.species.get_bodytype() == SPECIES_PROMETHEAN)
				message = pick("сношает себ[ya] в клоаку склизлым ограном [P]", "прыгает задом на склизлом инструменте [P], сжав клоаку", "скачет на склизлом малыше [P]", "двигаетс[ya] вверх-вниз, сид[ya] клоакой на слизи [P]", "чувственно сношаетс[ya] с [P]")
				if (prob(35))
					message = pick("вгон[ya]ет скользкий интрумент [P] в свою кишку по самые [ya]йца", "насаживаетс[ya] колечском клоаки на склизлый отросток [P], ввод[ya] его в пр[ya]мую кишку до упора", "неумолимо скачет на [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] склизлый орган в свою клоаку", "прыгает на члене [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] желейное тело", "скачет на желеобразном члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] склизлый член внутри себ[ya]", "двигает тазом по-кругу, сид[ya] задом на инструменте [P], ласка[ya] его нутром", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член стенками кишечника", "насаживаетс[ya] на пенис [P], дав[ya] на него своим тазом")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] на кончик желейного гузнотёра [P], ввод[ya] его внутрь", "осторожно вводит склизлый орган [P] в свою кишку", "направл[ya]ет склизлый отросток [P] в свою клоаку, помога[ya] себе рукой", "осторожно вводит ствол [P] в свою клоаку", "запускает желейного зверька [P] в свой кишечник", "запускает шахтёра [P] в свои угольные шахты")
					H.lastfucked = P
					H.lfhole = hole

//Prometheans

	//P.Prometheans + basics

			if((P.species.get_bodytype() == SPECIES_PROMETHEAN) && (H.species.get_bodytype() != SPECIES_PROMETHEAN && H.species.get_bodytype() != SPECIES_TESHARI))
				message = pick("сношает себ[ya] в зад склизлым ограном [P]", "неумолимо скачет на [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] склизлый орган в свой зад", "прыгает задом на склизлом инструменте [P], сжав анальное колечко", "чувственно сношает себ[ya] склизлым членом [P]")
				if (prob(35))
					message = pick("вгон[ya]ет скользкий интрумент [P] в свой зад", "скачет на склизлом малыше [P], погружа[ya] его в свой зад", "прыгает на [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] желейное тело", "насаживаетс[ya] анальным отверстием на склизлый отросток [P], ввод[ya] его в пр[ya]мую кишку до упора", "скачет на желеобразном члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] склизлый член внутри себ[ya]", "двигает тазом по-кругу, сид[ya] задом на инструменте [P], ласка[ya] его нутром", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член пр[ya]мой кишкой", "насаживаетс[ya] на пенис [P], дав[ya] на него своим тазом", "двигаетс[ya] вверх-вниз, сид[ya] задом на слизи [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] задницей на кончик желейного гузнотёра [P], ввод[ya] его внутрь", "осторожно вводит орган [P] в свой задний проход", "направл[ya]ет склизлый отросток [P] в свою шахту, помога[ya] себе рукой", "осторожно вводит ствол [P] в свою пр[ya]мую кишку", "запускает желейного зверька [P] в свою пр[ya]мую кишку", "запускает шахтёра [P] в свои угольные шахты")
					H.lastfucked = P
					H.lfhole = hole

	//H.Prometheans + basics

			if((H.species.get_bodytype() == SPECIES_PROMETHEAN) && (P.species.get_bodytype() == SPECIES_HUMAN || P.species.get_bodytype() == SPECIES_TESHARI || P.species.get_bodytype() == SPECIES_HUMAN_VATBORN || P.species.get_bodytype() == SPECIES_RAPALA || P.species.get_bodytype() == SPECIES_VASILISSAN || P.species.get_bodytype() == SPECIES_PROTEAN || P.species.get_bodytype() == SPECIES_AKULA || P.species.get_bodytype() == SPECIES_SERGAL || P.species.get_bodytype() == SPECIES_VOX || P.species.get_bodytype() == SPECIES_NEVREAN))
				message = pick("сношаетс[ya], насажива[ya]сь склизлым телом на огран [P]", "прыгает склизлым задом на инструменте [P]", "чувственно сжимает нутром член [P]")
				if (prob(35))
					message = pick("насаживаетс[ya]склизлым телом на член [P]", "неумолимо скользит на члене [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в своё тело", "скачет на малыше [P], погружа[ya] его внутрь себ[ya]", "прыгает на члене [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело задом", "скачет на члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] член внутри склизлого тела", "чувственно скользит тазом по-кругу, сид[ya] на инструменте [P], ласка[ya] его нутром", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член слизью", "насаживаетс[ya] на ствол [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в себ[ya] до упора", "двигаетс[ya] вверх-вниз, сид[ya] на зверьке [P]")
				else if(prob(5))
					message = pick("насаживаетс[ya] на член [P] до [ya]иц, слегка проника[ya] в уретру [P] своей слизью", "вбирает в себ[ya] зверька [P], слегка проникнув в головку слизью")
				else if(prob(0.3))
					message = pick("резко падает на член [P] - вгон[ya][ya] его в себ[ya] до основани[ya] - и глубоко проскальзывает слизью в уретру", "нежно сжав зверька [P], глубоко проскальзывает в него слизью")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] желейным телом на гузнотёра [P], ввод[ya] его внутрь", "обволакивает орган [P] вбира[ya] его в себ[ya]", "направл[ya]ет член [P] рукой в своё склизлое тело, обволакива[ya]", "осторожно вводит ствол [P] в свою слизь", "запускает зверька [P] в своё склизлое тело")
					H.lastfucked = P
					H.lfhole = hole


	//H.Prometheans + taj
			if(H.species.get_bodytype() == SPECIES_PROMETHEAN && P.species.get_bodytype() == SPECIES_TAJ)
				message = pick("сношаетс[ya], насажива[ya]сь склизлым телом на шипастый огран [P]", "прыгает склизлым телом на покрытом шипами инструменте [P]", "чувственно сжимает нутром шипастый член [P]")
				if (prob(35))
					message = pick("насаживаетс[ya]склизлым телом на шипастый ствол [P]", "неумолимо скользит на шипастом члене [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в своё тело", "скачет на малыше [P], погружа[ya] его внутрь себ[ya]", "прыгает на покрытом шипами члене [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело задом", "скачет на члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] шипастый член внутри склизлого тела", "чувственно скользит тазом по-кругу, сид[ya] на покрытом шипами инструменте [P], ласка[ya] его нутром", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член слизью", "насаживаетс[ya] на покрытый шипами ствол [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в себ[ya] до упора", "двигаетс[ya] вверх-вниз, сид[ya] на шипастом зверьке [P]")
				else if(prob(5))
					message = pick("насаживаетс[ya] на шипастый интрумент [P] по самые [ya]йца, слегка проника[ya] в уретру [P] своей слизью", "вбирает в себ[ya] шипастого зверька [P], слегка проникнув в головку слизью")
				else if(prob(0.3))
					message = pick("резко падает на член [P] - вгон[ya][ya] его в себ[ya] до основани[ya] - и глубоко проскальзывает слизью в уретру", "нежно сжав шипастого зверька [P], глубоко проскальзывает в него слизью")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] желейным телом на шипастого гузнотёра [P], ввод[ya] его внутрь", "обволакивает покрытый шипами орган [P], вбира[ya] его в себ[ya]", "направл[ya]ет член [P] рукой в своё склизлое тело, обволакива[ya]", "осторожно вводит ствол [P] в свою слизь", "запускает зверька [P] в своё склизлое тело")
					H.lastfucked = P
					H.lfhole = hole

	//H.Prometheans + unathi ------- сделать вариации и кнопки на 1 и 2 члена

			if(H.species.get_bodytype() == SPECIES_PROMETHEAN && P.species.get_bodytype() == SPECIES_UNATHI)
				message = pick("сношаетс[ya], насажива[ya]сь склизлым телом на один из членов [P]", "прыгает склизлым телом на инструменте [P]", "чувственно сжимает нутром один член [P]", "скачет на двух членах [P] сразу")
				//1 dick
				if (prob(35))
					message = pick("неумолимо скользит на члене [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в своё тело", "скачет на малыше [P], погружа[ya] его внутрь себ[ya]", "прыга[ya] и удар[ya][ya]сь о тело [P] скользит на его члене", "скачет на одном из отростков, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] орган внутри своего склизлого тела", "чувственно скользит тазом по-кругу, сид[ya] на одном из инструментов [P], ласка[ya] его нутром", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член слизью", "насаживаетс[ya] на ствол [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в себ[ya] до упора", "двигаетс[ya] вверх-вниз, сид[ya] на зверьке [P]")
				else if(prob(5))
					message = pick("насаживаетс[ya] на один из членов [P], немного проникнув своей слизью в его уретру", "вбирает в себ[ya] одного зверька [P], слегка проникнув в головку слизью")
				else if(prob(0.3))
					message = pick("резко падает на один из членов [P] - вгон[ya][ya] его в себ[ya] до основани[ya] - и глубоко проскальзывает слизью в уретру", "нежно сжав зверька [P], глубоко проскальзывает в него слизью")
				//2 dicks
				else if (prob(20))
					message = pick("насаживаетс[ya]склизлым телом на двуствольный член [P]", "неумолимо скользит на членах [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] органы в своё тело", "скачет на малышах [P], погружа[ya] их внутрь себ[ya]", "прыга[ya] и удар[ya][ya]сь о тело [P] скользит на его членах", "скачет на членах, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа оба [P.identifying_gender==FEMALE ? "её" : "его"] органа внутри своего склизлого тела", "чувственно скользит тазом по-кругу, сид[ya] на инструментах [P], ласка[ya] их нутром", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] члены слизью", "насаживаетс[ya] на стволы [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] органы в себ[ya] до упора", "двигаетс[ya] вверх-вниз, сид[ya] на зверьках [P]")
				else if(prob(3))
					message = pick("насаживаетс[ya] на оба интрумента [P] до конца, чуть-чуть проникнув слизью в уретру", "вбирает в себ[ya] обоих зверьков [P], слегка проника[ya] в головки слизью")
				else if(prob(0.3))
					message = pick("резко падает на оба интрумента [P] - вгон[ya][ya] их в себ[ya] до основани[ya] - и глубоко проскальзывает слизью в уретру", "нежно сжав зверьков [P], глубоко проскальзывает в них слизью")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] желейным телом на гузнотёра [P], ввод[ya] его внутрь", "обволакивает органы [P], вбира[ya] их в себ[ya]", "направл[ya]ет члены [P] рукой в своё склизлое тело, обволакива[ya]", "осторожно вводит ствол [P] в свою слизь", "запускает зверьков [P] в своё склизлое тело")
					H.lastfucked = P
					H.lfhole = hole

	//H.Prometheans + vulps

			if((H.species.get_bodytype() == SPECIES_PROMETHEAN) && (P.species.get_bodytype() == SPECIES_VULPKANIN || P.species.get_bodytype() == SPECIES_ZORREN_FLAT || P.species.get_bodytype() == SPECIES_ZORREN_HIGH))
				message = pick("сношаетс[ya], насажива[ya]сь склизлым телом на узловатый огран [P]", "прыгает склизлым телом на узловатом инструменте [P]", "чувственно сжимает нутром узел члена [P]")
				if (prob(35))
					message = pick("насаживаетс[ya]склизлым телом на узловатый ствол [P]", "неумолимо скользит на узловатом члене [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в своё тело", "скачет на малыше [P], погружа[ya] его внутрь себ[ya]", "прыгает на узловатом члене [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело задом", "скачет на члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] при[ya]тно отт[ya]гива[ya] член за узел", "чувственно скользит тазом по-кругу, сид[ya] на инструменте [P], ласка[ya] его узел нутром", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член слизью", "насаживаетс[ya] на ствол [P], ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в себ[ya] до упора", "двигаетс[ya] вверх-вниз, сид[ya] на узловатом зверьке [P]")
				else if(prob(5))
					message = pick("насаживаетс[ya] на узловатый интрумент [P] по самые [ya]йца, слегка проникнув в уретру [P] своей слизью", "вбирает в себ[ya] зверька [P], слегка проника[ya] в головку слизью")
				else if(prob(0.3))
					message = pick("резко падает на один из членов [P] - вгон[ya][ya] его в себ[ya] до основани[ya] - и глубоко проскальзывает слизью в уретру", "нежно сжав узел зверька [P], глубоко проскальзывает в него слизью")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("садитс[ya] желейным телом на узловатого гузнотёра [P], ввод[ya] его внутрь", "обволакивает узловатый орган [P], вбира[ya] его в себ[ya]", "направл[ya]ет член [P] рукой в своё склизлое тело, обволакива[ya]", "осторожно вводит ствол [P] в свою слизь", "запускает зверька [P] в своё склизлое тело")
					H.lastfucked = P
					H.lfhole = hole

	//H.Prometheans + prometheans
			if(H.species.get_bodytype() == SPECIES_PROMETHEAN && P.species.get_bodytype() == SPECIES_PROMETHEAN)
				message = pick("чувственно сплетаетс[ya] слизью с [P]", "неумолимо скачет на [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] склизлый орган в свой склизлый зад", "прыгает на склизлом инструменте [P], хлюпа[ya]")
				if (prob(35))
					message = pick("вгон[ya]ет скользкий интрумент [P] в свой зад по самые [ya]йца", "скачет на склизлом малыше [P], погружа[ya] его в свой зад", "прыгает на [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] желейное тело", "скачет на желеобразном члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] склизлый член внутри себ[ya]", "двигает тазом по-кругу, сид[ya] задом на инструменте [P], ласка[ya] его нутром", "вприпрыжку наваливаетс[ya] на [P]", "насаживаетс[ya] на пенис [P], дав[ya] на него своим тазом", "двигаетс[ya] вверх-вниз, сид[ya] задом на слизи [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] своей желейной задницей на желейного гузнотёра [P], вбира[ya] его внутрь", "осторожно вбирает орган [P] в себ[ya]", "направл[ya]ет склизлый отросток [P] в свою желейную шахту, помога[ya] себе рукой", "осторожно вводит ствол [P] в своё склизлое тело", "запускает желейного зверька [P] в своё склизлое тело")
					H.lastfucked = P
					H.lfhole = hole

/*
			if(P.species.get_bodytype() != SPECIES_PROMETHEAN && H.species.get_bodytype() == SPECIES_PROMETHEAN && H.species.get_bodytype() != SPECIES_TESHARI)
				message = pick("сношает себ[ya] в зад склизлым ограном [P]", "неумолимо скачет на [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] склизлый орган в свой зад", "прыгает задом на склизлом инструменте [P], сжав анальное колечко", "чувственно сношает себ[ya] склизлым членом [P]")
				if (prob(35))
					message = pick("вгон[ya]ет скользкий интрумент [P] в свой зад по самые [ya]йца", "скачет на склизлом малыше [P], погружа[ya] его в свой зад", "прыгает на [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] желейное тело", "насаживаетс[ya] анальным отверстием на склизлый отросток [P], ввод[ya] его в пр[ya]мую кишку до упора", "скачет на желеобразном члене, доставл[ya][ya] удовольствие себе и [P]", "[H.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] склизлый член внутри себ[ya]", "двигает тазом по-кругу, сид[ya] задом на инструменте [P], ласка[ya] его нутром", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член пр[ya]мой кишкой", "насаживаетс[ya] на пенис [P], дав[ya] на него своим тазом", "двигаетс[ya] вверх-вниз, сид[ya] задом на слизи [P]")
				else if (prob(5))
					message = pick("насаживаетс[ya] на интрумент [P] по самые [ya]йца, слеггка проника[ya] в уретру [P]", "насаживаетс[ya] на интрумент [P] по самые [ya]йца, глубоко проника[ya] в уретру [P]")

				if (H.lastfucked != P || H.lfhole != hole)
					message = pick("медленно садитс[ya] задницей на кончик желейного гузнотёра [P], ввод[ya] его внутрь", "осторожно вводит орган [P] в свой задний проход", "направл[ya]ет склизлый отросток [P] в свою шахту, помога[ya] себе рукой", "осторожно вводит ствол [P] в свою пр[ya]мую кишку", "запускает желейного зверька [P] в свою пр[ya]мую кишку", "запускает шахтёра [P] в свои угольные шахты")
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
					message = pick("Вы чувствуете, как сфинктер [H] начинает резко сокращатьс[ya] вокруг вашего инструмента.", "Вы чувствуете, как сфинктер [H] крепко сжимают ваш напр[ya]жённый член, пульсиру[ya].", "Вы чувствуете, как кишечник [H] м[ya]гко сжимаетс[ya] вокруг вашего члена.", "Вы чувствуете, как напрн[ya]гс[ya] сфинктер [H], удержива[ya] ваш член внутри пр[ya]мой кишки.", "Вы чувствуете, как мышцы сфинктера [H] сильно сжимаютс[ya] несколько раз, приближа[ya] вас к оргазму.")
				else if(H.species.get_bodytype() == SPECIES_PROMETHEAN)
					message = pick("Вы чувствуете, как нутро [H] начинает резко сокращатьс[ya] вокруг вашего инструмента.", "Вы чувствуете, как слизь [H] крепко сжимают ваш напр[ya]жённый член, пульсиру[ya].", "Вы чувствуете, как внутренности [H] м[ya]гко сжимаютс[ya] вокруг вашего члена.", "Вы чувствуете, как напрн[ya]гс[ya] нутро [H], удержива[ya] ваш член внутри себ[ya].", "Вы чувствуете, как нутро [H] сильно сжимаетс[ya] несколько раз, приближа[ya] вас к оргазму.")
				else if(H.species.get_bodytype() == SPECIES_TESHARI)
					message = pick("Вы чувствуете, как клоака [H] начинает резко сокращатьс[ya] вокруг вашего инструмента.", "Вы чувствуете, как клоака [H] крепко сжимают ваш напр[ya]жённый член, пульсиру[ya].", "Вы чувствуете, как кишечник [H] м[ya]гко сжимаетс[ya] вокруг вашего члена.", "Вы чувствуете, как напрн[ya]гс[ya] клоака [H], удержива[ya] ваш член внутри кишки.", "Вы чувствуете, как мышцы клоаки [H] сильно сжимаютс[ya] несколько раз, приближа[ya] вас к оргазму.")
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

			message = pick("скачет на члене [P], погружа[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в свой зад", "прыгает задом на инструменте [P], сжав анус", "насаживаетс[ya] на член [P] анальным кольцом, ввод[ya] [P.identifying_gender==FEMALE ? "её" : "его"] орган в пр[ya]мую кишку")
			if (prob(35))
				message = pick("насаживаетс[ya] на интрумент [P] задницей по самые [ya]йц", "скачет на малыше [P], погружа[ya] его в свой зад", "прыгает на [P], удар[ya][ya]сь о [P.identifying_gender==FEMALE ? "её" : "его"] тело", "подпрыгивает, доставл[ya][ya] удовольствие себе и [P]", "[P.identifying_gender==FEMALE ? "упёрлась" : "упёрс[ya]"] тазом в [P] и елозит, держа [P.identifying_gender==FEMALE ? "её" : "его"] член внутри себ[ya]", "двигает тазом по-кругу, сид[ya] задом на инструменте [P], ласка[ya] его ", "вприпрыжку наваливаетс[ya] на [P], ласка[ya] [P.identifying_gender==FEMALE ? "её" : "его"] член пр[ya]мой кишкой", "насаживаетс[ya] на крючок [P], дав[ya] на него своим тазом", "двигаетс[ya] вверх-вниз, сид[ya] задом на зверьке [P]")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("медленно садитс[ya] задницей на интрумент [P], ввод[ya] его внутрь", "осторожно вводит орган [P] в задний свой проход", "направл[ya]ет член [P] в свою шахту, помога[ya] себе рукой", "осторожно вводит ствол [P] в свою пр[ya]мую кишку", "запускает зверька [P] в свою пр[ya]мую кишку", "запускает шахтёра [P] в свои угольные шахты")
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
				message = pick("Вы чувствуете, как анальное кольцо [H] начинает резко сокращатьс[ya] вокруг вашего инструмента.", "Вы чувствуете, как сфинктер [H] крепко сжимают ваш напр[ya]жённый член, пульсиру[ya].", "Вы чувствуете, как анус [H] резко сжимаетс[ya] вокруг вашего члена.", "Вы чувствуете, как напрн[ya]гс[ya] сфинктер [H], удержива[ya] ваш член внутри пр[ya]мой кишки.", "Вы чувствуете, как мышцы сфинктера [H] сильно сжимаютс[ya] несколько раз, приближа[ya] вас к оргазму.")
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
						message = pick("поглаживает пах [P] через одежду.", "поглаживает пах [P] через одежду, заставл[ya][ya] его твердеть.", "гладит инструмент [P] через одежду.", "стимулирует член [P] рукой через одежду.")
					if("female")
						message = pick("поглаживает промежность [P] через одежду.", "гладит промежность [P] через одежду, провод[ya] между ног пальцами.", "гладит киску [P] через одежду.", "ласкает [P] между ног через одежду.")
				H.arousal += 10
			else
				switch(H.gender)
					if("male")
						message = pick("поглаживает свой пах через одежду.", "поглаживает свой пах через одежду, заставл[ya][ya] его твердеть.", "гладит свой инструмент через одежду.", "стимулирует свой член рукой через одежду.")
					if("female")
						message = pick("поглаживает свою промежность через одежду.", "гладит свою промежность через одежду, провод[ya] между ног пальцами.", "гладит свою киску через одежду.", "ласкает себ[ya] между ног через одежду.")

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
				var/message = pick("постанывает", "стонет от удовольстви[ya]", "закатывает глаза", "закусывает губу", "довольно облизываетс[ya]")
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
					var/message = pick("мурлычет", "мурлычет от удовольстви[ya]", "закатывает глаза", "довольно облизываетс[ya]")
					H.visible_message("<B>[H]</B> [message].")
					playsound(loc, "honk/sound/interactions/purr[rand(1, 3)].ogg", 70, 1, frequency = get_age_pitch())

			if("Vulpkanin", "Sergal", "Flatland Zorren", "Highlander Zorren")
				if (prob(H.lust / src.resistenza * 70))
					var/message = pick("поскуливает", "поскуливает от удовольстви[ya]", "закатывает глаза", "довольно облизываетс[ya]")
					H.visible_message("<B>[H]</B> [message].")
*/
		if(H.species.get_bodytype() == SPECIES_UNATHI)
			if (prob(H.lust / H.resistenza * 65))
				var/message = pick("довольно шипит", "извиваетс[ya] от удовольстви[ya]")
				H.visible_message("<B>[H]</B> [message].")

		if(H.species.get_bodytype() == SPECIES_TESHARI || H.species.get_bodytype() == SPECIES_VOX || H.species.get_bodytype() == SPECIES_NEVREAN)
			if (prob(H.lust / H.resistenza * 65))
				var/message = pick("довольно пищит", "извиваетс[ya] от удовольстви[ya]")
				H.visible_message("<B>[H]</B> [message].")

	else if (prob(H.lust / H.resistenza * 65))
		var/message = pick("тихо стонет", "постанывает в тишине", "закатывает глаза от удовольстви[ya]")
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
				var/message = pick("постанывает", "стонет от удовольстви[ya]", "закатывает глаза", "довольно облизываетс[ya]")
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
					var/message = pick("мурлычет", "мурлычет от удовольстви[ya]", "закатывает глаза", "довольно облизываетс[ya]")
					H.visible_message("<B>[H]</B> [message].")
					playsound(loc, "honk/sound/interactions/purr[rand(1, 3)].ogg", 70, 1, frequency = get_age_pitch())

			if("Vulpkanin", "Sergal", "Flatland Zorren", "Highlander Zorren")
				if (prob(H.lust / src.resistenza * 70))
					var/message = pick("поскуливает", "поскуливает от удовольстви[ya]", "закатывает глаза", "довольно облизываетс[ya]")
					H.visible_message("<B>[H]</B> [message].")
*/
		if(M.species.get_bodytype() == SPECIES_UNATHI)
			if (prob(M.arousal / M.resistenza * 65))
				var/message = pick("довольно шипит", "извиваетс[ya] от удовольстви[ya]")
				M.visible_message("<B>[M]</B> [message].")

		if(M.species.get_bodytype() == SPECIES_TESHARI || M.species.get_bodytype() == SPECIES_VOX || M.species.get_bodytype() == SPECIES_NEVREAN)
			if (prob(M.arousal / M.resistenza * 65))
				var/message = pick("довольно пищит", "извиваетс[ya] от удовольстви[ya]")
				M.visible_message("<B>[M]</B> [message].")

	else if (prob(M.arousal / M.resistenza * 65))
		var/message = pick("тихо стонет", "постанывает в тишине", "закатывает глаза от удовольстви[ya]")
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
				message = pick("удовлетвор[ya]ет себ[ya] с помощью дилдо", "погружает дилдо в свою киску", "заталкивает дилдо в свою вагину по самые [ya]йца", "погружает дилдо в своё лоно", "трахает себ[ya] во влагалище при помощи дилдо")
			else
				message = pick("удовлетвор[ya]ет [M] с помощью дилдо", "погружает дилдо в киску [M]", "заталкивает дилдо в вагину [M] по самые [ya]йца", "погружает дилдо в лоно [M]", "трахает [M] во взагалище при помощи дилдо")

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
				message = pick("удовлетвор[ya]ет себ[ya] анально с помощью дилдо", "трахает себ[ya] в зад при помощи дилдо", "заталкивает дилдо себе в анус по самые [ya]йца", "чистит свой дымоход, использу[ya] дилдо", "месит глину в своей шахте при помощи дилдо")
			else
				message = pick("удовлетвор[ya]ет [M] анально с помощью дилдо", "трахает [M] в зад при помощи дилдо", "заталкивает дилдо [M] в анус по самые [ya]йца", "чистит дымоход [M], использу[ya] дилдо", "месит глину в шахте [M] при помощи дилдо")

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
				message = pick("разрабатывает свою гортань при помощи дилдо", "заталкивает дилдо себе в глотку", "разрабатывает свою глотку, использу[ya] дилдо", "трахает себ[ya] в горло, использу[ya] дилдо", "заталкивает дилдо себе в глотку по самые [ya]йца", "сосёт дилдо как леденец")
			else
				message = pick("разрабатывает гортань [M] при помощи дилдо", "заталкивает дилдо [M] в глотку", "разрабатывает глотку [M], использу[ya] дилдо", "трахает [M] в горло при помощи дилдо", "заталкивает дилдо в глотку [M] по самые [ya]йца")

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
				M.visible_message("<B>[M]</B> [pick("давитс[ya] <B>дилдо</B>", "задыхаетс[ya]", "корчитс[ya] в рвотном позыве")].")
				if (istype(M.loc, /obj/structure/closet))
					M.visible_message("<B>[M]</B> [pick("давитс[ya] <B>дилдо</B>", "задыхаетс[ya]", "корчитс[ya] в рвотном позыве")].")

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