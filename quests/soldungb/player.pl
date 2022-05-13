sub EVENT_ENTERZONE {

    my $target_level = 53;
    my $target_boss_level = 55;
    my $target_boss_name = 'Lord_Nagafen'
    

    if ($instanceid > 0 and $instanceversion == 1 and not quest::get_data($instanceid . "-scaled")) {
        my @npcs = $entity_list->GetNPCList();
        my $hack_count = quest::get_data($client->GetIPString() . "-HackerFlag");        

        foreach $npc (@npcs) {

            if ($npc->GetName() eq $target_boss_name) {
                $npc->ScaleNPC($target_boss_level);
            } else {
                $npc->ScaleNPC($target_level);
            }
            
            quest::set_data($instanceid . "-scaled", 259200);           
        }
    }
}