sub EVENT_SAY {
  

    if ($client->GetGM()) {
        if ($text=~/hail/i) {
            $client->NPCTell($npc,"Hey Boss");
        }
    }
}