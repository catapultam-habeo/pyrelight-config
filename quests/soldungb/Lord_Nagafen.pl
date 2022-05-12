sub EVENT_AGGRO {
    if ($instanceid > 0) {
        my $death_count = quest::get_data($instanceid . '-deathCount');
        if ($death_count <= 10) {
            quest::shout("You know the rules!");
            my $npcs = $entity_list->GetNPCList();
            foreach my $n (@npcs) {
                quest::shout("TRAIN!");
                if ($n->CastToMob()->GetLevel() < 255 && $n->GetOwnerID() == 0) {
                    $n->MoveTo($n->CastToMob()->GetX(), $n->CastToMob()->GetY(), $n->CastToMob()->GetZ());
                    $n->AddToHateList($client, 100000);
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