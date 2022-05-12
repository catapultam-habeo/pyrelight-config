sub EVENT_ENTERZONE {
  $client->Message(15, "Your InstanceID:" . $client->GetInstanceID());
  if ($client->GetInstanceID() > 0) {
    my @npc_list = $entity_list->GetNPCList();

    foreach $entity (@npc_list) {
      quest::updatespawntimer($entity->GetSpawnPointID(), 1);
    }
  }
}