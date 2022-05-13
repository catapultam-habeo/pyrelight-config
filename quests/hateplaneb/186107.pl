sub EVENT_KILLED_MERIT {
    if ($instanceid > 0 and $instanceversion == 1) {
        my @clients = $entity_list->GetClientList();
        foreach my $client (@clients) {
            if ($client->IsTaskActivityActive(9001, 10)) {
                $client->UpdateTaskActivity(9001, 10, 1);
                $client->Message(15, "Your [". quest::varlink(450001) ."] absorbs power from the fallen necromancer.");                
            }

            quest::delete_data($instanceid . '-deathCount');
            quest::delete_data($instanceid . '-scaled');
            quest::delete_data($client->CharacterID() . "-active-instance-zone");           
            quest::delete_data($client->CharacterID() . "-active-instance-id");
        }
    }
}