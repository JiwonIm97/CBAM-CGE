$TITLE    CBAM model
$STITLE   World wide static CGE, modular build 
* ==============================================================================
* Run_Master.gms : 실행 진입점
* ------------------------------------------------------------------------------
* 실행:  gams Run_Master.gms lo=3
* ==============================================================================

* ------------------------------------------------------------------------------
* [1] 제어 스위치 (1 = Run, 0 = Skip)
* ------------------------------------------------------------------------------
$setglobal RUN_BENCHMARK      0
$setglobal RUN_S0_BASE        0
$setglobal RUN_S1_CBAM_EU     0
$setglobal RUN_S2_CBAM_RENEW  0
$setglobal RUN_S3_CBAM_LAB    0
$setglobal RUN_S4_CBAM_HH     1


* RUN_BENCHMARK  보정 직후 벤치마크 재현 solve 및 Walras 잔차 점검
* RUN_S0_BASE    EU 탄소세만 (CBAM 없음)
* RUN_S1_CBAM_EU CBAM 부과, 수입은 EU 가계 환류
* RUN_S2_..RENEW CBAM 수입 -> z5 재생에너지 생산보조
* RUN_S3_..LAB   CBAM 수입 -> z5 노동세 감면
* RUN_S4_..HH    CBAM 수입 -> z5 가계 정액이전

* ------------------------------------------------------------------------------
* [2] 모형 엔진 로드
* ------------------------------------------------------------------------------
$include "Sets.gms"
$include "PAR.gms"
$include "CAL.gms"
$include "Policy/Recycling.gms"
$include "Model.gms"
$include "Results_format/Declare_Results.gms"
$include "Init_Closure.gms"

* ------------------------------------------------------------------------------
* [3] 모형 선언 및 솔버 옵션
* ------------------------------------------------------------------------------
option cns = conopt4;
*option cns = path;
option limrow = 0, limcol = 0, solprint = off;
$Offlisting
$OffSymList
$Offinclude

MODEL CBAM  Static CBAM model /all/ ;
 CBAM.holdfixed = 1;
 CBAM.solvelink = 5;
 CBAM.scaleopt  = 1;
*CBAM.TOLINFREP = 0.0001;

* ------------------------------------------------------------------------------
* [4] 벤치마크 재현 및 검증 게이트
* ------------------------------------------------------------------------------
$include "Scenario/Reset_Policy.gms"

$ifthen %RUN_BENCHMARK% == 1
SOLVE CBAM USING CNS;

PARAMETER chk_LEON(z)  Walras residual at benchmark ;
 chk_LEON(z) = LEON.L(z);
 DISPLAY chk_LEON;

* 벤치마크가 재현되지 않으면 이후 시나리오는 의미가 없으므로 여기서 중단.
 ABORT$(SMAX(z, ABS(LEON.L(z))) > 1e-6)
     "Benchmark not replicated: |LEON| > 1e-6", chk_LEON;
$endif

option solprint = on;

* ------------------------------------------------------------------------------
* [5] 시나리오 실행
* ------------------------------------------------------------------------------
$include "Scenario/ScenarioList.gms"
