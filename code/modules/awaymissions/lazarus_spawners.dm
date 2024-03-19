// Lazarus outfit

/datum/outfit/lazarus
	name = "Lazarus Placeholder"

	back = /obj/item/storage/backpack

	var/list/loot = list()
	var/loot_min = 0
	var/loot_max = 0
	var/lootdoubles

/obj/machinery/light

/datum/outfit/lazarus/New()
	. = ..()
	var/backpack_loot = list()
	var/lootcount = rand(loot_min, loot_max)
	while(lootcount)
		var/lootspawn = pickweight(loot)

		if(!lootdoubles)
			loot.Remove(lootspawn)
		if(lootspawn)
			backpack_loot += lootspawn
		lootcount--
	backpack_contents = backpack_loot

// CORPSE SPAWNERS

/obj/effect/mob_spawn/human/colonist
	name = "Lazarus Colonist Corpse"
	mob_name = "Colonist"
	id_job = "Colonist"
	outfit = /datum/outfit/lazarus/colonist
	brute_damage = 450

/datum/outfit/lazarus/colonist
	name = "Lazarus Colonist"

	uniform = /obj/item/clothing/under/color/random
	shoes = /obj/item/clothing/shoes/black
	id = /obj/item/card/id/assistant

	loot_min = 3
	loot_max = 6

	loot = list(
		// Tools
		/obj/item/screwdriver = 10,
		/obj/item/wrench = 10,
		/obj/item/weldingtool = 10,
		/obj/item/crowbar = 10,
		/obj/item/wirecutters = 10,
		/obj/item/multitool = 10,
		/obj/item/stack/cable_coil/random = 10,
		/obj/item/clothing/head/welding = 3,
		/obj/item/clothing/gloves/color/yellow = 2,
		/obj/item/clothing/gloves/color/fyellow = 5,

		// Food (Lack of food is one of the event ideas)
		/obj/item/food/snacks/applecakeslice = 1,
		/obj/item/food/snacks/cheesecakeslice = 1,
		/obj/item/food/snacks/meatbreadslice = 1,
		/obj/item/food/snacks/creamcheesebreadslice = 1,
		/obj/item/food/snacks/grown/apple = 1,
		/obj/item/food/snacks/grown/berries = 5,
		/obj/item/food/snacks/donkpocket = 1,
		/obj/item/food/snacks/sandwich = 1,
		/obj/item/food/snacks/chips = 1,
		/obj/item/food/snacks/tastybread = 1,
		/obj/item/food/snacks/meat = 5,
		/obj/item/food/snacks/meatsteak = 1,

		// Melee Weapons
		/obj/item/hatchet = 8,
		/obj/item/pickaxe = 5,
		/obj/item/shovel = 12,
		/obj/item/fireaxe = 2,
		/obj/item/pickaxe/diamond = 2,
		/obj/item/claymore = 1,
		/obj/item/spear = 8,
		/obj/item/melee/baton/cattleprod = 6,
		/obj/item/melee/baton/loaded = 3,
		/obj/item/kitchen/knife = 5,

		// Ranged Weapons + Ammo
		/obj/item/gun/energy/disabler = 3,
		/obj/item/gun/projectile/automatic/pistol = 1,
		/obj/item/ammo_box/magazine/m10mm = 4,
		/obj/item/gun/energy/laser = 2,

		// Medicine
		/obj/item/healthanalyzer = 4,
		/obj/item/healthanalyzer/advanced = 2,
		/obj/item/stack/medical/bruise_pack = 10,
		/obj/item/stack/medical/ointment = 10,
		/obj/item/stack/medical/bruise_pack/advanced = 4,
		/obj/item/stack/medical/ointment/advanced = 4,
		/obj/item/reagent_containers/hypospray/autoinjector/epinephrine = 10,

		// Light
		/obj/item/flashlight = 6,
		/obj/item/flashlight/flare/torch = 15,
		/obj/item/flashlight/flare = 15,
		/obj/item/flashlight/lantern = 6,
	)


