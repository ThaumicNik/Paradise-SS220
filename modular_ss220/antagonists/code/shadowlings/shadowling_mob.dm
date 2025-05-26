// Not subtype of /mob/living/carbon/human/shadow because of weird parent proc call
/mob/living/carbon/human/shadowling/Initialize(mapload)
	change_eye_color("#e20909")
	. = ..(mapload, /datum/species/shadow/ling)
