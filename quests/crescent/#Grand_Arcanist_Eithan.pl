sub EVENT_SAY {

    if (CheckForEssenceAnchor((split(/:/,quest::get_data("TLItems"))))) {       
        if ($client->IsSitting()) {
            if ($text=~/hail/i && $client->GetGM()) {
                if (quest::get_data($charKey) < 1) {                
                    $client->plugin::NPCTell($npc,"Hello, adventurer. I see that you've spoken to Nostos about our experiments with resonance translocation. That essence anchor that she provided you is quite primitive, though. I'd like your assistance in gathering the materials needed to [". quest::saylink("improve the device",1) ."]."); 
                }
            } elsif ($text=~/improve the device/i) {
                $client->plugin::NPCTell($npc, "This may sound far fetched, but the ideal essence anchor does not exist entirely within this reality. The rudimentary version that Nostos gave you does, but to allow it to attune to more esotetic environmental auras will require more [". quest::saylink("exotic materials",1) ."].");
            } elsif ($text=~/exotic materials/i) {
                $client->plugin::NPCTell($npc, "To improve your anchor, I need you to gather objects of power held by a number of ancient and powerful individuals - foes to you, all. There is a twist, however; I need objects out of phase with our own reality - objects from alternate worlds. If you have already attuned your anchor to nearby locations, I can [". quest::saylink("open a rift",1) ."] to these alternate worlds for you, however you must go alone, the rift cannot accomodate additional travelers.");
            }elsif ($text=~/open a rift/i) {
                #Assign Task Here
                $client->plugin::NPCTell($npc, "The first objects are held by [". quest::saylink("Lord Nagafen",1) ."], [". quest::saylink("Lady Vox",1) ."], and [". quest::saylink("Phinigel Autropos",1) ."]. Which will you pursue first?");
            } 
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            elsif ($text=~/soldungb/i) {                 
                $client->plugin::NPCTell($npc,"I heard you!");
                if (!quest::get_data($instKey)) {
                    quest::set_data($instKey, "$Data[0]", 86400);
                    $InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
                    quest::set_data($instIDKey, $InstanceID, 86400);
                    $client->plugin::NPCTell($npc,$instIDKey);
                }
            }  elsif ($text=~/go/i) {
                if (quest::get_data($instKey) eq "$Data[0]") {
                    quest::AssignToInstance($InstanceID);
                    $client->MovePCInstance($Data[1], $InstanceID, $Data[2], $Data[3], $Data[4], 0);
                }
            }
        } else {
            $client->plugin::NPCTell($npc,"Take a seat, $race, let's talk.");
        }        
    } elsif ($text=~/apprentice/i) {
         $client->plugin::NPCTell($npc,"Apprentice Nostos is my senior assistant, and can introduce you the work that we are doing here.");
    } else {
        $client->plugin::NPCTell($npc,"Hello, adventurer. Go speak to my [". quest::saylink("apprentice",1) ."], Nostos. After you've begun to help her, I will have a task for you.");
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