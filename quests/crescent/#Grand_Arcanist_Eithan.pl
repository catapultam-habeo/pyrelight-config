sub EVENT_SAY {
    if ($client->GetGM()) {
        my $level_cap = quest::get_data($client->CharacterID() . "95-CharMaxLevel");
        my $nostos_init = length(quest::get_data($client->CharacterID() . "-TL"));
        
        if ($text=~/hail/i) {
            # Check to make sure that you've talked to Nostos already by seeing if your TL flag is populated.
            if ($nostos_init >= 2) {        
                # Check to see if you are sitting, because I'm a dick
                if ($client->IsSitting() ) {

                } else () {

                }
            } else {
                $client->plugin::NPCTell($npc,"Greetings, traveler. Would you like to be a test subj - [". quest::saylink("Research Assistant",1,"gaeRA1") ."]?");
            }
        } elsif ($text=~/gaeRA1/i) {
             $client->plugin::NPCTell($npc,"Wow, that actually worked");
        }
    }    
}