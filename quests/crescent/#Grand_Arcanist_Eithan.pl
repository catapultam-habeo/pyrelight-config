my $tier_one_taskID = "450000";

sub EVENT_SAY {
    if ($client->GetGM()) {
        my $level_cap = quest::get_data($client->CharacterID() . "-CharMaxLevel");
        my $nostos_init = length(quest::get_data($client->CharacterID() . "-TL"));
        
        if ($text=~/hail/i) {
            # Check to make sure that you've talked to Nostos already by seeing if your TL flag is populated.
            if ($nostos_init >= 2) {        
                # Check to see if you are sitting, because I'm a dick
                if ($client->IsSitting()) {
                    if ($level_cap <= 52  {
                        if (quest::istaskactive($tier_one_taskID)) {

                        } else {
                            $client->plugin::NPCTell($npc,"Let's get down to buisness. Nostos gave you a [". quest::varlink("450001") ."], but it has some serious limitations, and I need your help to improve it. I need you to gather some [". quest::saylink("exotic materials",1,"gaeT1A") ."] for me in order to proceed.");
                        }
                    } elsif ($level_cap <= 60) {
                        $client->plugin::NPCTell($npc,"My favorite research assistant! The next experiment isn't ready yet, but I'll have something for you soon.");
                    } elsif ($level_cap <= 65) {
                        $client->plugin::NPCTell($npc,"My favorite research assistant! The next experiment isn't ready yet, but I'll have something for you soon.");
                    } elsif ($level_cap <= 70) {
                        $client->plugin::NPCTell($npc,"My favorite research assistant! The next experiment isn't ready yet, but I'll have something for you soon.");
                    }
                } else {
                    $client->plugin::NPCTell($npc,"Have a seat, $race. We have a lot to talk about and I prefer to stay comfortable.");
                }
            } else {
                $client->plugin::NPCTell($npc,"Greetings, traveler. Would you like to be a test subj - [". quest::saylink("Research Assistant",1,"gaeRA1") ."]?");
            }
        } elsif ($text=~/gaeRA1/i) {
             $client->plugin::NPCTell($npc,"Yes. A research assistant. There is absolutely no danger involved at all. Please go speak to my Apprentice, Nostos, if you are interested.");
        } elsif ($text=~/gaeT1A/i) {
             $client->plugin::NPCTell($npc,"");
        }
    }    
}