* ==============================================================================
* Scenario/S0_BASE.gms   -> Output_w-1/1_BASE.gdx
* EU 단독 탄소세, CBAM 미시행. 세수는 EU 가계로 정액 환류.
* 원본: 1_Static_Model_GTAP11b_BASE.gms
* ==============================================================================
 rcy_share('07_EU','07_EU') = 1;
 rcy_hh('07_EU')            = 1;
$include "Scenario/Apply_Policy.gms"

loop(sim,
    if(ord(sim) = 1,
        CTAX.FX(z) = 0;
        CP.FX(z)   = 0;
    else
        CTAX.FX(z)        = 0;
        CTAX.FX('07_EU')  = 0.1*ord(sim) + 0.3;
        CP.FX(z)          = 0;
    );
    SOLVE CBAM USING CNS;
$include "Results_format/CGE_Results.gms"
);
