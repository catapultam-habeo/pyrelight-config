
sub EVENT_DEATH {
    quest::shout("test! $instanceid");
  if ($instanceid > 0) {
    quest::shout("I'm in an instance!");
  }
}