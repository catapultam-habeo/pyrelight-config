
sub EVENT_SAY {
    if ($text=~/gandan has failed in his task/i) {
        $npc->CastToMob()->Emote("'s thoughts begin to pervade your own, they creep into your mind with great force. You feel pressure as if your head will explode. You see his thoughts becoming your own. You see in these visions a tome bound in flesh dropped to the ground. You then open your eyes to see that same book, and take it knowing that it was meant for you.");
        $client->SummonItem(18898);
    }
}

sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 8226 => 1, 18898 => 1, 18899 => 1)) {
        $npc->CastToMob()->Emote("seems pleased with the amount of pain that you have been able to inflict. Cazic Thule then grabs your hands and begins to infuse them with his power. Your hands burn like they were placed in lava for a moment, then feel cool as ice. You can feel the sheer power flowing through your new weapons of pain.");
        $client->SummonItem(7836);
        $client->AddEXP(100000);
        quest::ding();
    }
}

sub EVENT_KILLED_MERIT {
    if ($instanceid > 0 and $instanceversion == 1) {
        my @clients = $entity_list->GetClientList();
        foreach my $client (@clients) {
            if ($client->IsTaskActivityActive(9001, 9)) {
                $client->UpdateTaskActivity(9001, 9, 1);
                $client->Message(15, "Your [". quest::varlink(450001) ."] absorbs power from the fallen divine avatar.");                
            }

            quest::delete_data($instanceid . '-deathCount');
            quest::delete_data($instanceid . '-scaled');
            quest::delete_data($client->CharacterID() . "-active-instance-zone");           
            quest::delete_data($client->CharacterID() . "-active-instance-id");
        }
    }
}