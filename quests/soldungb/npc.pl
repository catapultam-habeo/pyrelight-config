
sub EVENT_DEATH_COMPLETE {
    quest::shout("test! $instanceid");
  if ($instanceid > 0) {
    quest::shout("I'm in an instance!");
  }
}