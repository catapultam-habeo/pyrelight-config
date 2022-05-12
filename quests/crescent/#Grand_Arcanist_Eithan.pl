sub EVENT_SAY {
    if ($client->GetGM()) {
        if ($text=~/hail/i && ) {
            my $level_cap = quest::get_data( $client->CharacterID() . "95-CharMaxLevel");

            $client->plugin::NPCTell($npc,$level_cap);
            if ($level_cap > 1) {
                $client->plugin::NPCTell($npc,"true");
            }
            if ($level_cap > 52) {
                $client->plugin::NPCTell($npc,"false");
            }
        }
    }    
}