sub EVENT_SAY {

    my $instKey = $client->CharacterID() . "-active-instance-zone";
    my $instIDKey = $client->CharacterID() . "-active-instance-id";

    my $charKey = $client->CharacterID() . "-Prog";
    my $charTargets = quest::get_data($charKey);
    my $InstanceID = quest::get_data($instIDKey);
    my @Data = ("soldungb", 32, -263, 424, -108);

    if (CheckForEssenceAnchor((split(/:/,quest::get_data("TLItems"))))) {       
        if ($client->IsSitting()) {
            if ($text=~/hail/i && $client->GetGM()) {
                if (quest::get_data($charKey) < 1) {                
                    $client->plugin::NPCTell($npc,"Hello, adventurer. I see that you've spoken to Nostos about our experiments with resonance translocation. That essence anchor that she provided you is quite primitive, though. I'd like your assistance in gathering the materials needed to [". quest::saylink("improve the device") ."]."); 
                }
            } elsif ($text=~/improve the device/i) {
            } elsif ($text=~/soldungb/i) {
                @Data = ("soldungb", 32, -263, 424, -108); 
                $client->plugin::NPCTell($npc,"I heard you!");
                if (!quest::get_data($instKey)) {
                    quest::set_data($instKey, "$Data[0]", 86400);
                    $InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
                    quest::set_data($instIDKey, $InstanceID, 86400);
                    $client->plugin::NPCTell($npc,$instIDKey);
                }
            }  elsif ($text=~/go/i) {
                if (quest::get_data($instKey) eq "$Data[0]") {
                    DoTeleport();
                }
            }
        } else {
            $client->plugin::NPCTell($npc,"Take a seat, $race, let's talk.");
        }        
    } elsif ($text=~/apprentice/i) {
         $client->plugin::NPCTell($npc,"Apprentice Nostos is my senior assistant, and can introduce you the work that we are doing here.");
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