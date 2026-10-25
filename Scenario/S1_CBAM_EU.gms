* ==============================================================================
* Scenario/S1_CBAM_EU.gms   -> Output_w-1/2_CBAM_EU.gdx
* EU 탄소세 + CBAM 부과. 관세수입은 EU 가계로 정액 환류.
* ==============================================================================
 rcy_share('07_EU','07_EU') = 1;
 rcy_hh('07_EU')            = 1;
$include "Scenario/Apply_Policy.gms"

loop(sim,
$include "Scenario/_CarbonPrice_Path.gms"
    SOLVE CBAM USING CNS;
$include "Results_format/CGE_Results.gms"
);
