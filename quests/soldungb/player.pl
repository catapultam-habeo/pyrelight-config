sub EVENT_ENTERZONE {
  my @npc_list = $entity_list->GetNPCList();
  foreach my $npc_entity (@npc_list) {
      if $client->GetInstanceID() {
          if ($npc_entity->GetLevel() < 255) {
              $npc_entity->Shout("Hello!");
          }
      }
  }
}