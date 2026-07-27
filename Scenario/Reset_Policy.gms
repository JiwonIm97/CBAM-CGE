* ==============================================================================
* Scenario/Reset_Policy.gms
* 시나리오 간 오염 방지: 모든 정책 스위치와 도구변수를 벤치마크 상태로 되돌림.
* 매 시나리오 solve 파일 앞에서 호출.
* ==============================================================================
* --- 환류 스위치 ---
 rcy_share(z,zj) = 0;
 rcy_hh(z)  = 0;   rcy_gov(z) = 0;
 rcy_lab(z) = 0;   rcy_prd(z) = 0;

* --- 탄소가격 ---
 CTAX.FX(z) = CTAX0(z);
 CP.FX(z)   = 0;

* --- 환류 도구변수: 전 영역 고정(=비활성) ---
 ttip.FX(j,z)          = ttipO(j,z);
 ttiw.FX(l,j,z)        = ttiwO(l,j,z);
 deltattip.FX(j,z)     = 0;
 deltattiw.FX(l,j,z)   = 0;
 ttip_share.FX(j,z)    = ttip_shareO(j,z);
 ttiw_share.FX(l,j,z)  = ttiw_shareO(l,j,z);
