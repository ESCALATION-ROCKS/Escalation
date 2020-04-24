/datum/dna/gene/basic/thickbones
	name="Thick Bones"
	activation_messages=list("Your bones are harder than usual human bones are.")
	mutation=mThickbones

	New()
		block=THICKBONESBLOCK

/datum/dna/gene/basic/adrenaline
	name="High Adrenaline"
	activation_messages=list("Your adrenaline secretion is higher comparing to a normal human.")
	mutation=mAdrenalinehigh

	New()
		block=ADRENALINEHIGHBLOCK

/datum/dna/gene/basic/avianbone
	name="Avian Bone Syndrome"
	activation_messages=list("Your bones are hollow.")
	mutation=mAvianbone

	New()
		block=AVIANBONEBLOCK

/datum/dna/gene/basic/highmetabolism
	name="High Metabolism"
	activation_messages=list("Your metabolism is high.")
	mutation=mHighmetabolism

	New()
		block=HIGHMETBLOCK

/datum/dna/gene/basic/veryhighmetabolism
	name="Very High Metabolism"
	activation_messages=list("Your metabolism is very high.")
	mutation=mVeryhighmetabolism

	New()
		block=VERYHIGHMETBLOCK

/datum/dna/gene/basic/lowmetabolism
	name="Low Metabolism"
	activation_messages=list("Your metabolism is low.")
	mutation=mLowmetabolism

	New()
		block=LOWMETBLOCK

/datum/dna/gene/basic/verylowmetabolism
	name="Very Low Metabolism"
	activation_messages=list("Your metabolism is very low.")
	mutation=mVerylowmetabolism

	New()
		block=VERYLOWMETBLOCK

/datum/dna/gene/basic/haemophilia
	name="Haemophilia"
	activation_messages=list(".")
	mutation=mHaemophilia

	New()
		block=HAEMOPHILIA


/datum/dna/gene/basic/haemopoesis
	name="Better Haemopoesis"
	activation_messages=list(".")
	mutation=mHaemopoesis

	New()
		block=HAEMOPOESIS

/datum/dna/gene/basic/lactose
	name = "Lactose intolerance"
	desc = "A condition where your body is unable to digest Lactose, a sugar commonly found in milk."
	activation_messages=list(".")
	mutation = mLactoseintolerance

/datum/dna/gene/basic/lactose/New()
	..()
	block = LACTOSEBLOCK

/datum/dna/gene/basic/lactose/OnMobLife(var/mob/living/carbon/human/H)
	if(!istype(H))
		return

	if(prob(10))
		if(H.reagents.has_reagent(/datum/reagent/drink/milk))
			to_chat(H, "<span class='warning'>Your body rejects the milk!</span>")

			if(H.lastpuke) //If already puking, add some toxins
				H.adjustToxLoss(2.5)
			else
				H.vomit()

/datum/dna/gene/basic/asthma
	name = "Asthma"
	desc = "A condition in which a person's airways become inflamed, narrow and swell, and produce extra mucus, which makes it difficult to breathe."
	activation_messages=list(".")
	mutation = mAsthma

/datum/dna/gene/basic/asthma/New()
	..()
	block = ASTHMA

/datum/dna/gene/basic/toxinresistance
	name = "Toxin Resistance"
	activation_messages=list(".")
	mutation = mToxinresistance

/datum/dna/gene/basic/toxinresistance/New()
	..()
	block = TOXINRESISTANCE

/datum/dna/gene/basic/alcometabolism
	name = "Alcohol Metabolism"
	activation_messages=list(".")
	mutation = mAlcoholmetabolism

/datum/dna/gene/basic/alcometabolism/New()
	..()
	block = ALCOHOLMETABOLISM