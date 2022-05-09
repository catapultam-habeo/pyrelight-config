sub EVENT_SAY {
  if ($text=~/hail/i) {
	$client->plugin::NPCTell($npc, "Greetings, $name, and welcome to Pyrelight. My job is to familiarize you with the basics of this realm, especially in regard to what might work differently than you expect. Ask me about the [". quest::saylink("rules",1) ."], [". quest::saylink("custom mechanics",1) ."], [". quest::saylink("getting around",1) ."], [". quest::saylink("bots",1) ."], [". quest::saylink("boxing",1) ."], or [". quest::saylink("progression and level caps",1) ."]. I would also recommend that you join our Discord, information located in the MOTD.");
  } elsif ($text=~/rules/i) {
		$client->plugin::NPCTell($npc, "On Pyrelight, MQ2 is allowed for macros and 'passive' abilities, such as viewing nearby creatures on your map. If you use it for 'active' abilities, such as /warp, /zone, /ghost, etc, these abilities will be detected an logged. If you use them to excess, you may suffer an automatic penalty. Occasionally, normal in-game activities may be detected as a false positive, you will be warned when this is happening. If you are concerned that you are accumulating too many false-positive detections, please reach out to a GM on discord.");
		$client->plugin::NPCTell($npc, "Otherwise, we ask that you simply behave as a kind human being to others.");
  } elsif ($text=~/custom mechanics/i) {
		$client->plugin::NPCTell($npc, "On Pyrelight, several things work differently than other servers. Here are the notable highlights.");
		$client->plugin::NPCTell($npc, "Equipment is significantly more powerful than you might normally expect.");
		$client->plugin::NPCTell($npc, "There are no Lore items, but you may only have one example of any given item or augment equipped at a time.");
		$client->plugin::NPCTell($npc, "Spell Damage and Heal Amount stats on equipment improve your spells and procs by a percentage value, not a flat amount.");
		$client->plugin::NPCTell($npc, "Heal Amount will increase the damage absorption capabilities of all Rune-type spells.");
		$client->plugin::NPCTell($npc, "Spell Damage will increase the effectiveness of damage shields");
		$client->plugin::NPCTell($npc, "Detrimental spells cast on players, bots, or the bots of either will automatically 'pass through' to your target's target. The inverse happens to beneficial spells. If you've played EQ2, this is similar to 'implied targeting' there.");
		$client->plugin::NPCTell($npc, "Buffs are permanent, but will fade when you are no longer grouped with someone capable of casting that buff.");
		$client->plugin::NPCTell($npc, "'Spell Power' (the average of your Spell Damage and Heal Amount stats) will increase the capabilities of your pet. This is in addition to any Pet Focus that you might have.");
		$client->plugin::NPCTell($npc, "Some pets will innately hold aggro, even over other players in melee range of their opponent. Some pets will be innately ignored by mobs, even if they would normally be attacked by them. Pets which do not have either of these intrinsic characteristics may toggle their ability to hold aggro over players by activating or deactivating their 'Taunt' ability.");
	} elsif ($text=~/getting around/i) {
		$client->plugin::NPCTell($npc, "The Plane of Knowledge is accessed only through the Nexus. You may travel there from any Nexus spire in Norrath.");
		$client->plugin::NPCTell($npc, "If you proceed past the city of Cresecent Reach and follow the path that you'd expect to travel in order to reach the Blightfire Moors, you will reach Highpass instead. You can continue to any place you'd like from there.");
		$client->plugin::NPCTell($npc, "Magus Nostos in the city of Cresecent Reach can assist you in traveling, it is highly advised you speak to her before leaving this zone.");
	} elsif ($text=~/bots/i) {
		$client->plugin::NPCTell($npc, "You may recruit up to three companions, and have up to two with you at any time to assist you with your adventures. The command ^botcreate help will assist you in recruiting them, and ^help will assist you in giving them orders. The class selection among these companions is more limited than you would expect, but all races may be any available class.");
		$client->plugin::NPCTell($npc, "Unlike on other realms, your companions may make use of equipment with focus effects and spell damage or heal amount statistics.");
	} elsif ($text=~/boxing/i) {
		$client->plugin::NPCTell($npc, "You may only play one character at a time on Pyrelight. If you need additional simultaneous character slots due to others in your household, please reach out for an exemption. Some flags and unlocked abilities will be unlocked account-wide, however.");
	} elsif ($text=~/progression and level caps/i) {
		$client->plugin::NPCTell($npc, "Pyrelight has a character progression system based around level caps, rather than zone locks. You must complete the tasks that Grand Arcanist Eithan puts before you in order to unlock additional levels past 52.");
		$client->plugin::NPCTell($npc, "Currently, the maximum level is 52, due to the first tier of progression tasks not being fully implemented.");
	}
}
sub EVENT_ITEM {
  plugin::return_items();
}