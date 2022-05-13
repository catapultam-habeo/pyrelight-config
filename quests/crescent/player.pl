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

ub EVENT_TASK_STAGE_COMPLETE {
	# Player-EVENT_TASK_STAGE_COMPLETE
	# Exported event variables
	quest::debug("task_id " . $task_id);
	quest::debug("activity_id " . $activity_id);

  $client->(15,"$activity_id");
} 