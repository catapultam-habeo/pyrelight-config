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

  if ($task_id = 9001) {
    if ($activity_id == 3) {
      $client->plugin::NPCTell($npc,"Perfect. This orb will form the basis of the new essence anchor. Please, hurry and obtain the remaining components.");
    }

    if ($activity_id == 4) {
      $client->plugin::NPCTell($npc,"This is exactly what I need. I'll begin working on the alchemical infusion immediately.");
    }

    if ($activity_id == 5) {
      $client->plugin::NPCTell($npc,"You thought I was serious about this? Thanks, but you need a sense of humor.");
      $npc->CastToMob()->Emote(" tosses the damp seaweed down the passageway.");
    }

    if ($client->IsTaskActivityActive(9001, 6)) {
      $client->plugin::NPCTell($npc,"You've brought me everything that I need to start building the [". quest::varlink("450002") ."]. While I work on this, I need you to use your [". quest::varlink("450001") ."] to gather the necromatic energy surrounding two powerful undead. My apprentices will meet you outside of Karnor's Castle and Old Sebilis. Good luck.");
    }

    if ($activity_id == 8) {
      $client->plugin::NPCTell($npc,"$name! You've done wonderful work. I've constructed the [". quest::varlink("450013") ."], now all that we need is to infuse it powerful essence. The Planes of [". quest::saylink("gaeFear",1,"Fear") ."] and [". quest::saylink("gaeHate",1,"Hate") ."] are closely connected to this world, I can open rifts to either, phased to realities where the divine avatars present will be within the realm of your abilities to defeat. Do not be under any illusion that the actual avatars of these Gods would not swat you like flies - but these aspects extend into realities where their power is somewhat weaker.");
    }

    if ($activity_id == 11) {
      $client->plugin::NPCTell($npc,"My favorite research assistant returns! Allow me moment to use the energies you've collected to empower your new essence anchor. When you are ready, check back with me to see if have more work for you.");
      $npc->CastToMob()->Emote(" carefully brings the two essence anchors together. A powerful energy arcs between them, and the Rudimentary Essence Anchor quickly falls to into dust.");

      $client->SummonItem(450002);

      my $key = $client->CharacterID() . "-CharMaxLevel";

      #quest::set_data($key,60);
      #$client->Message(15, "Your level cap has been set to 60.");
      #quest::worldwidemessage(335, "$name has completed 'A Song of Dragons and Fish' and unlocked level 60.");
    }
  }
} 