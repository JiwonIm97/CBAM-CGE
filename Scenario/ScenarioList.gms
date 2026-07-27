* ==============================================================================
* Scenario/ScenarioList.gms
* 시나리오 실행 목록. 새 시나리오는 Scenario/ 에 solve 파일 하나 추가하고
* 아래에 추가 생성. 모형 본체(Model.gms)는 수정하지 않음.
* ==============================================================================
$batinclude "Scenario/RunScenario.gms" %RUN_S0_BASE%       S0_BASE.gms        1_BASE
$batinclude "Scenario/RunScenario.gms" %RUN_S1_CBAM_EU%    S1_CBAM_EU.gms     2_CBAM_EU
$batinclude "Scenario/RunScenario.gms" %RUN_S2_CBAM_RENEW% S2_CBAM_RENEW.gms  3_CBAM_RENEW
$batinclude "Scenario/RunScenario.gms" %RUN_S3_CBAM_LAB%   S3_CBAM_LAB.gms    4_CBAM_LAB
$batinclude "Scenario/RunScenario.gms" %RUN_S4_CBAM_HH%    S4_CBAM_HH.gms     5_CBAM_HH
