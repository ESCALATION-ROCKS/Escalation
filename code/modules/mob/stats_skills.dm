/////////////////////////////////////////////////////////////////////////
//This is the file where all the stats and skills procs are kept.	    //
//The system is kinda barebones now but I hope to rewrite it to  	    //
//be betting in the near future. 								 	    //
//																 	    //
//Stats are pretty generic, skills are kind of specific. 				//
//You should just be able to plop in the proc call wherever you want.   //
//I tried to make it versitile.											//
// - Matt 																//
//////////////////////////////////////////////////////////////////////////

//defines
#define CRIT_SUCCESS_NORM 5
#define CRIT_FAILURE_NORM 5
#define CRIT_SUCCESS 2
#define CRIT_FAILURE 3


//I am aware this is probably the worst possible way of doing it but I'm using this method till I get a better one. - Matt
/mob
	var/str = 8    //strength - used for hitting and lifting.
	var/dex = 8    //dexterity - used for dodging and parrying.
	var/int = 8
	var/end = 8
	var/soc = 8

    //skills
	var/skill_melee = 0
	var/skill_ranged = 0
	var/skill_mechanic = 0
	var/skill_engineering = 0
	var/skill_medicine = 0
	var/skill_athlethics = 0
	var/skill_leadership = 0
	var/skill_science = 0
	var/skill_cooking = 0



	//crit shit
	var/crit_success_chance = CRIT_SUCCESS_NORM
	var/crit_failure_chance = CRIT_FAILURE_NORM

/mob/proc/skillcheck(var/skill, var/requirement, var/show_message, var/message = "I have failed to do this.")//1 - 100
	if(skill >= requirement)//If we already surpass the skill requirements no need to roll.
		if(prob(src.crit_success_chance))//Only thing we roll for is a crit success.
			return CRIT_SUCCESS
		return 1
	else
		if(prob(skill))
			if(prob(crit_success_chance))//And again to see if we get a crit scucess.
				return CRIT_SUCCESS
			return 1
		else
			if(show_message)//If we don't pass then we return failure
				to_chat(src, "<span class = 'warning'>[message]</span>")
			if(prob(crit_failure_chance))//And roll for a crit failure.
				return CRIT_FAILURE
			return 0


/mob/proc/statscheck(var/specskill, var/specstat, var/requirement, var/show_message, var/message = "I have failed to do this.")
	var/M = (roll("2d6") + statadder(specstat) + specskill)// our "dice"
	if(specskill == -1)
		M -= 3
	if(requirement <= M)//Rolling that d20
		//world << "Rolled and passed."
		return 1
	else
		if(show_message)//If we fail then print this message and return 0.
			to_chat(src, "<span class = 'warning'>[message]</span>")
		return 0

proc/statadder(var/stat)
	switch(stat)
		if(0)
			return -3
		if(1 to 2)
			return -2
		if(3 to 5)
			return -1
		if(6 to 8)
			return 0
		if(9 to 11)
			return 1
		if(12 to 14)
			return 2
		if(15 to INFINITY)
			return  3

//Stats helpers.
/mob/proc/add_stats(var/stre, var/dexe, var/inti)//To make adding stats quicker.
	if(stre)
		str = stre
	if(dexe)
		dex = dexe
	if(inti)
		int = inti


/mob/proc/adjustStrength(var/num)
	str += num

/mob/proc/adjustDexterity(var/num)
	dex += num

/mob/proc/adjustInteligence(var/num)
	int += num

/mob/proc/adjustEndurance(var/num)
	end += num

/mob/proc/adjustSociality(var/num)
	soc += num


//Skill helpers.
/mob/proc/skillnumtodesc(var/skill)
	switch(skill)
		if(-1)
			return "<small><i>pathetic</i></small>"
		if(0)
			return pick("alright", "ok", "fine")
		if(1)
			return "skilled"
		if(2)
			return "experted"
		if(3)
			return "professional"
		if(4)
			return "an exceptional master"
		if(5)
			return "GOD LIKE"

/mob/living/carbon/human/verb/check_skills()//Debug tool for checking skills until I add the icon for it to the HUD.
	set name = "Check Skills"
	set category = "IC"

	var/message = "<big><b>Skills:</b></big>\n"
	message += "I am <b>[skillnumtodesc(skill_melee)]</b> at melee.\n"
	message += "I am <b>[skillnumtodesc(skill_ranged)]</b> with firearms.</b></i>\n"
	message += "I am <b>[skillnumtodesc(skill_mechanic)]</b> with mechanics.</b></i>\n"
	message += "I am <b>[skillnumtodesc(skill_engineering)]</b> at engineering.</b></i>\n"
	message += "I am <b>[skillnumtodesc(skill_medicine)]</b> at medicine.</b></i>\n"
	message += "I am <b>[skillnumtodesc(skill_leadership)]</b> at leadership.</b></i>\n"
	message += "I am <b>[skillnumtodesc(skill_science)]</b> at scientific stuff.</b></i>\n"
	message += "I am <b>[skillnumtodesc(skill_cooking)]</b> at cooking.</b></i>\n"
	message += "I am <b>[skillnumtodesc(skill_athlethics)]</b> at athlethics.</b></i>\n"
	to_chat(src, message)

/mob/proc/accstatmodifier(var/skill)
	switch(skill)
		if(-1)
			return 0.1
		if(0)
			return 0.4
		if(1)
			return 0.6
		if(2)
			return 0.8
		if(3)
			return  1.2
		if(4)
			return  1.4
		if(5)
			return  1.6
		if(6)
			return  2

/mob/proc/mstatmodifier(var/stat)
	switch(stat)
		if(1 to 3)
			return 0.5
		if(4 to 6)
			return 0.75
		if(7 to 9)
			return 1.0
		if(10 to 12)
			return  1.25
		if(13 to INFINITY)
			return  1.5

/mob/proc/sstatmodifier(var/stat)
	switch(stat)
		if(1 to 3)
			return 0.25
		if(4 to 6)
			return 0.5
		if(7 to 9)
			return 1.0
		if(10 to 12)
			return  1.5
		if(13 to INFINITY)
			return  2.0

/mob/proc/healthmodifier(var/stat)
	switch(stat)
		if(1 to 3)
			return 0.8
		if(4 to 6)
			return 0.9
		if(7 to 9)
			return 1.0
		if(10 to 12)
			return  1.1
		if(13 to INFINITY)
			return  1.2

/mob/proc/add_skills(var/melee, var/ranged, var/mechanic, var/engineering, var/medicine, var/athlethics, var/leadership, var/cooking)//To make adding skills quicker.
	if(melee)
		skill_melee = melee
	if(ranged)
		skill_ranged = ranged
	if(mechanic)
		skill_mechanic = mechanic
	if(engineering)
		skill_engineering = engineering
	if(medicine)
		skill_medicine = medicine
	if(athlethics)
		skill_athlethics = athlethics
	if(leadership)
		skill_leadership = leadership
/*
	if(science)
		skill_science = science
*/
	if(cooking)
		skill_cooking = cooking