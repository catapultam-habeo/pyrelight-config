sub EVENT_AGGRO {
    $npc->Shout("Guardians! Defend me!");
    my @seahorses = $entity_list->GetMobByNpcTypeID(64051);
    foreach my $n (@npcs) {
        $n->AddToHateList($client, 100000);
    }

    if ($instanceid > 0 and $instanceversion = 1) {
        my $death_count = quest::get_data($instanceid . '-deathCount');
        if ($death_count <= 10) {
            quest::shout("You know the rules!");
            my @npcs = $entity_list->GetNPCList();
            foreach my $n (@npcs) {
                $n->Shout("TRAIN!");
                if ($n->CastToMob()->GetLevel() < 255 && $n->GetOwnerID() == 0) {
                    $n->AddToHateList($client, 100000);
                }
            }
        }

        my @clients = $entity_list->GetClientList();
        foreach my $client (@clients) {
            if ($client->IsTaskActive(9001)) {
                quest::addloot(450012);
            }
        }
    }
}