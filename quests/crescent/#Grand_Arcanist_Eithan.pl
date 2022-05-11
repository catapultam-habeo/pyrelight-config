sub EVENT_SAY {
  if ($text=~/hail/i) {
    if ($client->GetGM()) {
        $client->plugin::NPCTell($npc,"Hey Boss.");
    } else {
        $client->plugin::NPCTell($npc, "Greetings, $name. I'm not ready for you yet.");
    }
  }	
}