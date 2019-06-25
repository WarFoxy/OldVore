/mob/living/silicon/robot/emote(var/act,var/m_type=1,var/message = null)
	var/param = null
	var/ya = "&#255;"
	if (findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	if(findtext(act,"s",-1) && !findtext(act,"_",-2))//Removes ending s's unless they are prefixed with a '_'
		act = copytext(act,1,length(act))

	switch(act)
		if ("me")
			if (src.client)
				if(client.prefs.muted & MUTE_IC)
					src << "You cannot send IC messages (muted)."
					return
			if (stat)
				return
			if(!(message))
				return
			else
				return custom_emote(m_type, message)

		if ("custom")
			return custom_emote(m_type, message)

		if ("salute")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(null, null))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null

				if (param)
					message = "отдаЄт честь [param]."
				else
					message = "отдаЄт честь."
			m_type = 1
		if ("bow")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(null, null))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null

				if (param)
					message = "клан[ya]етс[ya] [param]."
				else
					message = "клан[ya]етс[ya]."
			m_type = 1

		if ("clap")
			if (!src.restrained())
				message = "апплодирует."
				m_type = 2
		if ("flap")
			if (!src.restrained())
				message = "машет крыль[ya]ми."
				m_type = 2

		if ("aflap")
			if (!src.restrained())
				message = "ј√–≈——»¬Ќќ машет крыль[ya]ми!"
				m_type = 2

		if ("twitch")
			message = "дЄргаетс[ya]."
			m_type = 1

		if ("twitch_v")
			message = "резко дЄргаетс[ya]."
			m_type = 1

		if ("nod")
			message = "кивает."
			m_type = 1

		if ("deathgasp")
			message = "на мгновение резко вздрагивает, затем замирает. ¬изор перестаЄт светитьс[ya]."
			m_type = 1

		if ("glare")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null

			if (param)
				message = "злобно смотрит на [param]."
			else
				message = "злобно смотрит на что-то."

		if ("stare")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null

			if (param)
				message = "п[ya]литс[ya] на [param]."
			else
				message = "пристально смотрит на что-то."

		if ("look")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break

			if (!M)
				param = null

			if (param)
				message = "смотрит на [param]."
			else
				message = "смотрит на что-то."
			m_type = 1

		if("beep")
			var/M = null
			if(param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if(!M)
				param = null

			if (param)
				message = "гудит на [param]."
			else
				message = "гудит."
			playsound(src.loc, 'sound/machines/twobeep.ogg', 50, 0)
			m_type = 1

		if("ping")
			var/M = null
			if(param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if(!M)
				param = null

			if (param)
				message = "звенит на [param]."
			else
				message = "звенит."
			playsound(src.loc, 'sound/machines/ping.ogg', 50, 0)
			m_type = 1

		if("buzz")
			var/M = null
			if(param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if(!M)
				param = null

			if (param)
				message = "жужжит на [param]."
			else
				message = "жужжит."
			playsound(src.loc, 'sound/machines/buzz-sigh.ogg', 50, 0)
			m_type = 1

		if("yes", "ye")
			var/M = null
			if(param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if(!M)
				param = null

			if (param)
				message = "отвечает [param] утвердительным сигналом."
			else
				message = "издаЄт утвердительный сигнал."
			playsound(src.loc, 'sound/machines/synth_yes.ogg', 50, 0)
			m_type = 1

		if("no")
			var/M = null
			if(param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if(!M)
				param = null

			if (param)
				message = "отвечает [param] отрицательным сигналом."
			else
				message = "издаЄт отрицательный сигнал."
			playsound(src.loc, 'sound/machines/synth_no.ogg', 50, 0)
			m_type = 1

		if("law")
			if (istype(module,/obj/item/weapon/robot_module/robot/security) || istype(module,/obj/item/weapon/robot_module/robot/knine)) //VOREStation Add - K9
				message = "показывает свой штрих-код авторизации."

				playsound(src.loc, 'sound/voice/biamthelaw.ogg', 50, 0)
				m_type = 2
			else
				src << "You are not THE LAW, pal."

		if("halt")
			if (istype(module,/obj/item/weapon/robot_module/robot/security) || istype(module,/obj/item/weapon/robot_module/robot/knine)) //VOREStation Add - K9
				message = "<B>'s</B> speakers skreech, \"Halt! Security!\"."

				playsound(src.loc, 'sound/voice/halt.ogg', 50, 0)
				m_type = 2
			else
				src << "You are not security."

		if ("help")
			src << "salute, bow-(none)/mob, clap, flap, aflap, twitch, twitch_s, nod, deathgasp, glare-(none)/mob, stare-(none)/mob, look, beep, ping, \nbuzz, law, halt, yes, no"
		else
			src << "<font color='blue'>Unusable emote '[act]'. Say *help for a list.</font>"

	if ((message && src.stat == 0))
		custom_emote(m_type,message)

	return
