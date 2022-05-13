sub EVENT_SPAWN {
    if ($instanceid > 0 and $instanceversion == 1) {
        quest::set_data($npc->GetName() . "instancecheck");
    }
}