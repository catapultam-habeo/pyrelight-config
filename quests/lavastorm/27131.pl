sub EVENT_SAY {
    if ($text=~/hail/i) {
        $client->plugin::NPCTell($npc,"Hey");
    }
}