sub EVENT_SPAWN {
    if ($instanceid > 0 and $instanceversion == 1) {
        $npc->Shout("I'm in an instance!");
    }
}