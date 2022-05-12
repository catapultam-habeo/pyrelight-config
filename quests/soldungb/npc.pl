sub EVENT_DEATH_COMPLETE {
    my $death_count = quest::get_data($instanceid . 'deathCount', 259200);

    $death_count = $death_count + 1;

    quest::Shout("Death Count: $death_count"); 
}