sub EVENT_DEATH {
    my $death_count = quest::get_data($instanceid . '-deathCount');

    $death_count = $death_count + 1;

    quest::set_data($instanceid . '-deathCount', $death_count, 259200);

    quest::shout("Death Count: $death_count"); 
}