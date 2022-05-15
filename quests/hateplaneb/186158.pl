sub EVENT_KILLED {
    if ($instanceid > 0 and $instanceversion == 1) {
        my @clients = $entity_list->GetClientList();
        foreach my $client (@clients) {
            quest::debug("Quest Credit:" .$client.GetName());
            if ($client->IsTaskActivityActive(9001, 10)) {
                $client->UpdateTaskActivity(9001, 10, 1);
                $client->Message(15, "Your [". quest::varlink(450001) ."] absorbs power from the fallen divine avatar.");                
            }
            
            quest::delete_data($client->CharacterID() . "-active-instance-zone");           
            quest::delete_data($client->CharacterID() . "-active-instance-id");
        }
        quest::debug("Innoruuk Killed In an Instance");
    }
    quest::debug("Innoruuk Killed");
}