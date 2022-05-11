my $charKey = $client->CharacterID() . "-Prog";
my $charTargets = quest::get_data($charKey);
my $InstanceID = 0;
my @Data = undef;

my @ZoneArray =
    (
        "Permafrost",
        "Nagafen's Lair"
    );

sub EVENT_SAY {
    if (CheckForEssenceAnchor((split(/:/,quest::get_data("TLItems"))))) {       
        if ($client->IsSitting()) {
            if ($text=~/hail/i && $client->GetGM()) {
                if (quest::get_data($charKey) < 1) {                
                    $client->plugin::NPCTell($npc,"Hello, adventurer. I see that you've spoken to Nostos about our experiments with resonance translocation. That essence anchor that she provided you is quite primitive, though. I'd like your assistance in gathering the materials needed to [". quest::saylink("improve the device") ."]."); 
                }
            }
        } else {
            $client->plugin::NPCTell($npc,"Take a seat, $race, let's talk.");
        }        
    } else {
        $client->plugin::NPCTell($npc,"Hello, adventurer. Go speak to my [". quest::saylink("apprentice") ."], Nostos. After you've begun to help her, I will have a task for you.");
    }       
}

sub CheckForEssenceAnchor {		
	my @items = shift;
	
	foreach (@items) {
		if (plugin::check_hasitem($client,$_)) {
			return 1;
		}		
	}
	
	return 0;
}