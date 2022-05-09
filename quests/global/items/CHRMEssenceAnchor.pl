sub EVENT_SCALE_CALC {
	my $charKey = $client->CharacterID() . "-TL";	
	my @items = (split(/:/,quest::get_data($charKey)));	
	
	my $len = @items  - 6;
	
	$questitem->SetScale($len/5)
}