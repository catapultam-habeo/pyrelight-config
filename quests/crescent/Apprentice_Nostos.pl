sub EVENT_SAY {
	my $cost = 100;
	my $charKey = $client->CharacterID() . "-TL";
	my $targetKey = "Locations-TL";
	my %teleport_zones = ();
	my $charTargets = quest::get_data($charKey);
	
	my $levelCap = quest::get_data($client->CharacterID() . "-CharMaxLevel");
	my $tier = 0;

	if ($levelCap == 52) {
		$tier = 0;
	} elsif ($levelCap == 60) {
		$tier = 1;
	} elsif ($levelCap == 65) {
		$tier = 2;
	} elsif ($levelCap == 70) {
		$tier = 3;
	}

	
	my $menuColor = 300;
	
	my @items = (450001,450002);
	my @cats = ("Faydwer","Antonica","Odus","Kunark","Velious","Luclin","The Planes","Taelosia","The Realm of Discord", "Wayfarer's Camps");
	
	# index databucket string format
	# shortname&tier#,category#,bypass[0-1],spellid:
	#c 0 = faydwer, 1=antonica, 2=odus, 3=kunark, 4=velious, 5 = Luclin, 6=planes, 7=taelosia, 8=discord, 9=ldon
	# character flag format
	# tier#:shortname:shortname:shortname:shortname

	my @zones = split /:/, quest::get_data($targetKey);	
	foreach $z (@zones) {
		my @token = split /&/, $z;
		my @config = split /,/, $token[1];		
		$teleport_zones{$token[0]} = \@config;	
	}
	
	if ($text=~/hail/i) {
		my $prevCat = -1;
		if (length($charTargets) >= 2) {			
			if (CheckForEssenceAnchor(\@items)) {
				if (length($charTargets) > 2) {
					$client->plugin::NPCTell($npc,"Welcome back, $name. Where would you like to go?");
					my @keys = sort { $teleport_zones{$a}[1] <=> $teleport_zones{$b}[1] } keys(%teleport_zones);					
					foreach my $t (@keys) {
						if ($t ne "" && index($charTargets, $t) != -1) {							
							my $message;
							if ($teleport_zones{$t}[1] > $prevCat) {
								$client->Message($menuColor,"-- " . $cats[$teleport_zones{$t}[1]] . " --");
							}
							my $clean_name = $t;
							$clean_name =~ s/_ldon//;
							
							$message = "-[". quest::saylink($t, 1, quest::GetZoneLongName($clean_name)) ."]-";							
							$client->Message($menuColor,$message);		
							$prevCat = $teleport_zones{$t}[1];							
						}						
					}
				} else {
					$client->plugin::NPCTell($npc,"Welcome back, $name. You have not yet attuned your [". quest::varlink($items[$tier]) ."] to any distant regions. Until you have, I can't send you anywhere through resonance translocation.");
				}
			} else {
				$client->plugin::NPCTell($npc,"I see that you've lost your [". quest::varlink($items[$tier]) ."]. I can absolutely [". quest::saylink("replace it for you",1) ."], but not for free. It will cost you ". plugin::commify($client->GetLevel() * 100 * $tier) ."pp.");
			}		
		} else {
			$client->plugin::NPCTell($npc,"Greetings, adventurer. I am Grand Arcanist Eithan's apprentice and research assistant, currently in charge of his [". quest::saylink("resonance translocation",1) ."] experiment, and am always looking for new test subjects.");
		}
	} elsif ($text=~/resonance translocation/i) {
		$client->plugin::NPCTell($npc,"Resonance translocation is a simple and efficient form of teleportation, with a significant caveat. The subject being teleported must have already established a magical resonance with the target location, typically by visting that location and meditating upon the unique energies of the area. This is a time-consuming and difficult to learn method of meditation. Fortunately for you, We have developed a [". quest::saylink("workaround",1) ."].");
	} elsif ($text=~/workaround/i ) {
		if (length($charTargets) >= 2) {
			$client->plugin::NPCTell($npc,"I've already provided you with a [". quest::varlink($items[0]) ."]. Go out and explore the world, find locations of suitable resonance. If somehow you've lost your essence anchor, just let me know and I can [". quest::saylink("replace it for you",1) ."] for only the cost of materials - ". plugin::commify($cost * 1000) ."pp.");
		} else {
			$client->SummonItem($items[$tier]);
			quest::set_data($charKey,"0:everfrost_ldon:butcher_ldon:nro_ldon:sro_ldon:ecommons_ldon:");
			$client->plugin::NPCTell($npc,"Here, take this [". quest::varlink($items[0]) ."]. It is device that I've designed to simulate personal attunement, and has two main functions. First, you can activate it yourself to return here at any time. Second, if you visit a region with particularly strong unique essential resonance, it will store enough information about that attunement to allow me to send you back there.'");
		}			
	} elsif ($text=~/replace it for you/i) {
		if (CheckForEssenceAnchor(@items) == 0 && $client->TakeMoneyFromPP($client->GetLevel() * 1000 * 100 * $tier, 1)) {
			$client->Message(2, "You paid ". plugin::commify($client->GetLevel() * 100 * $tier) ."pp for [". quest::varlink($items[$tier]) ."].");
			$client->SummonItem($items[$tier]);
			$client->plugin::NPCTell($npc,"Here. You are lucky that I like you.");
		} elsif (CheckForEssenceAnchor(@items)) {
			$client->plugin::NPCTell($npc,"You already have an essence anchor. If you are looking for an upgrade, go talk to Grand Arcanist Eithan.");
		} else {
			$client->plugin::NPCTell($npc,"You don't have enough money to pay for the replacement [". quest::varlink($items[$tier]) ."]. Come back when you can afford it.");
		}
	} elsif (exists($teleport_zones{$text}[3])) {
		if ($client->TakeMoneyFromPP($cost * 100, 1)) {
			$client->Message(2, "You paid ". plugin::commify($cost) ."pp.");
			my @phrases = split(/:/,quest::get_data("TLPhrases"));
			if ($#phrases > 0) {
				$npc->Say($phrases[plugin::RandomRange(0, $#phrases)]);
			}
			$npc->SpellFinished($teleport_zones{$text}[3],$client);
		} else {
			$client->plugin::NPCTell($npc,"I'm sorry, but the reagents needed to initiate the resonance translocation are not free. Come see me when you can the afford ". plugin::commify($cost) ."pp for the trip.");
		}
	} 
}

sub CheckForEssenceAnchor {		
	my $items = $_[0];
	
	foreach $a (@$items) {
		quest::debug("Checking:" . $a . ":" . plugin::check_hasitem($client,$a));
		if (plugin::check_hasitem($client,$a) > 0) {
			return 1;
		}		
	}
	
	return 0;
}
