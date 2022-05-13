sub EVENT_SAY {
    if ($client->GetGM()) {

        my $instance_duration = 72000;

        my $instance_zone_key = $client->CharacterID() . "-active-instance-zone";
        my $instance_id_key = $client->CharacterID() . "-active-instance-id";
        my $instance_zone = quest::get_data($instance_zone_key);
        my $instance_id = quest::get_data($instance_id_key);

        my $tier_one_taskID = 9001;
        
        my $level_cap = quest::get_data($client->CharacterID() . "-CharMaxLevel");
        my $nostos_init = length(quest::get_data($client->CharacterID() . "-TL"));
        
        if ($text=~/hail/i) {
            # Check to make sure that you've talked to Nostos already by seeing if your TL flag is populated.
            if ($nostos_init >= 2) {        
                # Check to see if you are sitting, because I'm a dick
                if ($client->IsSitting()) {
                    if (quest::get_data($instance_zone)) {
                        $client->plugin::NPCTell($npc,"I can sense the residue of an active phase rift on you. Do you need me to [". quest::saylink("collapse",1) ."] it for you?");
                    } 
                } else {
                    $client->plugin::NPCTell($npc,"Have a seat, $race. We have a lot to talk about and I prefer to stay comfortable.");
                }
            } else {
                $client->plugin::NPCTell($npc,"Greetings, traveler. Would you like to be a test subj - [". quest::saylink("gaeRA1",1,"Research Assistant") ."]?");
            }        
        } elsif ($text=~/gaeRA1/i) {
            $client->plugin::NPCTell($npc,"Yes. A research assistant. There is absolutely no danger involved at all. Please go speak to my Apprentice, Nostos, if you are interested.");
        } elsif ($text=~/gaeT1A/i) {
            $client->plugin::NPCTell($npc,"In order to expand the range of ambient energies to which the anchor can attune, I will need to integrate materials which are out of phase from our own reality. In particular, I will need you to travel through [". quest::saylink("gaeT1B",1,"phase rifts") ."], confront [". quest::saylink("gaeT1C",1,"several foes") ."], and collect objects of power which they hold.");
        } elsif ($text=~/gaeT1B/i) {
            $client->plugin::NPCTell($npc,"Other apprentices of mine will open these rifts, transporting you to a parallel world very much like this one. The exact metaphysical differences between worlds are relatively unimportant, but there are some key facts; An essence anchor is an integral part of traversing these rifts, and only a single anchor can traverse an individual rift. You must go alone.");
        } elsif ($text=~/gaeT1C/i) {
            quest::assigntask($tier_one_taskID);
            $client->plugin::NPCTell($npc,"In particular, I need you to confront [". quest::saylink("soldungb",1,"Lord Nagafen") ."], [". quest::saylink("permafrost",1,"Lady Vox") ."], and [". quest::saylink("kedge",1,"Phinigel Autropos") ."]. Where would you like to begin?");
        } elsif ($text=~/soldungb/i) {            
            $client->plugin::NPCTell($npc,"Lord Nagafen has a mystical orb he secreted away from the Ring of Scale when he was banished - it is necessary to infuse new energy into the essence anchor, among other experiments. He is located within his Lair, amid the Lavastorm Mountains.");
        } elsif ($text=~/permafrost/i) {            
            $client->plugin::NPCTell($npc,"Lady Vox is more straightforward - I need a sample of her blood to act as an alchemical reagent in the infusion process. Her Lair, known as Permafrost, is actually an Ice Giant keep in the far north of Antonica.");
        } elsif ($text=~/kedge/i) {            
            $client->plugin::NPCTell($npc,"Phinigel Autropos - the last of the Kedge. He cultivates a particular type of seaweed which happens to be my favorite garnish for seafood. Collect some for me.");
        } elsif ($text=~/collapse/i && quest::get_data($instance_zone)) {
            $client->plugin::NPCTell($npc,"No problem, research assistant. I've dispelled the residue, which will allow you to visit another of my apprentices and them open a new rift.");
            quest::delete_data($instance_zone);
            quest::delete_data($instance_id);
            quest::delete_data($instance_id . '-deathCount');                
            quest::delete_data($instance_id . '-scaled');
            quest::DestroyInstance($instance_id);
        } elsif ($text=~/gaeFear/i and ($client->IsTaskActivityActive(9001,9) or $client->IsTaskCompleted(9001))) {

            my @Data = ("fearplane", 72, 1329, -1201, 14, 412);
            my $instance_cooldown_key = $client->CharacterID() . "-" . $Data[0] . "-cooldown";
            my $instance_cooldown = quest::get_data($instance_cooldown_key);

            elsif ($instance_cooldown) {
                $client->plugin::NPCTell($npc,"I'm sorry, $name. You will need to allow your aura to clear further before I can attune you to this phase rift. It should take no longer than a day.");
                $client->Message(15,"Lockout Remaining:" . quest::secondstotime($instance_cooldown)));
            } elsif ($instance_zone eq $Data[0]) {
                $client->plugin::NPCTell($npc,"$name, you are still attuned to another phase rift. Would you like me to [". quest::saylink("collapse",1) ."] it for you?");
            } else {
                $client->plugin::NPCTell($npc,"Are you ready to challenge Cazic-Thule? I will [". quest::saylink("gaeFearOpen",1,"open the way") ."] for you.");
            }
        } elsif ($text=~/gaeHate/i and ($client->IsTaskActivityActive(9001,10) or $client->IsTaskCompleted(9001))) {

            my @Data = ("hateplaneb", 186, -393, 656, 4, 383);
            my $instance_cooldown_key = $client->CharacterID() . "-" . $Data[0] . "-cooldown";
            my $instance_cooldown = quest::get_data($instance_cooldown_key);

            elsif ($instance_cooldown) {
                $client->plugin::NPCTell($npc,"I'm sorry, $name. You will need to allow your aura to clear further before I can attune you to this phase rift. It should take no longer than a day.");
                $client->Message(15,"Lockout Remaining:" . quest::secondstotime($instance_cooldown)));
            } elsif ($instance_zone eq $Data[0]) {
                $client->plugin::NPCTell($npc,"$name, you are still attuned to another phase rift. Would you like me to [". quest::saylink("collapse",1) ."] it for you?");
            } else {
                $client->plugin::NPCTell($npc,"Are you ready to challenge Innoruuk? I will [". quest::saylink("gaeHateOpen",1,"open the way") ."] for you.");
            }
        }
    }    
}