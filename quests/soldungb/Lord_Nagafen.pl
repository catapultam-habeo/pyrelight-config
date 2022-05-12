sub EVENT_AGGRO {
    if ($instanceid > 0) {
        my $death_count = quest::get_data($instanceid . '-deathCount');
        if ($death_count <= 10) {
            quest::shout("You know the rules!");
            my $npcs = $entity_list->GetNPCList();
            foreach my $npc (@npcs) {
                if ($npc->CastToMob()->GetLevel() < 255 && $npc->GetOwnerID() == 0) {
                    $npc->AddToHateList($client, 100000);
                }
            }
        }
    }
}

sub EVENT_SPAWN {
    if ($instanceid > 0) {
    }
}
# EOF zone: soldungb ID: 32040 NPC: Lord_Nagafen