sub EVENT_SPAWN
{ 
	EVAL_PET($npc);
}

sub EVENT_SPAWN_ZONE
{
	if ($npc->GetOwnerID()) {
		$npc->ChangeSize($scalefactor + 6);
	}
}

sub EVAL_PET
{	
	my $pet = shift;	
	if ($pet->GetOwnerID()) {
		my $owner = $entity_list->GetClientByID($pet->GetOwnerID());		
		
		my $ostr = $owner->GetSTR();
		my $osta = $owner->GetSTA();
		my $odex = $owner->GetDEX();
		my $oagi = $owner->GetAGI();
		my $oint = $owner->GetINT();
		my $owis = $owner->GetWIS();
		my $ocha = $owner->GetCHA();		

		my $scalefactor = ((($ostr+$osta+$odex+$oagi+$oint+$owis+$ocha)/7)/100)-1;
		
		if ($scalefactor < 1) {
			$scalefactor = 1;
		}		
		
		
					
		$pet->ModifyNPCStat("max_hp",$pet->GetMaxHP()*($scalefactor*2));
		$pet->ModifyNPCStat("max_hit",$pet->GetMaxDMG()*$scalefactor);
		$pet->ModifyNPCStat("min_hit",$pet->GetMinDMG()*$scalefactor);
		$pet->ModifyNPCStat("ac",$pet->GetAC()*$scalefactor);
		$pet->ModifyNPCStat("spellscale",$pet->GetSpellScale()*$scalefactor);
		$pet->ModifyNPCStat("healscale",$pet->GetSpellScale());
		$pet->ModifyNPCStat("runspeed", 2.5);
	
		$pet->ChangeSize($scalefactor + 6);
			
		$pet->SetMaxHP();		
	}
}

