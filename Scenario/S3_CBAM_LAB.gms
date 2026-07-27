* ==============================================================================
* Scenario/S3_CBAM_LAB.gms   -> Output_w-1/4_CBAM_LAB.gdx
* EU 탄소세 + CBAM. 관세수입 전액을 z5(개도국)에 균등 배분하고,
* 수령국은 이를 CBAM 대상산업(J11) 노동세 감면(정의로운 전환) 에 사용.
* 원본: 4_Static_Model_GTAP11b_CBAM_LAB.gms
* ==============================================================================
 rcy_share('07_EU',z5) = 1/card(z5);
 rcy_lab(z5)               = 1;
$include "Scenario/Apply_Policy.gms"

loop(sim,
$include "Scenario/_CarbonPrice_Path.gms"
    SOLVE CBAM USING CNS;
$include "Results_format/CGE_Results.gms"
);
