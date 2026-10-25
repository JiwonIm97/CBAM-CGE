* ==============================================================================
* Scenario/S2_CBAM_RENEW.gms   -> Output_w-1/3_CBAM_RENEW.gdx
* EU 탄소세 + CBAM. 관세수입 전액을 z5(개도국)에 균등 배분하고,
* 수령국은 이를 재생에너지 발전(eREN) 생산세 감면에 사용.
* ==============================================================================
 rcy_share('07_EU',z5) = 1/card(z5);
 rcy_prd(z5)               = 1;
$include "Scenario/Apply_Policy.gms"

loop(sim,
$include "Scenario/_CarbonPrice_Path.gms"
    SOLVE CBAM USING CNS;
$include "Results_format/CGE_Results.gms"
);
