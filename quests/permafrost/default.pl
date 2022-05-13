sub EVENT_SPAWN_ZONE {
	# NPC-EVENT_SPAWN_ZONE
	# Exported event variables
	quest::debug("spawned_entity_id " . $spawned_entity_id);
	quest::debug("spawned_npc_id " . $spawned_npc_id);

    if ($instanceid > 0 and $instanceversion == 1) {
        quest::set_data($npc->GetName() . "instancecheck");
    }
}