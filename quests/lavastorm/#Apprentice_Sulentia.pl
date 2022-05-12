sub EVENT_SAY {
    
    my @Data = ("soldungb", 32, -217, -437, -108, 257);

    my $instance_zone = quest::get_data($client->CharacterID() . "-active-instance-zone");
    my $instance_id = quest::get_data($client->CharacterID() . "-active-instance-id");

    my $instance_cooldown = quest::get_data($client->CharacterID() . "-" . $Data[1] . "-cooldown")
    

    if ($client->GetGM()) {
        if ($text=~/hail/i) {
            
                $client->plugin::NPCTell($npc,"Be careful! I'm waiting for someone, and can't afford you to attract the attention of creatures here. There could be Orcs... or Dragons... or Bunnies!");
           
        } elsif ($text=~/collapse/i and $instance_zone) {
            $client->plugin::NPCTell($npc,"No problem, research assistant. I've dispelled the residue, which will allow you to visit another of my apprentices and them open a new rift.");
            if ($instance_zone) {
                quest::delete_data($instance_zone);
            }
            if ($instance_id) {
                quest::delete_data($instance_id);
                quest::DestroyInstance($instance_id)
            }
        } elsif ($text=~/gaeLN1/i) {
            my $InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
            quest::set_data($client->CharacterID() . "-active-instance-zone", "soldungb", 86400);
            quest::set_data($client->CharacterID() . "-active-instance-id", "$InstanceID", 86400);
            $client->plugin::NPCTell($npc,"I've opened the rift, $name. Tell me when you are ready to [". quest::saylink("enter",1) ."]");
        } elsif ($text=~/enter/i and $instance_id) {
            quest::AssignToInstance($instance_id);
            $client->MovePCInstance($Data[1], $instance_id, $Data[2], $Data[3], $Data[4], $Data[5]);
        }
    }
}