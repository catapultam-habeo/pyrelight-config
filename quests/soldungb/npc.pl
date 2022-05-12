
sub EVENT_DEATH {
  if ($instanceid > 0) {
    quest::shout("I'm in an instance!");
  }
}