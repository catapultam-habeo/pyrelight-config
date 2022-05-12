sub EVENT_AGGRO {
  if ($instanceid > 0 and $instanceversion = 1) {
      my $death_count = quest::get_data($instanceid . '-deathCount');
      if ($death_count <= 10) {
          quest::shout("You know the rules!");
          my @npcs = $entity_list->GetNPCList();
          foreach $n (@npcs) {
              $n->Shout("TRAIN!");
              if ($n->CastToMob()->GetLevel() < 255 && $n->GetOwnerID() == 0) {
                  $n->AddToHateList($client, 100000);
              }
          }
      }
}

sub EVENT_KILLED_MERIT {
    if ($instanceid > 0 and $instanceversion = 1) {
        my @clients = $entity_list->GetClientList();
        foreach my $client (@clients) {
            if ($client->IsTaskActivityActive(9001, 6)) {
                $client->UpdateTaskActivity(9001, 6, 1);
                $client->Message(15, "Your [". quest::varlink(450001) ."] absorbs power from the fallen necromancer.");
            }
        }
    }
}