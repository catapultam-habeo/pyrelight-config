sub EVENT_SAY {
	my $cost = 5000000;
	my @items = (split(/:/,quest::get_data("TLItems")));	
	my %planes = ( "Hate"     => "pohateb",
				   "Sky"      => "airplane",
				   "Fear"     => "fearplane",
				   "Growth"   => "growthplane",
				   "Mischief" => "mischiefplane");
				   
	my %spells = ( "pohateb"       => 666,
				   "airplane"      => 674,
				   "fearplane"     => 42605,
				   "growthplane"   => 42603,
				   "mischiefplane" => 42604 );

	my $charKey = $client->CharacterID() . "-Kakra";
	my $talked = quest::get_data($charKey);

		
	if ($text=~/hail/i) {
		if ($talked < 1) {
			$client->plugin::NPCTell($npc, "Welcome back, $name. Do you need me to send you to [". quest::saylink("Hate",1) ."], [". quest::saylink("Sky",1) ."], [". quest::saylink("Fear",1) ."], [". quest::saylink("Growth",1) ."], or [". quest::saylink("Mischief",1) ."]? Or did you did need me to explain about the [". quest::saylink("disjoint planes",1) ."] again?");
		} else {
			$client->plugin::NPCTell($npc, "Greetings, $name. I am Kakra, and I research the [". quest::saylink("disjoint planes",1) ."].");
		}
	} elsif ($text=~/disjoint planes/i) {
		$client->plugin::NPCTell($npc, "The disjoint planes - Hate and Sky - and the [". quest::saylink("direct planes",1) ."] - Fear, Growth, and Mischief - are an enigma among planar researchers. They posess a lower energy state than all but the weakest [". quest::saylink("Adjacent Planes",1) ."], yet are the home to some of strongest of the Gods. My work focuses on discovering the metaphysical and quasimagical attributes and implications of these planes, and what kind of power we can gather to the Reach by exploiting their properties.");
	} elsif ($text=~/direct planes/i) {
		$client->plugin::NPCTell($npc, "The direct planes - Fear, Growth, and Mischief are a potentially more interesting mystery. Unlike the [". quest::saylink("adjacent planes",1) ."], they connect directly to the Prime Material - in direct contravention to all prediction models of multiversal formation theory! They posess strong quasimagical alignments, and until the discovery of the portal to Fear in the Feerrott, it was thought by all experts that this would prevent any direct connection to the mortal realms.");
	} elsif ($text=~/adjacent planes/i) {
		$client->plugin::NPCTell($npc, "The adjacent planes are those accessible through the Realm of Quellious - The Plane of Tranquility. Tranquility is quasimagically neutral, and can connect naturally to the other higher planes.. except the direct ones. Tranquility itself can be reached by mortals through Knowledge, the plane which otherwise most closely touches the Prime Material, allowing mortals and paramortals alike access. The disjoint planes are a problem, though, and special magics are [". quest::saylink("required to travel",1) ."] to them.");
	} elsif ($text=~/required to travel/i) {
		$client->plugin::NPCTell($npc, "Arcanists of the Reach have long understood the magics needed to transport individuals to [". quest::saylink("Hate",1) ."] and to [". quest::saylink("Sky",1) ."], but it was not until the developments in resonance translocation pioneered by Grand Arcanist Eithan that regular travel to these realms became practical. While the planes of [". quest::saylink("Fear",1) ."], [". quest::saylink("Growth",1) ."], and [". quest::saylink("Mischief",1) ."] are accessible from the mortal realms, but similar magics can transport you to them. I can provide you with travel to any of the disjoin or direct planes, and assuming that you've acquired an [". quest::varlink($items[0]) ."] from Apprentice Nostos that is capable of attuning your essence to that plane, she will be able to assist you in returning there in the future. Be warned, however - do not seek to challenge the Gods of these planes. They are significantly stronger than you would otherwise expect if you judge by the other denizens of their planes.");
		quest::set_data($charkey,1);
	} elsif (exists($planes{$text})) {
		$client->plugin::NPCTell($npc, "You wish to travel to the [". quest::saylink($planes{$text},1,"Plane of " . $text) ."]? As I said, I can assist with that. There will be a cost for reagents and my time, however - ". plugin::commify($cost/1000) ."pp.");
	} elsif (exists($spells{$text})) {
		if ($client->TakeMoneyFromPP($cost/1000, 1)) {
			$client->Message(2, "You paid ". plugin::commify($cost/1000) ."pp.");
			my @phrases = split(/:/,quest::get_data("TLPhrases"));
			$npc->Say("Good luck, $name. You'll need it.");
			$npc->SpellFinished($spells{$text},$client);
		} else {
			$client->plugin::NPCTell($npc,"I'm sorry, but the reagents needed to initiate the translocation are not free. Come see me when you can the afford ". $cost/1000 ."pp for the trip.");
		}
	}	
}
