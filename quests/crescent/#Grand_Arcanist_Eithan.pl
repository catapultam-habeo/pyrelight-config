my $charKey = $client->CharacterID() . "-TL";
my $InstanceID = 0;
my @Data = undef;

my @anchors = (split(/:/,quest::get_data("TLItems")));

my @ZoneArray =
    (
        "Permafrost",
        "Nagafen's Lair"
    );

sub EVENT_SAY {
  if (~$client->GetGM()) {
      $client->plugin::NPCTell($npc,"Hello, adventurer. I'm not ready yet. Blame Sshantrel for continuing to bother Catapultam.");
  }


  if ($text=~/hail/i && $client->GetGM()) {
        $client->plugin::NPCTell($npc,"Hey Boss.");
        if ($client->IsSitting())
        {
            if (CheckForEssenceAnchor(@anchors)) {
                $client->plugin::NPCTell($npc,"Hello, adventurer. I see you've spoken to Nostos about our experiments with resonance translocation. That essence anchor that she provided you is quite primitive, though. I'd like your assistance in gathering the materials needed to [". quest::saylink("improve the device") ."]."); 
            }
            else {
                $client->plugin::NPCTell($npc,"Hello, adventurer. Go speak to my [". quest::saylink("apprentice") ."], Nostos. After you've begun to help her, I will have a task for you.");
            }
        } else {
            $client->plugin::NPCTell($npc,"Take a seat, $race, let's talk.");
        }        
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