sub EVENT_SPAWN
{
        EVAL_PET($npc);
}

sub EVENT_SPAWN_ZONE
{
        EVAL_PET($npc);
}

sub EVENT_DEATH {    
    quest::shout("I died!");
}

sub EVAL_PET
{
        my $pet = shift;
        if ($pet->GetOwnerID()) {
                my $owner = $entity_list->GetClientByID($pet->GetOwnerID());

                my $owner_level = $owner->GetLevel();
                my $owner_spelldmg = ($owner->GetSpellDmg()/200) + 1;
                my $ostr = $owner->GetSTR();
                my $osta = $owner->GetSTA();
                my $odex = $owner->GetDEX();
                my $oagi = $owner->GetAGI();
                my $oint = $owner->GetINT();
                my $owis = $owner->GetWIS();
                my $ocha = $owner->GetCHA();

                $pet->SetLevel($owner_level*.95);

                $pet->ModifyNPCStat("max_hp", $owner_level * 100 * ($owner_spelldmg));
                $pet->ModifyNPCStat("ac", $owner_level * 10 * ($owner_spelldmg));
                $pet->ModifyNPCStat("atk", $owner_level * 1 * ($owner_spelldmg));
                $pet->ModifyNPCStat("accuracy", $owner_level * 1 * ($owner_spelldmg));
                $pet->ModifyNPCStat("avoidance", $owner_level * 1 * ($owner_spelldmg));
                $pet->ModifyNPCStat("max_hit", $owner_level * 2 * ($owner_spelldmg));
                $pet->ModifyNPCStat("min_hit", $owner_level * 0.5 * ($owner_spelldmg));
                $pet->ModifyNPCStat("hp_regen_rate", $owner_level * 0.5 * ($owner_spelldmg));

                $pet->ModifyNPCStat("str", $ostr/2 * ($owner_spelldmg));
                $pet->ModifyNPCStat("sta", $osta/2 * ($owner_spelldmg));
                $pet->ModifyNPCStat("dex", $odex/2 * ($owner_spelldmg));
                $pet->ModifyNPCStat("agi", $oagi/2 * ($owner_spelldmg));
                $pet->ModifyNPCStat("int", $oint/2 * ($owner_spelldmg));
                $pet->ModifyNPCStat("wis", $owis/2 * ($owner_spelldmg));
                $pet->ModifyNPCStat("cha", $ocha/2 * ($owner_spelldmg));

                $pet->ModifyNPCStat("fr", $owner->GetFR()/2 * ($owner_spelldmg));
                $pet->ModifyNPCStat("cr", $owner->GetCR()/2 * ($owner_spelldmg));
                $pet->ModifyNPCStat("dr", $owner->GetDR()/2 * ($owner_spelldmg));
                $pet->ModifyNPCStat("pr", $owner->GetPR()/2 * ($owner_spelldmg));
                $pet->ModifyNPCStat("mr", $owner->GetMR()/2 * ($owner_spelldmg));

                $pet->ModifyNPCStat("spellscale",$owner->GetSpellDmg());
                $pet->ModifyNPCStat("healscale",$owner->GetHealAmt());
                $pet->ModifyNPCStat("runspeed", 2.5);

                $pet->ChangeSize(5 * ($owner_spelldmg/2));

                $pet->SetMaxHP();
        }
}


