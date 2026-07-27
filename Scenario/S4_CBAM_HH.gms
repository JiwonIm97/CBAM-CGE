* ==============================================================================
* Scenario/S4_CBAM_HH.gms   -> Output_w-1/5_CBAM_HH.gdx
* EU 탄소세 + CBAM. 관세수입 전액을 z5(개도국)에 균등 배분하고,
* 수령국은 이를 가계 정액 이전(lump-sum transfer) 에 사용.
* 원본: 5_Static_Model_GTAP11b_CBAM_HH.gms
* ==============================================================================
 rcy_share('07_EU',z5) = 1/card(z5);
 rcy_hh(z5)               = 1;
$include "Scenario/Apply_Policy.gms"

loop(sim,
$include "Scenario/_CarbonPrice_Path.gms"
    SOLVE CBAM USING CNS;
$include "Results_format/CGE_Results.gms"
);
