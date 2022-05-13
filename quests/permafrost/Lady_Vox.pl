sub EVENT_AGGRO {
  if ($instanceid > 0 and $instanceversion == 1) {
      my $death_count = quest::get_data($instanceid . '-deathCount');
      if ($death_count <= 10) {
          quest::shout("You know the rules!");
          my @npcs = $entity_list->GetNPCList();
          foreach $n (@npcs) {
              $n->Shout("TRAIN!");
              if ($n->CastToMob()->GetLevel() < 255 && $n->GetOwnerID() == 0) {
                  $n->AddToHateList($client, 100000);
                  $n->CastToMob()->SetInvul(true);
              }
          }
      }
  }
}

sub EVENT_SPAWN {   
    if ($instanceid > 0 and $instanceversion == 1) {
        quest::addloot(450011);
    }
}

# EOF zone: permafrost ID: 73057 NPC: Lady_Vox