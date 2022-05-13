sub EVENT_AGGRO {
    if ($instanceid > 0 and $instanceversion = 1) {
        my $death_count = quest::get_data($instanceid . '-deathCount');
        if ($death_count <= 10) {
            quest::shout("You know the rules!");
            my @npcs = $entity_list->GetNPCList();
            foreach $n (@npcs) {
                $n->Shout("TRAIN!");
                if ($n->CastToMob()->GetLevel() < 255 && $n->GetOwnerID() == 0) {
                    $n->AddToHateList($client, 100000);
                    $n->CastToMob()->SetInvul(true);
                }
            }
        }

        my @clients = $entity_list->GetClientList();
        foreach my $client (@clients) {
            if ($client->IsTaskActive(9001)) {
                quest::addloot(450010);
            }
        }
    }
}
# EOF zone: soldungb ID: 32040 NPC: Lord_Nagafen