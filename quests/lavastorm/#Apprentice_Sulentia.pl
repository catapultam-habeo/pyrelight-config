sub EVENT_SAY {
    
    my @Data = ("soldungb", 32, -217, -437, -108, 257);

    my $instance_zone = quest::get_data($client->CharacterID() . "-active-instance-zone");
    my $instance_id = quest::get_data($client->CharacterID() . "-active-instance-id");

    my $instance_cooldown = quest::get_data($client->CharacterID() . "-" . $Data[1] . "-cooldown");
    

    if ($client->GetGM()) {
        if ($text=~/hail/i) {
            $client->NPCTell($npc,"Hey Boss");
        }
    }
}