//coldwar languages

/proc/add_team_language(var/mob/living/carbon/human/target)
	if(!ishuman(target))
		return


	var/mob/living/carbon/human/H = target

	if(!H.chosenSlot || !H.chosenSlot.faction_tag)
		return

	H.remove_language(LANGUAGE_GALCOM)

	var/datum/language/L = null
	switch(H.chosenSlot.faction_tag)
		if("usmc")
			H.add_language(LANGUAGE_ENGLISH)
			L = all_languages[LANGUAGE_ENGLISH]

		if("usa")
			H.add_language(LANGUAGE_ENGLISH)
			L = all_languages[LANGUAGE_ENGLISH]

		if("baf")
			H.add_language(LANGUAGE_ENGLISH)
			L = all_languages[LANGUAGE_ENGLISH]

		if("cccp")
			H.add_language(LANGUAGE_RUSSIAN)
			L = all_languages[LANGUAGE_RUSSIAN]

		if("bund")
			H.add_language(LANGUAGE_GERMAN)
			L = all_languages[LANGUAGE_GERMAN]

		if("nvaddr")
			H.add_language(LANGUAGE_GERMAN)
			L = all_languages[LANGUAGE_GERMAN]

		if("finn")
			H.add_language(LANGUAGE_FINNISH)
			L = all_languages[LANGUAGE_FINNISH]

		if("csla")
			H.add_language(LANGUAGE_CZECH)
			L = all_languages[LANGUAGE_CZECH]

		if("heer")
			H.add_language(LANGUAGE_GERMAN)
			L = all_languages[LANGUAGE_GERMAN]
			
		if("esp")
			H.add_language(LANGUAGE_SPANISH)
			L = all_languages[LANGUAGE_SPANISH]

		if("fra")
			H.add_language(LANGUAGE_FRENCH)
			L = all_languages[LANGUAGE_FRENCH]
	if(L)
		H.default_language = L

	return 1

/proc/add_other_languages(var/mob/living/carbon/human/target)

	if(!ishuman(target))
		return

	var/mob/living/carbon/human/H = target

	if(!H.chosenSlot || !H.chosenSlot.also_known_languages.len)
		return

	var/i

	for(i in H.chosenSlot.also_known_languages)
		if(prob(H.chosenSlot.also_known_languages[i]))
			H.add_language(i)

/datum/language/escalation
	name = "Escalation language"
	desc = "Nothing. Just code stuff"
	speech_verb = "says"
	whisper_verb = "whispers"
	flags = RESTRICTED

/datum/language/escalation/get_spoken_verb(var/msg_end)
	switch(msg_end)
		if("!")
			return pick("exclaims", "shouts", "yells") //TODO: make the basic proc handle lists of verbs.
		if("?")
			return ask_verb
	return speech_verb

/datum/language/escalation/russian
	name = "Russian"
	desc = "This is the languaged used by the Soviet Army."
	colour = "russian"
	key = "r"
	syllables = list("al", "an", "bi", "ve", "vo", "go", "de", "el", "en", "er", "et", "ka", "ko", "la", "li", "lo", "l'", "na", "ne", "ni", "no", "ov", "ol", "on", "or", "slog", "ot", "po", "pr", "ra", "re", "ro", "st", "ta", "te", "to", "t'", "at'", "bil", "ver", "ego", "eni", "enn", "est", "kak", "l'n", "ova", "ogo", "ol'", "oro", "ost", "oto", "pri", "pro", "sta", "stv", "tor", "chto", "eto")

/datum/language/escalation/czech
	name = "Czech"
	desc = "This is the languaged used by the CSLA."
	colour = "czech"
	key = "z"
	syllables = list("on", "ot", "ude", "lal", "kniz", "lit", "ovat", "tat", "kup", "sat", "vy", "konat", "vyt", "rob", "rhein", "zaj", "lat", "voz", "ic", "na", "do", "ba", "pod", "pid", "mi")

/datum/language/escalation/english
	name = "English"
	desc = "This is the languaged used by the American Army."
	colour = "english"
	key = "e"
	syllables = list("al", "an", "ar", "as", "at", "ea", "ed", "en", "er", "es", "ha", "he", "hi", "in", "is", "it", "le", "me", "nd", "ne", "ng", "nt", "on", "or", "ou", "re", "se", "st", "te", "th", "ti", "to", "ve", "wa", "all", "and", "are", "but", "ent", "era", "ere", "eve", "for", "had", "hat", "hen", "her", "hin", "his", "ing", "ion", "ith", "not", "ome", "oul", "our", "sho", "ted", "ter", "tha", "the", "thi", "tio", "uld", "ver", "was", "wit", "you")

/datum/language/escalation/german
	name = "German"
	desc = "This is the languaged used by the Bundeswehr, Bundesheer and the NVADDR."
	colour = "german"
	key = "g"
	syllables = list("die", "das", "wein", "mir", "und", "wier", "ein", "nein", "gen", "en", "sauen", "bien", "nien", "rien", "rhein", "deut", "der", "lieb", "en", "stein", "nein", "ja", "wolle", "sil", "be")

/datum/language/escalation/finnish
	name = "Finnish"
	desc = "This is the languaged used by the Finnish Militaria."
	colour = "finnish"
	key = "f"
	syllables = list("mine", "sine", "hen", "me", "te", "he", "tame", "tuo", "se", "name", "nuo", "ne", "kuka", "mika", "ken", "kumpi", "joka", "mike", "toinen", "itse", "Ei", "Anteeksi", "Kiitos")

/datum/language/escalation/spanish
	name = "Spanish"
	desc = "This is the languaged used by the Spanish Army."
	colour = "spanish"
	key = "p"
	syllables = list("va", "que", "qi", "si", "non", "te", "ta", "juz", "gue", "vez", "fe", "he", "hi", "in", "is", "it", "la", "re", "tin", "pa", "sa", "arr", "vi", "va", "mie", "do", "ri", "tos", "tra", "ma", "ra", "jo", "ero", "dad", "ejo", "ala", "ches", "bol", "bras", "som", "san", "bre", "erpo", "feliz", "juevez", "yes", "oje", "nol", "esp", "co", "un", "dos", "tres", "favor", "por", "bien", "como", "luz", "del", "ahi", "ajos", "veo", "tor", "apia", "riza", "hombre", "dador", "pindejo")

/datum/language/escalation/french
	name = "French"
	desc = "This is the languaged used by the French Army."
	colour = "spanish"
	key = "h"
	syllables = list("voux", "que", "qi", "cha", "non", "une", "la", "le", "l'", "j'", "d'", "mer", "rea", "lite", "ite", "eta", "la", "moi", "toi", "nous", "et", "tu", "tou", "jours", "mains", "moin", "les", "mise", "tra", "ma", "ra", "je", "nom", "lier", "ejo", "jeu", "nesse", "che", "pere", "som", "san", "bre", "sou", "vent", "mer", "les", "eux", "aux", "oux", "iux", "tiere", "dos", "tres", "etre", "ne", "bien", "tous", "lus", "del", "j'etat", "est", "sans", "eils", "guerre", "oire", "noire", "beaucoup", "merci")

//////////NOTE: Make sure BAY12 does not use the hotkey that you are going to use for a new language
////////// just search ( key = "" ) and you will find it