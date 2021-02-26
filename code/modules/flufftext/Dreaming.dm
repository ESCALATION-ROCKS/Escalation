
var/list/dreams = list(
	"a dog tag","a bottle","a familiar face","a soldier","a rifle","a deputy","the lieutenant",
	"voices from all around","home","the surgeon","the fields","a traitor","an ally","darkness",
	"light","a leader","hellfire","a catastrophe","a loved one","a sniper","warmth","freezing","the sun",
	"a helmet","a ruined life","a planet","fresh breeze","kisses","the medic","the bunks","blinking lights",
	"a light","an abandoned school","World War Three", "death", "pain","blood","agony","power","respect",
	"redemption","hope","despair","happiness","pride","a fall","water","flames","ice","lead","flying","children","money",
	"the staff sergeant","the bootcamp","the drafting act",
	"a friendly face","God","Jesus Christ",
	"heaven","hell","suffering","anguish","hurt",
	"morals","the capitalists","the communists","please return home","a shout","a punch","a cat",
	"a dog","my parents","my dog","a voice","the cold","my cat","an operating table","the rain","the pain",
	"this is not real","please come back","please wake up","none of this is real","i love you"
	)

mob/living/carbon/proc/dream()
	dreaming = 1

	spawn(0)
		for(var/i = rand(1,4),i > 0, i--)
			to_chat(src, "<span class='notice'><i>... [pick(dreams)] ...</i></span>")
			sleep(rand(40,70))
			if(paralysis <= 0)
				dreaming = 0
				return 0
		dreaming = 0
		return 1

mob/living/carbon/proc/handle_dreams()
	if(client && !dreaming && prob(5))
		dream()

mob/living/carbon/var/dreaming = 0
