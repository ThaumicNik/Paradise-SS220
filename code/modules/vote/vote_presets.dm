// Crew transfer vote
/datum/vote/crew_transfer
	question = "Окончание смены"
	choices = list("Инициировать эвакуацию", "Продолжить раунд")
	vote_type_text = "эвакуацию"

/datum/vote/crew_transfer/New()
	if(SSticker.current_state < GAME_STATE_PLAYING)
		CRASH("Попытка вызвать голосование за шаттл до начала!")
	..()

/datum/vote/crew_transfer/handle_result(result)
	if(result == "Инициировать эвакуацию")
		init_shift_change(null, TRUE)

// Map vote
/datum/vote/map
	question = "Голосование за карту"
	vote_type_text = "карту"

/datum/vote/map/generate_choices()
	for(var/x in subtypesof(/datum/map))
		var/datum/map/M = x
		if(!initial(M.voteable))
			continue
		// Skip the current map if IF
		// - Map rotate doesnt have a mode for today and the config is enabled for it
		// - Map rotate has a mode for the day and it ISNT full random
		if(((!SSmaprotate.setup_done) && GLOB.configuration.vote.non_repeating_maps) || (SSmaprotate.setup_done && (SSmaprotate.rotation_mode == MAPROTATION_MODE_NO_DUPLICATES)))
			// And of course, if the current map is the same
			if(istype(SSmapping.map_datum, M))
				continue
		choices.Add("[initial(M.fluff_name)] ([initial(M.technical_name)])")

/datum/vote/map/announce()
	..()
	for(var/mob/M in GLOB.player_list)
		M.throw_alert("Голосование за карту", /atom/movable/screen/alert/notify_mapvote, timeout_override = GLOB.configuration.vote.vote_time)

/datum/vote/map/handle_result(result)
	// Find target map.
	if(!result)
		return
	var/datum/map/top_voted_map
	for(var/x in subtypesof(/datum/map))
		var/datum/map/M = x
		if(initial(M.voteable))
			// Set top voted map
			if(result == "[initial(M.fluff_name)] ([initial(M.technical_name)])")
				top_voted_map = M
	to_chat(world, "<span class='interface'>Карта следующего раунда: [initial(top_voted_map.fluff_name)] ([initial(top_voted_map.technical_name)])</span>")
	SSmapping.next_map = new top_voted_map
