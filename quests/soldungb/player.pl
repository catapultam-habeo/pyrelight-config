sub EVENT_ENTERZONE {
  $client->Message(15, "Your InstanceID:" . $client->GetInstanceID());
}