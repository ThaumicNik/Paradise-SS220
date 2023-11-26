/datum/outfit/admin/srt
	name = "Special Response Team Member"

	uniform = /obj/item/clothing/under/solgov/srt
	suit = /obj/item/clothing/suit/armor/vest/fluff/tactical
	suit_store = /obj/item/gun/energy/gun/blueshield/pdw9
	back = /obj/item/storage/backpack/satchel_blueshield
	belt = /obj/item/storage/belt/military/assault/srt
	gloves = /obj/item/clothing/gloves/combat
	shoes = /obj/item/clothing/shoes/combat/swat
	head = /obj/item/clothing/head/beret/centcom/officer/navy/marine
	l_ear = /obj/item/radio/headset/ert/alt
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	id = /obj/item/card/id/ert/security
	pda = /obj/item/pda/heads/ert/security
	box = /obj/item/storage/box/responseteam
	r_pocket = /obj/item/flashlight/seclite
	l_pocket = /obj/item/pinpointer/advpinpointer
	backpack_contents = list(
		/obj/item/clothing/mask/gas/explorer/marines,
		/obj/item/storage/box/handcuffs,
		/obj/item/ammo_box/magazine/smgm9mm,
		/obj/item/clothing/accessory/holster,
		/obj/item/gun/projectile/automatic/proto
	)
	implants = list(
		/obj/item/implant/mindshield
	)
	cybernetic_implants = list(
		/obj/item/organ/internal/cyberimp/arm/baton,
		/obj/item/organ/internal/cyberimp/eyes/hud/security
	)
	var/id_icon = "syndie"

/datum/outfit/admin/srt/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return

	var/obj/item/card/id/I = H.wear_id
	if(istype(I))
		apply_to_card(I, H, get_centcom_access("Emergency Response Team Member"), "Special Response Team Member")
	I.assignment = "Emergency Response Team Officer"
	H.sec_hud_set_ID()

/datum/outfit/job/syndicateofficer
	suit = /obj/item/clothing/suit/space/deathsquad/officer/syndie

/datum/outfit/admin/soviet/marine/captain

	backpack_contents = list(
		/obj/item/storage/box/soviet = 1,
		/obj/item/gun/projectile/revolver/reclinable/anaconda  = 1,
		/obj/item/ammo_box/speed_loader_d44 = 2,
		/obj/item/storage/fancy/cigarettes/cigpack_syndicate = 1,
		/obj/item/lighter/zippo/engraved = 1
	)

/datum/outfit/admin/soviet/officer
	belt = /obj/item/gun/projectile/revolver/reclinable/rsh12

	backpack_contents = list(
		/obj/item/storage/box/soviet = 1,
		/obj/item/lighter/zippo = 1,
		/obj/item/storage/fancy/cigarettes/cigpack_syndicate = 1,
		/obj/item/ammo_box/speed_loader_mm127 = 2
	)

/datum/outfit/admin/soviet/admiral
	belt = /obj/item/gun/projectile/revolver/reclinable/rsh12

	backpack_contents = list(
		/obj/item/storage/box/soviet = 1,
		/obj/item/ammo_box/speed_loader_mm127 = 3
	)

/datum/outfit/job/ntnavyofficer
	l_pocket = /obj/item/melee/baseball_bat/homerun/central_command

/obj/item/clothing/under/solgov/srt
	name = "marine uniform"
	desc = "A comfortable and durable combat uniform"

/obj/item/clothing/head/beret/centcom/officer/navy/marine
	name = "navy blue beret"

/obj/item/storage/belt/military/assault/srt/populate_contents()
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/flash(src)
	new /obj/item/grenade/flashbang(src)
	new /obj/item/restraints/legcuffs/bola/energy(src)
	new /obj/item/ammo_box/magazine/smgm9mm(src)
	new /obj/item/ammo_box/magazine/smgm9mm(src)
	update_icon()


///Nanotrasen Field Officer

/datum/outfit/job/ntnavyofficer/field
	name = "Nanotrasen Navy Field Officer"

	gloves = /obj/item/clothing/gloves/combat
	suit = /obj/item/clothing/suit/space/deathsquad/officer/field
	head = /obj/item/clothing/head/helmet/space/deathsquad/beret/field
	l_pocket = /obj/item/melee/baseball_bat/homerun/central_command

	implants = list(
		/obj/item/implant/mindshield,
		/obj/item/implant/dust,
		/obj/item/organ/internal/cyberimp/brain/anti_sleep/hardened,
		/obj/item/organ/internal/cyberimp/chest/reviver/hardened,
		/obj/item/organ/internal/cyberimp/eyes/hud/medical,
		/obj/item/organ/internal/cyberimp/brain/anti_stam/hardened,
		/obj/item/organ/internal/eyes/cybernetic/thermals/hardened
	)

/datum/outfit/job/ntnavyofficer/field/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.mind.offstation_role = TRUE
	var/obj/item/card/id/I = H.wear_id
	if(istype(I))
		apply_to_card(I, H, get_centcom_access("Nanotrasen Navy Officer"), "Nanotrasen Navy Field Officer")
	I.assignment = "Nanotrasen Navy Officer"
	H.sec_hud_set_ID()

/obj/item/clothing/head/helmet/space/deathsquad/beret/field
	icon_state = "beret_centcom_officer"


//event outfits
/datum/outfit/scavenger
	name = "scavenger"

	uniform = /obj/item/clothing/under/color/random
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/jacket/random
	head = /obj/item/clothing/head/soft/random
	mask = /obj/item/clothing/mask/bandana/random
	id = /obj/item/card/id
	back = /obj/item/storage/backpack
	backpack_contents = list(
		/obj/item/storage/box/survival = 1,
		/obj/item/flashlight = 1
		/obj/item/reagent_containers/food/drinks/bottle/random_drink = 1
	)



/datum/outfit/scavenger/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(visualsOnly)
		return
	var/obj/item/card/id/I = H.wear_id
	if(istype(I))
		apply_to_card(I, H, list(ACCESS_MAINT_TUNNELS), "Scavenger")

/obj/item/clothing/mask/bandana/random/Initialize(mapload)
	. = ..()
	var/obj/item/clothing/mask/bandana/C = pick(subtypesof(/obj/item/clothing/mask/bandana))
	name = initial(C.name)
	icon_state = initial(C.icon_state)
	item_state = initial(C.item_state)
	item_color = initial(C.item_color)

/obj/item/clothing/suit/jacket/random/Initialize(mapload)
	. = ..()
	var/obj/item/clothing/suit/jacket/C = pick(subtypesof(/obj/item/clothing/suit/jacket))
	name = initial(C.name)
	icon_state = initial(C.icon_state)
	item_state = initial(C.item_state)
	item_color = initial(C.item_color)

/obj/item/clothing/head/soft/random/Initialize(mapload)
	. = ..()
	var/obj/item/clothing/head/soft/C = pick(subtypesof(/obj/item/clothing/head/soft))
	name = initial(C.name)
	icon_state = initial(C.icon_state)
	item_state = initial(C.item_state)
	item_color = initial(C.item_color)




