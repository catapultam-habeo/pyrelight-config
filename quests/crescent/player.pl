sub EVENT_ENTERZONE {
  if(($ulevel >= 15) && (!defined($qglobals{Wayfarer})) && ($client->GetStartZone()==$zoneid)) {
    $client->Message(15, "A mysterious voice whispers to you, 'Vladnelg Galvern has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
  }

  my $key = $client->CharacterID() . "-CharMaxLevel";

  if (quest::get_data($key) == "") {
        quest::set_data($key,52);
        $client->Message(15, "Your level cap has been set to 52.");
  }
}

sub EVENT_TASK_STAGE_COMPLETE {
	# Player-EVENT_TASK_STAGE_COMPLETE
	# Exported event variables
	quest::debug("task_id " . $task_id);
	quest::debug("activity_id " . $activity_id);

  if ($task_id = 9001 and $activity_id = 3) {
    $client->plugin::NPCTell($npc,"Perfect. This orb will form the basis of the new essence anchor. Please, hurry and obtain the remaining components.");
  }

  if ($task_id = 9001 and $activity_id = 4) {
    $client->plugin::NPCTell($npc,"This is exactly what I need. I'll begin working on the alchemical infusion immediately.");
  }

  if ($task_id = 9001 and $activity_id = 5) {
    $client->plugin::NPCTell($npc,"You thought I was serious about this? Thanks, but you need a sense of humor.");
    $npc->CastToMob()->Emote(" tosses the damp seaweed down the passageway.");
  }

  if $($client->IsTaskActivityActive(9001,6)) {
    $client->plugin::NPCTell($npc,"You've collected everything we need for the next step. While I continue to work on the framework for the new anchor, I need you to take your existing equipment and harvest several dimension-phased undead essences. My apprentices await you outside of Karnor's Keep and Old Sebilis.");
  }
} 