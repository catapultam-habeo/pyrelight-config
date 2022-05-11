sub EVENT_SAY {
  if ($text=~/hail/i) && $client->GetGM() {
        $client->plugin::NPCTell($npc,"Hey Boss.");
  }	
}