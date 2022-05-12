sub EVENT_ENTERZONE {
  $client->Message(15, "Your InstanceID:" . $client->GetInstanceID());
  if ($client->GetInstanceID() > 0) {
    my @npc_list = $entity_list->GetNPCList();

    foreach $entity (@npc_list) {
      my $spawnpoint = $entity->GetSpawnPointID();
      quest::disable_spawn2($spawnpoint);
      quest::updatespawntimer($spawnpoint,1);
      quest::enable_spawn2($spawnpoint);
    }
  }
}