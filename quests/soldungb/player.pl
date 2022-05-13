sub EVENT_ENTERZONE {

    my $level_target = 53;

    if ($instanceid > 0 and $instanceversion == 1 and not quest::get_data($instanceid . "-scaled")) {
        my @npcs = $entity_list->GetNPCList();
        my $hack_count = quest::get_data($client->GetIPString() . "-HackerFlag");        

        foreach $npc (@npcs) {
            $npc->ScaleNPC($level_target);

            quest::set_data($instanceid . "-scaled", 259200);           
        }
    }
}