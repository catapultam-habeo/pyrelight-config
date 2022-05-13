sub EVENT_ENTERZONE {
    if ($instanceid > 0 and $instanceversion = 1 and not quest::get_data($instanceid . "-scaled")) {
        my @npcs = $entity_list->GetNPCList();
        my $hack_count = quest::get_data($client->GetIPString() . "-HackerFlag");

        foreach $npc (@npcs) {
            my $levelTarget = 55;

            my $levelScalar = $levelTarget/$npc->GetLevel() * (1+(($hack_count-3)/10)) + .5;

            $npc->ModifyNPCStat("max_hp", $npc->GetNPCStat("max_hp") * $levelScalar);
            $npc->ModifyNPCStat("ac", $npc->GetNPCStat("max_ac") * $levelScalar);
            $npc->ModifyNPCStat("atk", $npc->GetNPCStat("max_atk") * $levelScalar);
            $npc->ModifyNPCStat("max_hit", $npc->GetNPCStat("max_hit") * $levelScalar);
            $npc->ModifyNPCStat("min_hit", $npc->GetNPCStat("min_hit") * $levelScalar);

            $npc->ModifyNPCStat("str", $npc->GetNPCStat("str") * $levelScalar);
            $npc->ModifyNPCStat("sta", $npc->GetNPCStat("sta") * $levelScalar);
            $npc->ModifyNPCStat("dex", $npc->GetNPCStat("dex") * $levelScalar);
            $npc->ModifyNPCStat("agi", $npc->GetNPCStat("agi") * $levelScalar);
            $npc->ModifyNPCStat("int", $npc->GetNPCStat("int") * $levelScalar);
            $npc->ModifyNPCStat("wis", $npc->GetNPCStat("wis") * $levelScalar);
            $npc->ModifyNPCStat("cha", $npc->GetNPCStat("cha") * $levelScalar);

            $npc->ModifyNPCStat("fr", $npc->GetNPCStat("fr") * $levelScalar);
            $npc->ModifyNPCStat("cr", $npc->GetNPCStat("cr") * $levelScalar);
            $npc->ModifyNPCStat("dr", $npc->GetNPCStat("dr") * $levelScalar);
            $npc->ModifyNPCStat("pr", $npc->GetNPCStat("pr") * $levelScalar);
            $npc->ModifyNPCStat("mr", $npc->GetNPCStat("mr") * $levelScalar);

            $npc->SetLevel($levelTarget);
            $npc->SetMaxHP();

            quest::set_data($instanceid . "-scaled", 259200);           
        }
    }
}