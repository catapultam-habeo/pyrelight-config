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

  my $npc = $entity_list->GetNPCByNPCTypeID(394192);

  quest::debug("npc:" . $npc->GetName());  

  if ($task_id = 9001) {
    if ($activity_id = 3) {
      client->plugin::NPCTell($npc,"Perfect. This orb will form the basis of the new essence anchor. Please, hurry and obtain the remaining components.");
    }

    if ($activity_id = 4) {
      $client->plugin::NPCTell($npc,"This is exactly what I need. I'll begin working on the alchemical infusion immediately.");
    }

    if ($activity_id = 5) {
      $client->plugin::NPCTell($npc,"You thought I was serious about this? Thanks, but you need a sense of humor.");
      $npc->CastToMob()->Emote(" tosses the damp seaweed down the passageway.");
    }
  }
} 