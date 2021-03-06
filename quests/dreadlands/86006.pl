#Apprentice Lariks

sub EVENT_SAY {
    
    my @Data = ("karnor", 102, 305, 14, 3, 385);
    my $instance_zone_key = $client->CharacterID() . "-active-instance-zone";
    my $instance_id_key = $client->CharacterID() . "-active-instance-id";
    my $instance_cooldown_key = $client->CharacterID() . "-" . $Data[0] . "-cooldown";
    my $instance_zone = quest::get_data($instance_zone_key);
    my $instance_id = quest::get_data($instance_id_key);
    my $instance_cooldown = quest::get_data($instance_cooldown_key);

    my $instance_duration = 72000;

    
    if ($text=~/hail/i) {
        if ($instance_zone) {
            if ($instance_zone eq $Data[0]) {
                $client->plugin::NPCTell($npc,"Hail, $name. Would you like me to [". quest::saylink("enter",1,"transport") ."] you back through the phase rift, or would you like me to [". quest::saylink("collapse",1) ."] it?");
            } else {
                $client->plugin::NPCTell($npc,"Hail, $name. I sense the residue of a phase rift on you. Before I can transport you though this one, I must [". quest::saylink("collapse",1,"dispel") ."] that residue from your aura. Would you like me to proceed?");
            }
        } elsif (quest::istaskactive(9001)) {
            if ($instance_cooldown) {
                $client->plugin::NPCTell($npc,"I'm sorry, $name. You will need to allow your aura to clear further before I can attune you to this phase rift. It should take no longer than a day.");
                $client->Message(15,"Lockout Remaining:" . quest::secondstotime($instance_cooldown));
            } else {
                $client->plugin::NPCTell($npc,"You must be Master Eithan's new test subject - He told me to expect someone to explore this phase rift. Would you like for me to [". quest::saylink("gaeLN1",1,"open the rift") ."] for you?");
            }
        } else {
            $client->plugin::NPCTell($npc,"This place smells like dogs. Wet. Dogs.");
        }
    } elsif ($text=~/collapse/i and $instance_zone) {
        $client->plugin::NPCTell($npc,"No problem, research assistant. I've dispelled the residue.");            
        quest::delete_data($instance_zone_key);           
        quest::delete_data($instance_zone_id);
        quest::DestroyInstance($instance_id);
        quest::delete_data($instance_id . '-deathCount');
        quest::delete_data($instance_id . '-scaled');
    } elsif ($text=~/gaeLN1/i) {
        my $instance_id = quest::CreateInstance($Data[0], 1, $instance_duration);            
        quest::set_data($instance_cooldown_key, 1, $instance_duration);
        quest::set_data($instance_zone_key, $Data[0], $instance_duration);
        quest::set_data($instance_id_key, $instance_id, $instance_duration);
        quest::delete_data($instance_id . '-deathCount');
        quest::delete_data($instance_id . '-scaled');
        $client->plugin::NPCTell($npc,"I've opened the rift, $name. Tell me when you are ready to [". quest::saylink("enter",1) ."]");
    } elsif ($text=~/enter/i and $instance_id) {
        quest::AssignToInstance($instance_id);
        $client->MovePCInstance($Data[1], $instance_id, $Data[2], $Data[3], $Data[4], $Data[5]);
    }
    
}