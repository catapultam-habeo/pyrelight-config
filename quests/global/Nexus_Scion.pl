# items: 19720
sub EVENT_SAY {
    if ($text=~/Hail/i){
        quest::say("Hello $name. I do not have much time to chat. If you wish to [journey to Luclin], tell me so.");
    }
    if ($text=~/journey to Luclin/i){
        quest::say("I will teleport you to the Nexus immediately.")        
        $npc->SpellFinished(40609,$client);
    }
}